# chiara.rasi@igp.uu.se
# 2011-12-07
# compares genotypes of two samples even if they're genotyped on different Illumina platforms.
# Does not need genotype calls (AA,AB,BB), and does not need a column with SNP names.
# IMPORTANT: samples can be genotyped on different platform but chromosome build MUST be the same!!
# Infiles are Nexus infiles:

#	9 useless lines but 4rth is the platform used for genotyping, then:
#	|Sample Name|Chr|Position|Log R Ratio|B Allele Freq| followed by the values

use strict;
use Math::Round;

my $probesFile1=0;
my $probesFile2=0;
my @gts1;
my @gts2;
my @file1_contents;
my @file2_contents;
my $nans=0;

my $aa=0.2;
my $bb=0.8;
my $sameGT=0;

my $sample1="Sweden_Breast_Cancer_Nexus_nexus_input_0_5395697039.txt";
my $sample2="Sweden_Breast_Cancer_Nexus_nexus_input_0_5395697039_(copy).txt";

# 1) go in inDir (from shell) and replace all spaces in infiles with underscores:
# ls *.txt |perl -ne 'use File::Copy;chomp;$old=$_;s/\s+/_/g;move($old,$_);'

#create 2 new files with 2 fields only: |chr:Position|B Allele Freq| 
system("awk -F'\\t' 'BEGIN{OFS=\"\\t\";} {print \$2\":\"\$3,\$5;}' $sample1 > sample1.txt");
system("awk -F'\\t' 'BEGIN{OFS=\"\\t\";} {print \$2\":\"\$3,\$5;}' $sample2 > sample2.txt");

#remove the first 10 lines of each file:
system("sed -i '1,10d' sample1.txt");
system("sed -i '1,10d' sample2.txt");

#sort files by first column:
system("sort -t '\t' -u -k 1,1 sample1.txt > sample1_sorted.txt");
system("sort -t '\t' -u -k 1,1 sample2.txt > sample2_sorted.txt");

#remove chromosomal positions not shared among the 2 files:
#use file1 to filter file2:
system("awk 'BEGIN{FS=\"\t\"; OFS=\"\t\"}  FNR==NR{f1[\$1];next}\$1 in f1' sample1_sorted.txt sample2_sorted.txt > sample2.txt");
#use file2_filtered to filter file1:
system("awk 'BEGIN{FS=\"\t\"; OFS=\"\t\"}  FNR==NR{f1[\$1];next}\$1 in f1' sample2.txt sample1_sorted.txt > sample1.txt");

#remove temp sample files:
system("rm sample1_sorted.txt");
system("rm sample2_sorted.txt");


#infiles should be ok now, check genotype similarity!

#open and cycle over lines of file 1:
open (FILE1, "< sample1.txt") or die "Can not read file $sample1: $! \n";
my @file1_contents = <FILE1>;
close (FILE1);

#open and cycle over lines of file 2:
open (FILE2, "< sample2.txt") or die "Can not read file $sample2: $! \n";
my @file2_contents = <FILE2>;
close (FILE2);

my $length1 = $#file1_contents;
my $length2 = $#file2_contents;

if($length1!=$length2)
{
	die "\n\nsorry,this can't work, the files have a different number of probes: $length1/$length2\n\n";
}
else
{
	foreach my $line1 (@file1_contents)
	{
		chomp($line1);
		my @file1Cols=split('\t',$line1);     
		if($file1Cols[1] eq 'NC')
		{
			push(@gts1, $file1Cols[1]);    
		}
		elsif($file1Cols[1]<=$aa) #aa
		{
			push(@gts1, 'AA');    
		}
		elsif($file1Cols[1]>=$bb) #bb
		{
			push(@gts1, 'BB');    
		}
		else #ab
		{
			push(@gts1, 'AB');    
		}    		
	}
	
	foreach my $line2 (@file2_contents)
	{
		chomp($line2);
		my @file2Cols=split('\t',$line2);
		if($file2Cols[1] eq 'NC')
		{
			push(@gts2, $file2Cols[1]);    
		}
		elsif($file2Cols[1]<=$aa) #aa
		{
			push(@gts2, 'AA');  
		}
		elsif($file2Cols[1]>=$bb) #bb
		{
			push(@gts2, 'BB');  
		}
		else #ab
		{
			push(@gts2, 'AB');  
		}         
	}

	for(my $i = 0; $i <=@gts1; $i++) 
	{
		my $gt1=$gts1[$i];
		my $gt2=$gts2[$i];
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
			#different GT
		}
					
	}
	my $res=nearest(.01, $sameGT*100/($length1-$nans));
	print "\n\n--------   ".$res."% of similarity  ---------\n\n";

}

#remove temp sample files:
system("rm sample1.txt");
system("rm sample2.txt");


