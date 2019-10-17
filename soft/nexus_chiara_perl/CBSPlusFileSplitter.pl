# chiara.rasi@igp.uu.se
# splits a complete Illumina output file with the following format:
# Index| Probe_name | Chr | Pos | sample1_Gtype | sample1_LRR | sample1_BAF | sample2_Gtype | sample2_LRR | sample2_BAF | ..
# into one file for each sample, with the following format:
# Index| Probe_name | Chr | Pos | samplex_Gtype | samplex_LRR | samplex_BAF |

#and creates a list containing the all sample names.

# please note that you should run replace all spaces with underscores in the input file's header before-->see the following one-line script!

use strict;

my $hugeFile="JD7_110324_CBS-plus-format.txt";  #input file here
my $samplesFile="/home/chiara/Documents/genpat/scripts/perl/ULSAM_298_4lars/samplesList.txt";											 #output file with sample list
my $outDir="/home/chiara/Documents/genpat/scripts/perl/ULSAM_298_4lars/";													 #directory for output files
my $sampleCounter=0;
my $rows=0;
my $substrIndex=4;
my @array;
my @commonCols;
my @fileNames;
my $cmd1="gawk '{gsub(\" \",\"'_'\");print}' ";
my $cmd="gawk ' BEGIN{FS=\"\t\"; OFS=\"\t\"} {print ";
print "samples of interest (separated by space):";
my @chosenSamples=split(/\s+/, <>);
my @splittedFiles;

# 1) go in inDir (from shell) and replace all spaces in infiles names with underscores:
# ls *.txt |perl -ne 'use File::Copy;chomp;$old=$_;s/\s+/_/g;move($old,$_);'

$rows=0;
open(FILE,"$hugeFile");
while (my $line=<FILE>)
{	
	if($rows==0)
	{
		chomp $line;
		my @fields=split('\t',$line);
		#print @fields."\n";
		foreach(@fields)
		{	
			my $dot=index($_,"\.");
			if ($dot ge 0)# if it's a sample get its name
                	{
				print $_."\n";
				push(@array, substr($_,0,$dot));
                	}
			else
			{	
				push(@commonCols,$_)
			}
		}
		#print @array."\n";

		#remove duplicates and create files:
		foreach my $filename( @array )
		{
			$filename =~ s/DJ2_//g;
			print "$filename\n";
   			if ( ! grep( /$filename/, @fileNames ) )
			{
      				push( @fileNames, $filename );
     			}
   		}
		print "\n".@fileNames." samples in this file\n";
	}
	$rows++;
}
close(FILE);
#if user has chosen custom samples to extract (instead of all the ones on the huge file) then extract just those:
my @appoSamples;
if(@chosenSamples>0)
{
	foreach my $name (@fileNames) 
	{
		foreach my $sample(@chosenSamples)
		{
			if($name =~ m/$sample/)
			{
				push(@appoSamples,$name);
			}
		}
	}
	@fileNames=@chosenSamples;
}
@fileNames=@appoSamples;
#set up command-line for creating files and columns:
my $count=0;
for ($count = 1; $count < @commonCols+1; $count++)
{
	#print "here\n";
	$cmd=$cmd."\$".$count.",";
}

open(SAMPLEFILE, ">>$samplesFile"); #write a file apart with the sample list

#for each sample create a text file with the first common columns (@commonCols) and the sample-related columns:
my $fileNameCounter=0;
foreach my $filename(@fileNames)
{
	$fileNameCounter++;
	print "$fileNameCounter: $filename\n";
	my @sampleCols;
	my $columnCount=0;
	my @allCols=(@commonCols,@array);
	foreach my $column(@allCols)
	{
		$columnCount++;
		my $index=index($column,$filename); 
		if ($index == 0)# fixed, before if was if($index ge 0)
                {
                        print "Found the String!".$columnCount."\n";
			push(@sampleCols,$columnCount);
			
                }
	}
	#add the columns with sample data to the command line:
	my $cmd2=$cmd;
	for ($count = 0; $count < @sampleCols; $count++)
	{
		$cmd2=$cmd2."\$".$sampleCols[$count].",";
	}
	#print $cmd2."\n";
	$cmd2=substr($cmd2, 0, -1)."}' ".$hugeFile." > ";
	print $cmd2."\n";
	open(FILE,"$hugeFile");
	#create text file:
	system ($cmd2.$outDir.$filename.".txt");										
	close(FILE);	
	
	print SAMPLEFILE $filename."\n"; #write sample name onto sample-list file
}

close(SAMPLEFILE);


