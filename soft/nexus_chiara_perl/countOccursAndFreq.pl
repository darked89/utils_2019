

my $resultFile="data0075.txt";
my $outFile="data010_freq.txt";

my %lociOccur; # an hash with chrom:Pos as key and occurrence as value
my %lociLines; # an hash with chrom:Pos as key and line as value
my $firstrow="Index\tSample\tChr\tPos\tABS_BAF_DIFF\tProbe_name\tNoOcc\tFreq\n";
my @sampleNames;

open(FILE,"$resultFile");
my $counter=0;
while (my $line=<FILE>)
{
	if($counter>0) #takes into account just the result lines, without the header
	{
		chomp $line;
		my @fields=split('\t',$line);
		my $locus=$fields[2].":".$fields[3];
		#print $locus."\n";

		if (exists $lociOccur{$locus}) #other occurrence in the same position 
		{
      			$lociOccur{$locus}=$lociOccur{$locus}+1;
     		}
		else #new locus
		{	
			$lociOccur{$locus}=1;
			$lociLines{$locus}=$line;
		}
	
		if ( ! grep( /$fields[1]/, @sampleNames ) ) #if is a new sample name add it to the array
		{
      			push( @sampleNames, $fields[1] );
     		}

	}

	$counter++;
}
close(FILE);

print "number of sample names in file: ".@sampleNames."\n";

foreach $sampleNames (@sampleNames)
{
	print $sampleNames."\n";
}

#open(NEW,"+>$outFile");
#print NEW $firstrow;

#while ( my ($key, $value) = each(%lociLines) ) 
#{      
	#print NEW $value."\t".$lociOccur{$key}."\t".$lociOccur{$key}/@sampleNames."\n";
#}

#close(NEW);
