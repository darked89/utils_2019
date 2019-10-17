# Masterpiece of code by Chiara Rasi, chiara.rasi@igp.uu.se, to be runned on Unix OS
# Input of the script is path to the folder containing the Nexus-formatted infiles, generated with plugin.
# LRR column, BAF column are the columns in the files cointaining LRR and BAF data.
# produces file BAF_infile.txt, LRR_infile.txt
# user must later change the name into:
# Tumor_LogR.txt, Tumor_BAF.txt or
# Germline_LogR.txt, Germline_BAF.txt
# according to the nature of the samples.
# tip: insert all tumor-like or germline-like samples in two distinct initial directories!!
# tip n.2: split the infiles into several folders and process max 30 files per run (1M probes), otherwise ASCAT runs out of memory!!!

use strict;
use warnings;

# 1) go in inDir (from shell) and replace all spaces in infiles with underscores:
# ls *.txt |perl -ne 'use File::Copy;chomp;$old=$_;s/\s+/_/g;move($old,$_);'

# 2) go in inDir (from shell) and create common file with first 3 columns SNPs (empty), chromosome and position, starting from line 10, same for LRR
# perl -lane 'print "$F[1]\t$F[2]"; close  ARGV if eof' Sweden_Breast_Cancer_Nexus_nexus_input_4_5395697055.txt > BAF_infile.txt

# 3) same for LRR
# perl -lane 'print "$F[1]\t$F[2]"; close  ARGV if eof' Sweden_Breast_Cancer_Nexus_nexus_input_4_5395697055.txt > LRR_infile.txt

my $tobeProcessed=15; #=infiles to be processed each run of the script. (IMPORTANT!!! NO MORE THAN 30!!!)

my $inDir="tumor_raw"; 	#change this if files are somewhere else".
my $header="SNPs\tchr\tpos";
my $fileCounter=0;
my $sample="";

opendir DH, $inDir or die "Cannot open $inDir: $!";
my @files = grep(/\.txt$/,readdir(DH));
closedir DH;

#4
my $colCounter=2;
my $bafCol=0;
my $lrrCol=0;

foreach my $file (@files) #column 0 is sample_name, 3 is LRR, 4 is BAF
{	

	if($file =~ m/\d/ && $fileCounter<$tobeProcessed)	#is one of the infiles
	{

		#open file to get sample name, in order to populate the header:
		open(FILE, "< $inDir/$file") or die "Can not read file $file: $! \n";
		my @lines= <FILE>; # read entire contents of file
		my $count=0;
		foreach my $line (@lines)
		{
			if($count==11)
			{
				chomp($line);
				my @fileCols=split('\t',$line);
				$sample=$fileCols[0];
				print "sample is $sample\n";
			}
			$count++;
		}
		close(FILE);

		#add name of this sample to the general header:
		$header="$header\t$sample";
	
		$bafCol=$colCounter+5;
		$lrrCol=$colCounter+4;

		print "$file\n";
		#merge BAF file and $file, 
		system("paste $inDir/BAF_infile.txt $inDir/$file > $inDir/BAF_infile_temp.txt"); 
		#now BAF_infile_temp.txt has: 3 + $colCounter + 5 cols!

		#do same for LRR
		system("paste $inDir/LRR_infile.txt $inDir/$file > $inDir/LRR_infile_temp.txt"); 

		#remove BAF_infile.txt:
		system("rm  $inDir/BAF_infile.txt");
	
		#remove LRR_infile.txt:
		system("rm  $inDir/LRR_infile.txt");

		#remove extra columns from BAF_infile_temp.txt and produce BAF file 
		system("cut -f1-$colCounter,$bafCol $inDir/BAF_infile_temp.txt > $inDir/BAF_infile.txt");

		#create LRR file at this point, as for BAF file above:
		system("cut -f1-$colCounter,$lrrCol $inDir/LRR_infile_temp.txt > $inDir/LRR_infile.txt");

		#remove BAF_infile_temp.txt	
		system("rm  $inDir/BAF_infile_temp.txt");

		#remove LRR_infile_temp.txt	
		system("rm  $inDir/LRR_infile_temp.txt");
		
		$colCounter++;
		
		
	}
	$fileCounter++; #counts files only, each file has 5 cols
	print "####### SAMPLE N.: $fileCounter  ##########\n";
}

$fileCounter=0;

foreach my $file (@files) #rename as file.done files already processed:
{
	if($file =~ m/\d/ && $fileCounter<$tobeProcessed)	#is one of the infiles
	{
		system("mv $inDir/$file $inDir/$file".".done");
	}
	$fileCounter++;
}	


#add newLine to the header:
#$header="$header";

#remove carriage returns (\r) from BAF file:
system("cat $inDir/BAF_infile.txt | tr -d \"\r\" > $inDir/BAF_infile_temp.txt");

#remove carriage returns (\r) from LRR file:
system("cat $inDir/LRR_infile.txt | tr -d \"\r\" > $inDir/LRR_infile_temp.txt");

#remove BAF_infile.txt
system("rm  $inDir/BAF_infile.txt");

#remove LRR_infile.txt
system("rm  $inDir/LRR_infile.txt");

#remove the first 10 lines in BAF_infile_temp.txt
system("sed '1,10d' $inDir/BAF_infile_temp.txt > $inDir/BAF_infile.txt");

#remove the first 10 lines in LRR_infile.txt
system("sed '1,10d' $inDir/LRR_infile_temp.txt > $inDir/LRR_infile.txt");

#add a first column to files, containing SNPS with ascending numbers
system("awk '{printf \"SNP\%s\\t\%s\\n\",NR,\$0}' $inDir/BAF_infile.txt > $inDir/BAF_infile_temp.txt");
system("awk '{printf \"SNP\%s\\t\%s\\n\",NR,\$0}' $inDir/LRR_infile.txt > $inDir/LRR_infile_temp.txt");

#add right header to the BAF file:
system("sed '1 i $header' $inDir/BAF_infile_temp.txt > $inDir/BAF_infile.txt ");

#add right header to the LRR file:
system("sed '1 i $header' $inDir/LRR_infile_temp.txt > $inDir/LRR_infile.txt ");

#remove BAF_infile_temp.txt	
system("rm  $inDir/BAF_infile_temp.txt");

#remove LRR_infile_temp.txt	
system("rm  $inDir/LRR_infile_temp.txt");










