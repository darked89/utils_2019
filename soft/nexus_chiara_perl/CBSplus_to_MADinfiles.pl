#converts CBS+ to MAD (GADA) infiles->
#Probe_name|Chr|Position|LRR|BAF|GType

use strict;
use warnings;

my $hugeFile="/media/SEAGATE2/EI11_120523_CBS_Plus_PCF_noSpaces.txt";
my $outFolder="/media/SEAGATE2/appo2";
my $sampleCounter=0;
my @fields;
my $rowCount=0;
my @samples;
my @fileNames;
my @commonCols;
my @hugeHeader="";

print "samples of interest (separated by space):";
my @chosenSamples=split(/\s+/, <>);

#if use has chosen one ore more sample to extract, do it, otherwise
#open rawFile and collect sample names:

if(@chosenSamples>0)
{
	print "chosenSamples>0\n";

	@fileNames=@chosenSamples;

	my $filename = 'input.csv';
	open my $fh, '<', $hugeFile or die "Unable to open $hugeFile: $!";
	my $firstline = <$fh>;
	chomp($firstline);
	#print "The first line is $firstline\n";
	@fields=split('\t',$firstline);	
	@hugeHeader=@fields
}
else
{
	open(CBS,"$hugeFile");

	while(my $line=<CBS>)
	{
		if($rowCount==0)
		{	
			chomp $line;
			@fields=split('\t',$line);
			@hugeHeader=@fields;
			#remove duplicates and create files:
			foreach my $filename ( @fields)
			{
				$filename =~ s/UL1_//g;
				$filename =~ s/.Log_R_Ratio//g;
				$filename =~ s/.B_Allele_Freq//g;
				$filename =~ s/.GType//g;

				#print "$filename\n";

	   			if ( ! grep( /$filename/, @fileNames ) )
				{
	      				push( @fileNames, $filename );
	     			}
				$rowCount++;
	   		}
			
			last;
		}
		
	}
	close(CBS);
}

print "\nExtracting ".@fileNames." samples from this file!\n";

my $cellCounter=0;
my $gtypeCell=0;
my $bafCell=0;
my $LRRCell=0;
my $fileNameCounter=0;
#@fileNames = @fileNames[ 5 .. $#fileNames ];

foreach my $filename(@fileNames)
{
	print "\***************************\n$fileNameCounter: $filename\n";
	
	$fileNameCounter++;
	#search inside the CBS+ header and get the n. of column for GT, BAF and LRR
	foreach my $cell (@hugeHeader)
	{
		$cellCounter++;
		#print "$cell\n";
		#print "CELL: $cell\n";
		if($cell =~ /$filename./)
		{
			print "$cell\n";
			if($cell =~ /Allele/)
			{
				$bafCell=$cellCounter;
			}
			elsif($cell =~ /GType/)
			{
				$gtypeCell=$cellCounter;
			}
			elsif($cell =~ /Ratio/)
			{
				$LRRCell=$cellCounter;
			}
			else
			{
				die "No useful column found for sample $filename\n!!";
			}
			print "$filename found in\t$cell\tLRR:$LRRCell\tBAF:$bafCell\tGtype:$gtypeCell\n";
		}
	}
	$cellCounter=0;
	#print to outfile:
	print "extracting columns to file...\n";

	system("awk -F, ' BEGIN{FS=\"\t\"; OFS=\"\t\"} { print \$2,\$4,\$5,\$$LRRCell,\$$bafCell,\$$gtypeCell}' ".$hugeFile." > ".$outFolder."/".$filename.".txt");

	print "done!\n";

	#remove header:
	system("sed -i '1d' $outFolder/$filename.txt");

	#add new header to file:
	system("sed -i '1i Name\tChr\tPosition\tLRR\tBAF\tGtype' $outFolder/$filename.txt");

	#remove carriage returns:
	#system("cat $outFolder/$filename.txt | tr -d \"\r\" > $outFolder/$filename"."_temp.txt");
	#system("rm $outFolder/$filename.txt");
	#system("mv $outFolder/$filename"."_temp.txt $outFolder/$filename.txt");
	print "\**************************\n";
}

print "$rowCount VS $fileNameCounter VS $cellCounter\n";

