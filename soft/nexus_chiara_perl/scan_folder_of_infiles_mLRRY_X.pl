# chiara.rasi@igp.uu.se
# 2013/07/05

use strict;
use warnings;
use Statistics::R;

my $inFolder="Link_to_PIVUS_rawdata";
#cycle over the samples' folder and get the sample names inside an array:
opendir DH, $inFolder or die "Cannot open $inFolder: $!";
my @files = grep(/\.txt$/,readdir(DH));
@files=sort(@files);
closedir DH;
print "\n".@files." sample files in this folder..\n";
my $outFile="pivus_out.txt";

#calculate mLRRY for each of these samples:
my $fileCounter=0;
my $mLRRY=0;
my $mLRRX=0;
my $R = Statistics::R->new();

open(OUT,">$outFile");
print OUT "Pivus\tmLRRX\tmLRRY\n";
close(OUT);

foreach my $file (@files) 
{
	$fileCounter++;
	print "$fileCounter\t$file\n";

	my $rawFile="$inFolder/$file";	
	#do the calculation:
	$R->set( 'pathToRawdata', $rawFile );

	my $mLRRY = $R->run(
	'par12Y <- 2649520',
  	'par21Y <- 59034050',
	'dataTable <-read.table(pathToRawdata, header=TRUE);',
	'ratio<-data.frame(dataTable)',
	'allY <- subset (ratio, ratio$Chr=="Y")',
	'allYnoPARs <- subset (allY, allY$Position > par12Y & allY$Position< 59034050)',
	'mLRRY_seq <-median(allYnoPARs$LRR,na.rm=TRUE)',
	'mLRRY_seq' 

	);

	my $mLRRX = $R->run(
	'par12Y <- 2649520',
  	'par21Y <- 59034050',
	'dataTable <-read.table(pathToRawdata, header=TRUE);',
	'ratio<-data.frame(dataTable)',
	'allX <- subset (ratio, ratio$Chr=="X")',
	'mLRRY_seq <-median(allX$LRR,na.rm=TRUE)',
	'mLRRY_seq' 
	);

	$R->stopR() ;
	print "\t\t\tmLRRY:$mLRRY\tmLRRX:$mLRRX\n";

	open(OUT,">>$outFile");
	print OUT "$file\t$mLRRX\t$mLRRY\n";
	close(OUT);
}
