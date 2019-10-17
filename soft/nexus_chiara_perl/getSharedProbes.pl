#use strict;
use IO::File;

#Get the probe names shared among 2 files
#the first column on both files should contain the probe name. All the columns from the $shortFile are saved in the result file

my $shortFile = "rs660Probes.txt";  #shortest file
my $longFile = "rs610Probes.txt";	#longest file
my $resultFile="sharedRS.txt";          #file with common probes

chomp $shortFile;

my $sharedCounter=0; #shared probes
my $shortCounter=0;  #probes just on short file

#check short file against the long one

open(FILE1,"$shortFile") || die ("could not open file ",$shortFile);
open(DAT, ">>$resultFile") || die ("could not open file ",$resultFile);
open(FILE2,"$shortFile") || die ("could not open file ",$shortFile);


while (my $shortLine=<FILE1>)
{
	$shortCounter++;
	open(FILE2,"$longFile") || die ("could not open file ",$shortFile);
	while (my $longLine=<FILE2>)
	{
    		if ($shortLine eq $longLine) 
		{
        		print $shortCounter,") match: ",$shortLine,"=",$longLine,"\n";
			$sharedCounter++;
			print DAT $shortLine;
    		}
	}
	close(FILE2);
}
close(FILE1);
close(RES);

print "n. of rs probes on illumina 610w: 598821\n"; 
print "n. of rs probes on illumina 660w: ",$shortCounter,"\n";
print "n. of shared probes: ",$sharedCounter,"\n"; 
print "n. non-shared probes on illumina 610W:   ",598821-$sharedProbes,"\n";
print "n. non-shared probes on illumina 660W:   ",$shortCounter-$sharedCounter,"\n";



