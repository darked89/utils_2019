# chiara.rasi@igp.uu.se
# 2012-11-13
# Compares the genotypes of 2 samples which have been genotyped on 2 different Illumina whole genome genotyping arrays. 
# It works also if the results are in 2 different genome builds, imagine! :)
# Infiles are CBS+ files with SNP names on the 2 column. (On column 1 if you count columns from 0!) 

use strict;
use warnings;
use Cwd;
use Math::Round;


#1) determine on which columns of the 2 infiles the genotypes for the sample is:

my $infile1="/home/chiara/Desktop/EI11_120523_CBS_Plus_PCF_noSpaces.txt";
my $infile2="/home/chiara/Desktop/20morelessevents1MDuo_CBSPlus_nospaces.txt";
my $sampleCol1=0;
my $sampleCol2=0;
my $chrom="";
my $sample1="";
my $sample2="";

print "which chromosome (1-22) do you wish to test? (tip: big chromosomes take more time to be tested!): ";
my @inputChrom=split(/\s+/, <>);
$chrom=$inputChrom[0];

print "check for sample name in header of file 1, sample to search:";
my @inputName=split(/\s+/, <>);
$sample1=$inputName[0];

my $lineCounter=0;
my @header1;
my @header2;


open(CBS1,"$infile1") or die "Cannot open $infile1: $!";
#search sample name in header and return the column number:
while(my $line=<CBS1>)
{
	chomp $line;
	if($lineCounter==0)
	{
		print $line;
		@header1=split('\t',$line);
		last;
	}
	$lineCounter++;
}
close(CBS1);

print "\n------------------\nheader of file 1 has ".scalar(@header1)." elements\nSample name matched the following columns:\n";
$lineCounter=0;
foreach my $elem (@header1)
{
	if(grep (/$inputName[0]/, $elem ))
	{
		print "[$elem]		col:$lineCounter\n";
	}

	$lineCounter++;
}

print "select right column number for sample in file 1:";
@inputName=split(/\s+/, <>);
$sampleCol1=$inputName[0]+1;

print "check for sample name in header of file 2, sample to search:";
@inputName=split(/\s+/, <>);
$sample2=$inputName[0];

$lineCounter=0;
open(CBS2,"$infile2") or die "Cannot open $infile2: $!";
#search sample name in header and return the column number:
while(my $line=<CBS2>)
{
	chomp $line;
	if($lineCounter==0)
	{
		print $line;
		@header2=split('\t',$line);
		last;
	}
	$lineCounter++;
}
close(CBS2);

print "\n------------------\nheader of file 2 has ".scalar(@header2)." elements\nSample name matched the following columns:\n";
$lineCounter=0;
foreach my $elem (@header2)
{
	if(grep (/$inputName[0]/, $elem ))
	{
		print "[$elem]		col:$lineCounter\n";
	}

	$lineCounter++;
}

print "select right column number for sample in file 2:";
@inputName=split(/\s+/, <>);
$sampleCol2=$inputName[0]+1;

print "sample is in col $sampleCol1 (file1) and $sampleCol2 (file2)\n";

my $wd=getcwd;

#write minifiles with probeName and genotype on chromosome $chrom only for this sample:
my @cmd=("bash", "-c", "gawk -F, ' BEGIN{FS=\"\t\"; OFS=\"\t\"} { if(\$4==$chrom) print \$2,\$$sampleCol1}' $infile1 > $wd/tempFilez/miniFile1.txt");
system(@cmd);

@cmd=("bash", "-c", "gawk -F, ' BEGIN{FS=\"\t\"; OFS=\"\t\"} { if(\$4==$chrom) print \$2,\$$sampleCol2}' $infile2 > $wd/tempFilez/miniFile2.txt");
system(@cmd);

# write a file with: shared probe | Genotype on file 1 | Genotype on file 2 from minifile1 and 2:
# (working code: join -o 1.2,1.x?,2.Y? -j 2 <(sort -k 2,2 file1.txt) <(sort -k 2,2 file2.txt) >out.txt --> probe name should be on col n.2!

my $mergedFile="$wd/tempFilez/".$sample1."_vs_".$sample2."_chr$chrom.txt";

@cmd = ("bash", "-c","join -o 1.1,1.2,2.2 -j 1 <(sort -k 1,1 $wd/tempFilez/miniFile1.txt) <(sort -k 1,1 $wd/tempFilez/miniFile2.txt) > $mergedFile");
system(@cmd);

#check for the number of shared probes on this chromosome:

my $badProbes=0;
my $allprobes=0;
my $sameGT=0;
my @cells;

open(MERGED,"$mergedFile") or die "Cannot open $mergedFile: $!";
while(my $line=<MERGED>)
{
	chomp $line;
	@cells=split(' ',$line);

	#print $cells[1]."\t".$cells[2]."\n";
	if($cells[1] eq "NC" || $cells[2] eq "NC")
	{
		$badProbes++;
	}
	else
	{
		if($cells[1] eq $cells[2])
		{
			$sameGT++;
		}
	}
	$allprobes++;
}
close(MERGED);

print "n. of shared probes on 2 platforms (chr $chrom):	$allprobes\n";
print "n. of probes for comparison:	   	       ".($allprobes-$badProbes)."\n";
print "Probes with same genotype:		     $sameGT (".nearest(.01, $sameGT*100/($allprobes-$badProbes))." %)\n";

#remove minifiles, don't neet them anymore!
system("rm $wd/tempFilez/miniFile1.txt"); 
system("rm $wd/tempFilez/miniFile2.txt");



 







