use strict;
use warnings;
use Statistics::R;

my $infilesList="nexus1200Files.txt";
my $inDir="/media/SEAGATE2/ULSAM_aging_2.5&OmniXpressExome_build37/Samples/";

my %goodSamples = ();
my @splitLines;

my $R = Statistics::R->new();

my $counter=0;

open (SAMPLES, "< $infilesList") or die "Can not read $infilesList: $! \n";
while (<SAMPLES>)
{
	chomp $_;
	@splitLines=split('\t',$_);
	print "$splitLines[1]\n";
	$goodSamples{ $splitLines[1] } = $splitLines[0];    # hash
}

close(SAMPLES);

open (RESULTS, ">out2.txt");
close(RESULTS);

foreach my $key (keys %goodSamples)
{
	print $key . "\n";
	$counter++;

	eval
	{
		#open file and calculate standard dev. of LRR on chromosome Y:
		#system("awk '{FS=\" \"; OFS=\"\t\"} { if(\$1==\"chr1\") print \$4}' > appo.txt");

		$R->set( 'pathToFile', $inDir.$goodSamples{$key}."/raw.txt" );
		print $inDir.$goodSamples{$key}."/raw.txt\n";

		my $stDev1 = $R->run(
		'dataTable <-read.table(pathToFile, header=TRUE, fill=TRUE, sep="\t");',
		'ratio<-data.frame(dataTable)',
		'ratioy <- subset(ratio, ratio$Chromosome=="chr1")',
		'stDev <-sd(ratioy$Value,na.rm=TRUE)',
		'stDev' );
		$R->stopR();

		open (RESULTS, ">> out2.txt") or die "Can not open out, $!\n";

		print "$counter\t$key$stDev1\n";
		print RESULTS "$key\t$stDev1\n";

		close(RESULTS);

	};
	if($@) #catch
	{
		print "Error captured : $@\n";
	}
}


