# opens a directory with Nexus infiles and renames them by splitting long filenames using underscores:

my $toRename=0;
my $pathToDir="/home/chiara/Documents/genpat/scripts/perl/link2MF0314";

#cycle over the samples' folder and get the sample names inside an array:
opendir DH, $pathToDir or die "Cannot open $pathToDir: $!";
my @files = grep(/\.txt$/,readdir(DH));
@files=sort(@files);
my @sampleNames;
closedir DH;
print "\n".@files." sample files in this folder..\n";

my $fileCounter=0;
my $okCounter=0;
my $dupliCounter=0;

foreach my $file (@files) 
{
	#push(@sampleNames, substr $file, 0, rindex($file,'.'));
	$fileCounter++;
	#if($fileCounter>2)
	#{
		my @temp=split("_DJ9_",$file);
		
		my $appo=$temp[1];
		#print "*$appo*\n";
		my @temp2=split(".1_",$appo);
		print "$temp2[0]\n";

		system("mv $pathToDir/$file $pathToDir/$temp2[0].txt");

		#print "$temp2\n";

		#if ( ! grep( /$temp2/, @sampleNames ) )
		#{
	      	#	push( @sampleNames, $temp2 );
		#	$okCounter++;

		#	system("mv /home/chiara/Desktop/link/$file /home/chiara/Desktop/link/$temp2"."_copy.txt");
	     	#}
		#else
		#{
			#push( @sampleNames, "$temp2"."_copy" );
		#	$dupliCounter++;

		#	print "$temp2\n";
			
		#}
	#}
}

print "$fileCounter in folder\n";
