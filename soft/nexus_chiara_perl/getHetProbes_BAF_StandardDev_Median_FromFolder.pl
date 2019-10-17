# chiara.rasi@igp.uu.se
# 2011-10-04
# Cycles over a folder of files and for each file (sample) computes:

# n. of probes inside a given aberration (hence excluded from further statistics).
# n. of homozygous probes.
# n. of heterozygous probes.
# Standard deviation from heterozygous probes.
# Median from heterozygous probes.

# prints out the results to a file ($outDir/$outFile)


use strict;
use warnings;
use Statistics::Descriptive;

my $inDir="/home/chiara/Documents/lavoro/genpat/algorithms/check_gtype_same_ind/compare_ulsam_years_apart_diff_platforms/ulsam_oldest/ulsam_illumina1M_rawdata"; #advance cohort
my $outDir="/home/chiara/Documents/lavoro/genpat/algorithms/calculateBAFDev";

my $outFile="AdvanceSamplesWithBafDev.txt";

my $header="Sample\tprobes in aberration\tHom probes\tHet probes\tStd Het probes\tMedian Het probes\n";

opendir DH, $inDir or die "Cannot open $inDir: $!";
my @files = grep(/\.txt$/,readdir(DH));
closedir DH;

my $fileCounter=0;

open(OUT,">>$outDir/$outFile") || die("This file will not open!");
print OUT  $header;
close(OUT);

foreach my $file (@files) 
{
	$fileCounter++;
	my $sampleName=""; #remove after ulsam.

	if(1==1)
	{
		print "***file ".$fileCounter."--->".$file."***\n";
		my @bafValues;
		my @homProbes;
		my @probesAbb;
		open(FILE,"$inDir/$file") or die "coudn't open $file!\n";

		my $lineCounter=0;
		while (my $line=<FILE>)
		{
			$lineCounter++;
			chomp $line;
			my @fields=split('\t',$line);
			#SATSA infiles have BAF on column 6:
			
			my $sampleName=$fields[0];
			
			#remove or silence if you have no aberrated regions to exclude from statistics.
			if($lineCounter>1)
			{ 
				if($fields[1] eq "5" && $fields[2]>71440000 && $fields[2]<71653000)
				{
					push(@probesAbb,$fields[5]);
				}
				if($fields[1] eq "8" && $fields[2]>76580000)
				{
					push(@probesAbb,$fields[5]);
				}
				if($fields[1] eq "9" && $fields[2]>70000000)
				{
					push(@probesAbb,$fields[5]);
				}
				if($fields[1] eq "13" && $fields[2]>48885000 && $fields[2]<50782000)
				{
					push(@probesAbb,$fields[5]);
				}
				if($fields[1] eq "14" && $fields[2]>62237000)
				{
					push(@probesAbb,$fields[5]);
				}
				if($fields[1] eq "17" && $fields[2]<21450000)
				{
					push(@probesAbb,$fields[5]);
				}
				if($fields[1] eq "21" && $fields[2]>30745000 && $fields[2]<31626000)
				{
					push(@probesAbb,$fields[5]);
				}
				elsif($fields[5]>0.2 && $fields[5]<0.8) #heteroz probes
				{
					push(@bafValues,$fields[5]);
				}
				else	#homoz probes
				{
					push(@homProbes,$fields[5]);
				}
				
			}
			
		
		}
		close(FILE);
		#print "$lineCounter\n";	

		#calculate standard dev:
		my $stat = Statistics::Descriptive::Full->new();
		$stat->add_data(@bafValues); 
		my $std  = $stat->standard_deviation();
		#print "STD=$std\n";
		my $median=$stat->median();

		print substr($file,0,-13)."\t".$std."\t".$median."\n";
		open(OUT,">>$outDir/$outFile") || die("This file will not open!");
		#my $header="Sample\tHom probes\tHet probes\tStd Het probes\tMedian Het probes\n";
		#print OUT substr($file,0,-13)."\t".scalar(@homProbes)."\t".scalar(@bafValues)."\t".$std."\t".$median."\n"; #applies for other infiles:
		print $sampleName."\t".scalar(@probesAbb)."\t".scalar(@homProbes)."\t".scalar(@bafValues)."\t".$std."\t".$median."\n";
		print OUT $sampleName."\t".scalar(@probesAbb)."\t".scalar(@homProbes)."\t".scalar(@bafValues)."\t".$std."\t".$median."\n";
		close(OUT);
	
		print "****************************************\n";
	
	}
}
