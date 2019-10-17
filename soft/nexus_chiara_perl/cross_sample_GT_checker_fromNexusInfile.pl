# chiara.rasi@igp.uu.se
# 2011-05-24
# Compares the genotypes of all samples whithin a folder, printing a cross-paired result table.
# input string in the path to the folder containing the samples and the number of column with genotype data --> ex. for column 3 input is 2
# all samples should be .txt files with the same markers (same platform) ordered in the same way.

use strict;
use Math::Round;

#print "\nfull path to files to be checked (ex. /home/chiara/Documents/samples) :\n";
#my $pathToDir= <>;
#chomp $pathToDir;
#print "\nColumn containing genotype data (for column 5 input is 4) :\n";
#my $GTcolumn= <>;
#chomp $GTcolumn;

my $pathToDir= "/media/chiara/SEAGATE5/Carcinoid_Omni2.5_July2013_RAW";
my $GTcolumn=5;


#cycle over the samples' folder and get the sample names inside an array:
opendir DH, $pathToDir or die "Cannot open $pathToDir: $!";
my @files = grep(/\.txt$/,readdir(DH));
@files=sort(@files);
my @vsFiles=@files;
closedir DH;
print "\n".@files." sample files in this folder..\n";
my $fileCounter=0;
my $lineCounter=0;
my @sampleNames;
foreach my $file (@files) 
{
	push(@sampleNames, substr $file, 0, rindex($file,'.'));
	$fileCounter++;
	#print "$file\n";
}
print "\n";
my @vsSamples=@sampleNames;

foreach my $sample (@sampleNames) 
{
	print "$sample\n";
}
print "\n\n";
my @gts1;
my @gts2;

my $gt1="";
my $gt2="";
my $probesInChrom=0;

my $fileIndex=0;
my $vsFileIndex=0;

my @comparisonz;
my $sameGT=0;
my $nans=0;


foreach my $file (@files) 
{
	#open file and check against the sample in the (index+1) of the @vsFiles array:
	my @vsResults;
	
	foreach my $vsFile (@vsFiles) 
	{
		if($vsFileIndex>$fileIndex)
		{
			print "checking $sampleNames[$fileIndex] VS $vsSamples[$vsFileIndex]....\n";
			
			
			open (FILE1, "< $pathToDir/$file") or die "Can not read file $file: $! \n";
			my @file1_contents = <FILE1>; # read entire contents of file
			close (FILE1);

			open (FILE2, "<  $pathToDir/$vsFile") or die "Can not read file $vsFile: $! \n";
			my @file2_contents = <FILE2>; # read entire contents of file
			close (FILE2);

			my $length1 = $#file1_contents; # number of lines in first file
			my $length2 = $#file2_contents; # number of lines in second file

			if($length1!=$length2)
			{
				die "the files have a different number of rows: $length1/$length2\n";
			}
			else
			{
				$probesInChrom=0;
				$lineCounter=0;
				foreach my $line1 (@file1_contents)
				{
					$lineCounter++;
					my @file1Cols=split('\t',$line1);    
					if($lineCounter>=11)
					{
						chomp($line1);
						$probesInChrom++;
						if($file1Cols[$GTcolumn]<=0.2)
						{
							$gt1="AA";
						}
						elsif($file1Cols[$GTcolumn]>=0.8)  
						{
							$gt1="BB";
						}
						elsif ($file1Cols[$GTcolumn]>=0.4 && $file1Cols[$GTcolumn]<=0.6)
						{
							$gt1="AB";
						}
						else
						{
							$gt1="NC";
						}   
						push(@gts1, $gt1);    	
					}	
				}
				$lineCounter=0;
				foreach my $line2 (@file2_contents)
				{
					$lineCounter++;
					my @file2Cols=split('\t',$line2);

					if($lineCounter>=11)
					{
						chomp($line2);
						
						if($file2Cols[$GTcolumn]<=0.2)
						{
							$gt2="AA";
						}
						elsif($file2Cols[$GTcolumn]>=0.8)  
						{
							$gt2="BB";
						}
						elsif ($file2Cols[$GTcolumn]>=0.4 && $file2Cols[$GTcolumn]<=0.6)
						{
							$gt2="AB";
						}
						else
						{
							$gt2="NC";
						}   
						push(@gts2, $gt2);      
					}       
				}

				for(my $i = 0; $i <=@gts1; $i++) 
				{
					$gt1=$gts1[$i];
					$gt2=$gts2[$i];
					if($gt1 ne "NC" && $gt2 ne "NC" && $gt1 eq $gt2)
					{
						$sameGT++;
					}
					elsif($gt1 eq "NC" || $gt2 eq "NC")
					{
						$nans++;
					}
					else
					{
						#different
					}
					
				}
				my $res=nearest(.01, $sameGT*100/($length1-$nans));
				#my $res=nearest(.01, $sameGT*100/($probesInChrom-$nans));			
				print "--------   ".$res."%   ---------\n";
				push (@vsResults, $res."%");
			}
			$sameGT=0;
			@gts1=();
			@gts2=();
			$nans=0;
		}
		else
		{
			push(@vsResults, '-');
		}
		$vsFileIndex++;
	}
	$vsFileIndex=0;
	push @comparisonz, [ @vsResults ];
	@vsResults=();
	$fileIndex++;
}

my $outFile="Genotype_control_BCsamples_20130517_26.txt";
open(OUT, ">>$pathToDir/$outFile"); #write a file apart with the sample list

#print results to table:
print OUT "\t";
for my $samples (@sampleNames) 
{
	print OUT "$samples\t";
}
print OUT "\n";
for my $i ( 0 .. $#comparisonz ) 
{
	print OUT "$sampleNames[$i]\t";
        my $cref = $comparisonz[$i];
        for my $j ( 0 .. $#{$cref} ) 
	{
            print OUT"$comparisonz[$i][$j]\t";
        }
	print OUT "\n";
 }

close (OUT);

print "result file printed to:$pathToDir/$outFile\n\n";
