# chiara.rasi@igp.uu.se
# 2013-02-26
# compares a genotype file (illumina SNP array in Nexus format) against a folder containing other genotype files (Nexus format). Script prints out the samples which have similarity to the given sample (above a custom threshold).

#NOTE that the files MUST have the same genome build!!

use strict;
use warnings;
use Cwd;
use Math::Round;

my $infile="/home/chiara/Desktop/1428_72.txt";
my $compareFolder="/home/chiara/Desktop/temp_testGT"; 
my $GTcolumn=4;
my $chrom= "chr22";
my $similariryThreshold=80;
my $sameGT=0;
my $nans=0;

#cycle over the samples' folder and get the sample names inside an array:
opendir DH, $compareFolder or die "Cannot open $compareFolder: $!";
my @files = grep(/\.txt$/,readdir(DH));
@files=sort(@files);
closedir DH;
print "\n".@files." sample files in this folder..\n";

#write minifiles with position on given chromosome and BAF value for infile sample:
my @cmd=("bash", "-c", "gawk -F, ' BEGIN{FS=\"\t\"; OFS=\"\t\"} { if(\$1==\"$chrom\") print \$2,\$4}' $infile > miniInfile.txt");
system(@cmd);

#open minifile and call genotype for the probes on given chromosome
open (MINI, "< miniInfile.txt") or die "Can not read fileminiInfile.txt: $! \n";
my @minifile_contents = <MINI>; # read entire contents of file
close (MINI);

my %positionGT=();
my $GT="";

foreach my $line (@minifile_contents)
{
	print $line;
	chomp $line;

	my @cols=split("\t",$line);
	if($cols[1]<=0.2)
	{
		$GT="AA";
	}
	elsif($cols[1]>=0.8)
	{
		$GT="BB";
	}
	elsif($cols[1]>=0.4 && $cols[1]<=0.6)
	{
		$GT="AB";
	}
	else
	{
		$GT="NC";
	}				
	$positionGT{$cols[0]}=$GT;
	
}

my $fileCounter=0;
foreach my $file (@files) 
{
	$fileCounter++;
	#write minifile for file $file:
	my $sampleName=substr $file, 0, rindex($file,'.');

	#print "$sampleName\n";
	@cmd=("bash", "-c", "gawk -F, ' BEGIN{FS=\"\t\"; OFS=\"\t\"} { if(\$1==\"$chrom\") print \$2,\$4}' $compareFolder/$file > $sampleName.minifile.txt");
	system(@cmd);

	#compare Gtypes:
	#open minifile for sample $sampleName and compare Gtypes at shared positions:

	open(MINITEMP, "< $sampleName.minifile.txt");
	my @minitempcontents = <MINITEMP>; # read entire contents of file
	close (MINITEMP);

	my $totSharedLoci=0;
	$sameGT=0;
	$nans=0;

	foreach my $line (@minitempcontents)
	{
		chomp $line;
		my @cols=split("\t",$line);
		if (exists $positionGT{$cols[0]})
		{
			$totSharedLoci++;
			#print "position found ->$cols[0]. GT1:$positionGT{$cols[0]}\n";
			if($cols[1]<=0.2)
			{
				$GT="AA";
			}
			elsif($cols[1]>=0.8)
			{
				$GT="BB";
			}
			elsif($cols[1]>=0.4 && $cols[1]<=0.6)
			{
				$GT="AB";
			}
			else
			{
				$GT="NC";
			}				

			if($GT eq $positionGT{$cols[0]})
			{
				$sameGT++;
			}
			elsif($GT eq "NC" || $positionGT{$cols[0]} eq "NC")
			{
				$nans++;
			}
			else
			{}

		}

	}
	my $res=nearest(.01, $sameGT*100/($totSharedLoci-$nans));

	if($res >= $similariryThreshold)
	{ 
		print "\n$res % similarity with $sampleName!!\n";
	}
	else 
	{
		print "$res %\n";
	}

	system("rm $sampleName.minifile.txt");
}	
	
system("rm miniInfile.txt");
	



 
