use strict;
use warnings;
use Statistics::R;

my $infile="/media/chiara/SEAGATE2/ULSAM1200_GWAS/SNPtestOutput.out";
my $onlySignificants="/media/chiara/SEAGATE2/ULSAM1200_GWAS/outHeader.txt";

open (IN, "< $infile") or die "Can not read $$infile: $! \n";
my $lineCounter=0;
my $signifCounter=0;

while (<IN>)
{
	$lineCounter++;

	if($lineCounter>15)#after the header
	{
		chomp $_;
		my @splitLines=split(' ',$_);
		if($splitLines[20] ne "NA" && $splitLines[20]<0.05){

			$signifCounter++;
			#print "$_\n";

			open (OUT, ">> $onlySignificants");
			print OUT "$_\n";
			close(OUT);

			print "$signifCounter)\t$splitLines[20]\t$splitLines[23]\t$splitLines[27]\n";
		}
	}
	else{
		#print $_;
	}
}
close(IN);
