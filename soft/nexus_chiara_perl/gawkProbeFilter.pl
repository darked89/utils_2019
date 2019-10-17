# chiara.rasi@igp.uu.se
# filters an illumina result file removing all the probes whose name in not on another file (filter) containing the list of probes to be evaluated.
# The script open a folder and filters all the files inside it whose name contains "_goodCols".
# Filter file has probe names on the 1rst column.
# File to be filtered has probe names on the 4rth column.


my $dir = "/home/chiara/Documents/lavoro/genpat/algorithms/check_gtype_same_ind/1MOmni";  		#input dir
my $outDir="/home/chiara/Documents/lavoro/genpat/algorithms/check_gtype_same_ind/1MOmni_shared_probes/";		#output dir
my $filter="shared_1M_omni_duo.csv"; 	     #filter file which contains probe names NOT intensity only, NOT XY and NOT MT shared among the 3 platforms.
opendir DH, $dir or die "Cannot open $dir: $!";
my @files = grep(/\.txt$/,readdir(DH));
my @files=sort(@files);
my $stripper="gawk > ";
#gawk >res.txt ' BEGIN{FS="\t"; OFS="\t"}  FNR==NR{f1[$1];next}$4 in f1' filter660W.txt 172012_goodCols.txt //working example

closedir DH;

my $fileNum="";

foreach $file (@files) 
{
	print "***".$file."***\n";
	if(0==0) #if it'a a file to be parsed
	{
		print $stripper.$outDir.$file." 'BEGIN{FS=\"\t\"; OFS=\"\t\"}  FNR==NR{f1[\$1];next}\$4 in f1' ".$filter." ".$dir."/".$file."\n";
		system($stripper.$outDir.$file." 'BEGIN{FS=\"\t\"; OFS=\"\t\"}  FNR==NR{f1[\$1];next}\$4 in f1' ".$filter." ".$dir."/".$file);
	}
	else 
	{
		print "not parsing file:$file\n";
	}
}
