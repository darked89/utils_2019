-  Programs installed/being installed
    - fastq preprocessing
        - [BBMap](#bbmap)
        - [fqgrep](#fqgrep)
    - SAM/BAM core utils
        - [samtools](#samtools)
        - [picard](#picard)
        - [sambamba](#sambamba)
    - BAM/vcf viewers
        - [IGV](#igv)
    - quality checkers
        - [FastQC](#fastqc)
        - [multiqc](#multiqc)
        - [QoRTs](#qorts)
    - BED/BAM etc. utils
        - [bedtools](#bedtools)
        - [bedops](#bedops)
        - [bam-readcount](#bam-readcount)
        - [bamutil](#bamutil)
    - kmer
        - [jellyfish](#jellyfish)
    - ncbi 
        SRA Tools: https://github.com/ncbi/sra-tools  
## samtools

| Property | value |
| ------ | ------ |
| prog_name | samtools |
| publication | https://www.ncbi.nlm.nih.gov/pubmed/19505943 |
| citations_num | 18873  (2019.05.07) |
| first_release_year | 2009? |
| www | http://www.htslib.org/  |
| repo | https://github.com/samtools/samtools |
| lang | C |
| obtained_from | https://github.com/samtools/samtools/releases/download/1.9/samtools-1.9.tar.bz2 |
| version | 1.9 |
| version_date |  2018.07.18 |
| last_ver_check | 2019.05.07 |
| requirements_1 | cc/gcc |
| install_1| foo-server|
| install_1_dir | /usr/local/bin/samtools |

### primary use(s)
* view/sort SAM/BAM/CRAM files
* index fasta 


## picard

| Property | value |
| ------ | ------ |
| prog_name | picard |
| publication | nope |
| citations_num | ??? |
| first_release_year | ??? |
| www | http://broadinstitute.github.io/picard/  |
| repo | https://github.com/broadinstitute/picard |
| lang | java |
| obtained_from | https://github.com/broadinstitute/picard/releases/download/2.21.1/picard.jar |
| version | 2.21.1 |
| version_date |  2019.10.03 |
| last_ver_check | 2019.10.06 |
| requirements_1 | java 1.8 |
| documentation | http://broadinstitute.github.io/picard/ |
| install_1| foo-server|
| install_1_dir | /opt/soft/picard_current/ |
| install_1_admin | darked |
| install_2 | bar-server |
| install_2_dir | /opt/soft/picard_current/ |
| install_2_admin | darked |

### primary use(s)
* view/sort SAM/BAM/CRAM files
* index fasta 


## sambamba

| Property | value |
| ------ | ------ |
| prog_name | sambamba |
| publication | https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4765878/ |
| citations_num | 185 (2019.05.07) |
| first_release_year | 2012? |
| www | http://lomereiter.github.io/sambamba/  |
| repo | https://github.com/biod/sambamba |
| lang | Dlang |
| obtained_from | https://github.com/biod/sambamba/releases/download/v0.7.0/sambamba-0.7.0-linux-static.gz |
| version | 0.7.0 |
| version_date |  2019.05.29 |
| last_ver_check | 2019.05.31 |
| requirements_1 | none (precompiled binary) |
| install_1| foo-server|
| install_1_dir | /usr/local/bin/sambamba_0.7.0 |

### primary use(s)
* view/sort SAM/BAM/CRAM files

### BBMap

| Property | value |
| ------ | ------ |
| prog_name | BBMap  |
| publication | conference: https://www.osti.gov/biblio/1241166 |
| citations_num | 74 (2019.0625) |
| first_release_year | earlier than 2014 |
| www_1 | https://sourceforge.net/projects/bbmap/|
| www_2 | https://jgi.doe.gov/data-and-tools/bbtools/ |
| repo | ?? |
| lang | java/shell/? |
| obtained_from | https://sourceforge.net/projects/bbmap/files/ |
| version | 38.70 |
| version_date |  2019.10.25 |
| last_ver_check | 2019.10.28 |
| requirements_1 | java |
| install_1| foo-server|
| install_1_dir | /opt/soft/bbmap_38.70 |
| install_1_admin | darked |
| install_2| bar-server |
| install_2_dir | /opt/soft/bbmap_38.67 |
| install_2_admin | darked |
### installation

```
#download on a command line:

curl -sSL "https://sourceforge.net/projects/bbmap/files/BBMap_38.70.tar.gz/download" > BBMap_38.70.tar.gz
tar xfv BBMap_38.70.tar.gz

```


### primary use(s)
* cluster and simplify fastq read names ( clumpify.sh )
```
#example command

/DATA/darked89/soft/bbmap_current/clumpify.sh   \
in=idsc-13p_merged_r1.fq \
in2=idsc-13p_merged_r2.fq \
out=idsc-13p_merged_r1.fq.gz \
out2=idsc-13p_merged_r2.fq.gz \
reorder shortname=shrink

#fish shell
for fn in frombam.r1.fq 
    /opt/soft/bbmap_38.59/clumpify.sh \
    in=$fn \
    in2=(basename $fn r1.fq)r2.fq \
    out=(basename $fn r1.fq)clump.r1.fq.gz \
    out2=(basename $fn r1.fq)clump.r2.fq.gz \
    reorder shortname=shrink
end
```

* count kmers in fastq file(s)

```
/opt/soft/bbmap_current/kmercountexact.sh \
in=06a_S2_L001_r1.fq \
out=06a_S2_L001_r1.kmercount_bbmap 
mincount=10000 \
k=8 

# output:  06a_S2_L001_r1.kmercount_bbmap
<snip>
>11009
GAGTTGGT
>19055
GATCTGCT
>10025
GCACTCTT
>45528
GCAGCCTG
<snip>

```
### IGV

| Property | value |
| ------ | ------ |
| prog_name |  IGV |
| publication |  https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3346182/ |
| citations_num |  |
| first_release_year | 2010?? |
| www | http://software.broadinstitute.org/software/igv/home |
| repo | https://github.com/igvteam/igv |
| lang | java |
| obtained_from | https://data.broadinstitute.org/igv/projects/downloads/2.6/IGV_Linux_2.6.3.zip |
| version | 2.6.3 |
| version_date | 2019.08.23  |
| last_ver_check | 2019.08.30 |
| requirements_1 | java |
| install_1| foo-server|
| install_1_dir | /opt/soft/igv_2.6.3 |
| install_2| bar-server |
| install_2_dir | /opt/soft/igv_2.6.3 |


### FastQC

| Property | value |
| ------ | ------ |
| prog_name |  FastQC |
| publication | in press(??) |
| citations_num |  |
| first_release_year | ??? |
| www | http://www.bioinformatics.babraham.ac.uk/projects/fastqc/ |
| repo | https://github.com/s-andrews/FastQC |
| lang | java/ |
| obtained_from | http://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.8.zip |
| version | 0.11.8 |
| version_date |   2018.10.04  |
| last_ver_check | 2019.09.12 |
| requirements_1 | java |
| install_1| foo-server|
| install_1_dir | /opt/soft/fastqc_0.11.8 |

#### primary use:
* fastq quality check

### QoRTs

| Property | value |
| ------ | ------ |
| prog_name |  QoRTs |
| publication | https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4506620/ |
| citations_num | 80 |
| first_release_year | 2015 |
| www | http://hartleys.github.io/QoRTs/ |
| repo | https://github.com/hartleys/QoRTs |
| lang_1 | java |
| lang_2 | R |
| obtained_from | https://github.com/hartleys/QoRTs/archive/v1.3.6.tar.gz |
| version | 1.3.6 |
| version_date |  2019.03.26  |
| last_ver_check | 2019.09.12 |
| requirements_1 | java (put versions) |
| requirements_2 | R (put versions) |
| install_1 | foo-server|
| install_1_dir | /opt/soft/qorts_1.3.6/ |
| install_1_admin | darked |
| install_2 | bar-server |
| install_2_dir | /opt/soft/qorts_1.3.6/ |
| install_2_admin | darked |

```
#usage

java -jar /opt/soft/qorts_1.3.6/QoRTs.jar QC \
cbrako-fix039_PT_0_2.rna.mrgd_4.clump.r12.star_hg38p13.bam  \
/opt/genome/hg38/gencode.v31.annotation.gtf    \
tmp_qual_data/

#more options:
java -jar /opt/soft/qorts_1.3.6/QoRTs.jar --man QC

```


### multiqc 

| Property | value |
| ------ | ------ |
| prog_name | multiqc |
| publication | https://academic.oup.com/bioinformatics/article/32/19/3047/2196507 |
| citations_num | 317  (2019.06.24) |
| first_release_year | 2016? |
| www | https://multiqc.info/ |
| repo | https://github.com/ewels/MultiQC |
| lang | python |
| obtained_from | pip  |
| version | 1.7 |
| version_date |  2018.12.21 |
| last_ver_check | 2019.06.24 |
| requirements_1 | pip |
| install_1| foo-server|
| install_1_dir | /usr/local/bin/multiqc |

```
# to create summary report from i.e. fastqc data for multiple files

multiqc .

```




### utils listed on multiqc web page (kmer tools, others)



### Bedtools

| Property | value |
| ------ | ------ |
| prog_name |  Bedtools |
| publication | in press(??) |
| citations_num |  |
| first_release_year | ??? |
| www | ??? |
| repo | https://github.com/arq5x/bedtools2 |
| lang | C++ |
| obtained_from | https://github.com/arq5x/bedtools2/releases/download/v2.28.0/bedtools-2.28.0.tar.gz |
| version | 2.29.0 |
| version_date |  2019.09.03 |
| last_ver_check | 2019.09.09 |
| requirements_1 | g++ /?? |
| docs | https://bedtools.readthedocs.io/en/latest/ |
| tutorial | http://quinlanlab.org/tutorials/bedtools/bedtools.html |
| install_1| foo-server|
| install_1_dir | /opt/soft/bedtools_2.29.0 |
| install_1_admin| darked |
| install_2| bar-server|
| install_2_dir | /opt/soft/bedtools_2.29.0 |
| install_2_admin| darked |

### bam-readcount

| Property | value |
| ------ | ------ |
| prog_name |  bam-readcount |
| publication | ??? |
| citations_num | ??? |
| first_release_year | 2011 |
| www | ??? |
| repo |  https://github.com/genome/bam-readcount |
| lang_1 | C++ |
| obtained_from | https://github.com/genome/bam-readcount/archive/v0.8.0.tar.gz |
| version | 0.8.0|
| version_date |  2016.10.22 |
| last_ver_check | 2019.06.24 |
| requirements_1 | cmake |
| install_1| foo-server |
| install_1_dir | /opt/soft/bam-readcount_0.8.0/ |

#### primary use:
* stats at a single base resolution for the selected positions


```
# install

cd bam-readcount_0.8.0

mkdir build
cd build
cmake ..
make
make test
```










### fqgrep
 
An approximate sequence pattern matcher for FASTQ/FASTA files.

| Property | value |
| ------ | ------ |
| prog_name |  fqgrep |
| publication | none / https://zenodo.org/record/45105 |
| citations_num | 24? (2019.06.25) |
| first_release_year | 2011 |
| www |  |
| repo | https://github.com/indraniel/fqgrep |
| lang | C |
| obtained_from | https://github.com/indraniel/fqgrep/archive/v0.4.4.tar.gz |
| version | 0.4.4 |
| version_date | 2016.01.22|
| last_ver_check | 2019.06.25 |
| requirements_1 | libtre-dev |
| install_1| mab@task |
| install_1_dir | /opt/soft/fqgrep_0.4.4/|


###  installation

```
# prerequisites (on Debian)
sudo apt install libtre5 libtre-dev

# 'make' creates the executable. 
make 
mkdir ./bin
mv -i fqgrep ./bin

```

### usage

```
# simple search for a given pattern 
# searches for TGAAGAGA anywhere in the read, no mismatches, colored output visible in most
fqgrep -c -p 'TGAAGAGA' 06a_S2_L001_r1.fq | most

# search with reporting start/end positions of the pattern, sequence etc. 
# the """ grep TGAAGAGA | awk '{print $7}' | sort -n | uniq -c """ part shows starting position distribution/counts

fqgrep  -r -p 'TGAAGAGA' 06a_S2_L001_r1.fq | grep TGAAGAGA | awk '{print $7}' | sort -n | uniq -c


# with '-m 2' => two mismatches allowed
fqgrep  -r -m2 -p 'TGAAGAGA' 06a_S2_L001_r2.fq | grep TGAAGAGA | most
```


### ngsutils

https://github.com/ngsutils/ngsutils


### bedops


| Property | value |
| ------ | ------ |
| prog_name |  bedops |
| publication | https://academic.oup.com/bioinformatics/article/28/14/1919/218826 |
| citations_num | 334 (2019.09.12) |
| first_release_year | 2012? |
| www | https://bedops.readthedocs.io/en/latest/ |
| repo |  https://github.com/bedops/bedops |
| lang | C++ |
| obtained_from | https://github.com/bedops/bedops/releases/download/v2.4.36/bedops_linux_x86_64-v2.4.36.tar.bz2 |
| version | 2.4.37 |
| version_date | 2019.05.02 |
| last_ver_check | 2019.10.28 |

| install_1| foo-server |
| install_1_dir | /opt/soft/bedops_2.4.37/ |
| install_1_admin | darked |

| install_2 | bar-server |
| install_2_dir | /opt/soft/bedops_2.4.36/ |
| install_2_admin | darked |

### install
```
# distributed as a precompiled binaries
# caution: tar is unpacking to ./bin

```

### usage
```
#example usage
awk '{ if ($0 ~ "transcript_id") print $0; else print $0" transcript_id \"\";"; }' gencode.v31.annotation.no_head.gtf  | gtf2bed - > \
gencode.v31.annotation.no_head.bed

```

## bamutil


| Property | value |
| ------ | ------ |
| prog_name |  bam |
| publication | https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4448687/ |
| citations_num | 56 (2019.06.17) |
| first_release_year | 2015? |
| www | https://genome.sph.umich.edu/wiki/BamUtil |
| repo |  https://github.com/statgen/bamUtil |
| lang | C++ |
| obtained_from | see repo |
| version | 0.8.0 (??) |
| version_date | 2019.04.20|
| last_ver_check | 2019.09.04 |
| requirements_1 | libStatGen |
| requirements_1_repo | https://github.com/statgen/libStatGen |
| install_1| mab@task |
| install_1_dir | /opt/soft/bamutil_20190617/ |
| install_2 | bar-server |
| install_2_dir | /opt/soft/bamutil_20190904/ |

### installation

```
git clone git://github.com/statgen/bamUtil.git
git clone git://github.com/statgen/libStatGen.git
mv bamUtil/ bamutil_20190617
cd bamutil_20190617
make all

#not very informative: 
make test
#it runs but does not report neither test passing nor errors

```
### test run 

```
bin/bam stats --in /mnt/vdb1/darked89/proj/mongra_20190506/BWA_bam/6_S1_L001_r12.bwa.bam --basic 
Number of records read = 6172826

TotalReads(e6)	6.17
MappedReads(e6)	6.15
PairedReads(e6)	6.17
ProperPair(e6)	6.09
DuplicateReads(e6)	0.00
QCFailureReads(e6)	0.00

MappingRate(%)	99.67
PairedReads(%)	100.00
ProperPair(%)	98.65
DupRate(%)	0.00
QCFailRate(%)	0.00

TotalBases(e6)	468.77
BasesInMappedReads(e6)	467.23

```
#### bamutil for mark duplicates


```
#!/usr/bin/fish

for fn in *bam
    /opt/soft/bamutil_current/bin/bam dedup --in $fn --out (basename $fn .bam).md.bam --force --oneChrom --verbose
end
```

### vcfanno

| Property | value |
| ------ | ------ |
| prog_name | vcfanno |
| publication | https://www.ncbi.nlm.nih.gov/pubmed/19505943 |
| citations_num | 18873  (2019.05.07) |
| first_release_year | 2009? |
| www | http://www.htslib.org/  |
| repo | https://github.com/brentp/vcfanno |
| lang | Go |
| obtained_from | https://github.com/brentp/vcfanno/releases/download/v0.3.1/vcfanno_linux64 |
| version | 0.3.1 |
| version_date |  2018.10.29 |
| last_ver_check | 2019.06.17 |
| requirements_1 | ?? Lua ?? |
| install_1| foo-server|
| install_1_dir | /opt/soft/vcfanno_0.3.1 |

* primary use:

vcfanno allows you to quickly annotate your VCF with any number of INFO fields from any number of VCFs or BED files. 

* status: not tested

## jellyfish

| Property | value |
| ------ | ------ |
| prog_name | jellyfish |
| publication | https://academic.oup.com/bioinformatics/article/27/6/764/234905 |
| citations_num | 999 (2019.06.25) |
| first_release_year | 2011 |
| www | http://www.genome.umd.edu/jellyfish.html  |
| repo | https://github.com/gmarcais/Jellyfish |
| lang | Dlang |
| obtained_from | hhttps://github.com/gmarcais/Jellyfish/releases/download/v2.2.10/jellyfish-2.2.10.tar.gz |
| version | 2.2.10 |
| version_date |  2018.05.01 |
| last_ver_check | 2019.06.24 |
| requirements_1 | ?? |
| install_1| foo-server|
| install_1_dir | /opt/soft/jellyfish_2.2.10 |

### installation

```
# install from source

autoreconf -i
./configure --prefix=/opt/soft
make
make check
make install
```

### usage 
```
# test run 
jellyfish bc -m 8  -s 10G -t 16 -o 06a_S2_L001_r12.bc  06a_S2_L001_r1.fq 06a_S2_L001_r2.fq
jellyfish count -m 8 -s 3G -t 16 --bc 06a_S2_L001_r12.bc 06a_S2_L001_r1.fq 06a_S2_L001_r2.fq

# this creates a default mer_counts.jf file 

```


# 2 test (possibly)

### gto (simple stats?)

https://github.com/cobilab/gto


### bamcount from Ben Langmead

https://github.com/BenLangmead/bamcount
