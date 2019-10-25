# Viral sequences databases
1.  NCBI fasta: ftp://ftp.ncbi.nlm.nih.gov/refseq/release/viral/viral.3.1.genomic.fna.gz
1.  NCBI viruses ftp://ftp.ncbi.nlm.nih.gov/blast/db/ref_viruses_rep_genomes.tar.gz
1.  NCBI viroids ftp://ftp.ncbi.nlm.nih.gov/blast/db/ref_viroids_rep_genomes.tar.gz
1.  EBI (not a straight forward path to get +10k virus sequences)
1.  RINS (soft +db) from: http://khavarilab.stanford.edu/tools-1#tools



## ViFi

* paper 2018 https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6283451/
* num_of_citations: 2
* repository https://github.com/namphuon/ViFi
* version: 20190412(?) last change in repo 17days ago
* lang: python?
* mapper: bwa mem
```
sh setup_linux_mac.sh

[...]
main] Version: 0.7.17-r1188
[main] CMD: bwa index /home/hpv/hg19_hpv.fas
[main] Real time: 3679.831 sec; CPU: 3660.560 sec
Running test for ViFi
setup_linux_mac.sh: 42: setup_linux_mac.sh: source: not found
Traceback (most recent call last):
  File "/opt/soft/tmp/ViFi/scripts/run_vifi.py", line 118, in <module>
    reference_dir = os.environ['REFERENCE_REPO']
  File "/usr/lib/python2.7/UserDict.py", line 40, in __getitem__
    raise KeyError(key)
KeyError: 'REFERENCE_REPO'
```

Chromium downloads of:

```
https://drive.google.com/open?id=0ByYcg0axX7udUDRxcTdZZkg0X1k
saved as: vifi_data_repo.tar.gz
https://drive.google.com/open?id=0Bzp6XgpBhhghSTNMd3RWS2VsVXM
saved as: vifi_vir_data.zip

## Comment: not necessary, setup_linux_mac.sh downloaded these
```
**Caveat** (old GRCh37...): 
```
data_repo/GRCh37/
data_repo/hg19

```
**test run**
```
python $VIFI_DIR/scripts/run_vifi.py --cpus 2 --hmm_list $VIFI_DIR/data/hpv/hmms/hmms.txt -f $VIFI_DIR/test/data/test_R1.fq.gz -r $VIFI_DIR/test/data/test_R2.fq.gz -o $VIFI_DIR/tmp/docker/ --docker
<snip>
[Running BWA]: 1.281407
[Finished BWA]: 10.202214
[Identifying chimeric reads]: 10.202315
[Finished identifying chimeric reads]: 11.378336
[Running HMMS]: 11.378393
[Finished running HMMS]: 189.809474
[Cluster and identify integration points]: 189.809523
[Finished cluster and identify integration points]: 224.931178


```

## VirusSeq
* paper  2013 https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3546792/
* num_of_citations: 97
* www/repo: https://odin.mdacc.tmc.edu/~xsu1/VirusSeq.html
* version: no version(?), files in tar spill without creating any directory
* lang: perl?
* mapper: MosaikAligner 0.9.0891 from 2009-01-31
* pipeline (unoficial?): https://github.com/rosericazondekon/virusSeqPipeline

### downloads

```
#!/bin/bash

wget https://odin.mdacc.tmc.edu/~xsu1/VirusSeq.tar.gz

wget https://odin.mdacc.tmc.edu/~xsu1/gibVirus.fa.gz

wget https://odin.mdacc.tmc.edu/~xsu1/hg19.fa.gz
wget https://odin.mdacc.tmc.edu/~xsu1/hg19Virus.fa.gz

wget https://odin.mdacc.tmc.edu/~xsu1/L526401A_1.fq.gz
wget https://odin.mdacc.tmc.edu/~xsu1/L526401A_2.fq.gz

# very slow download 20190617

```

## ViralFusionSeq

* paper:  2013: https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3582262/
* num_of_citations: 53
* original repo: broken
* repo: https://sourceforge.net/projects/viralfusionseq/
* version: vfs-2016-08-17.r2.tar.gz
* md5sum: d56b9e23ee3c9e8b78bc6f8038802425
* unsupported as of 2019 claims: "As of 2016, VFS is the only viral integration tool available at NIH HPC system."
https://hpc.nih.gov/apps/ViralFusionSeq/ -> dead link

From the ViFi paper: ViralFusionSeq [..] 
>   Due to the difficulty in running ViralFusionSeq, as well as the computational requirements of the software (Supplementary Section S1), we excluded it from our analyses.



```
wget https://sourceforge.net/projects/viralfusionseq/files/release/vfs-2016-08-17.r2.tar.gz/download
mv -i download vfs-2016-08-17.r2.tar.gz

./viral.fusion.pl 
Can't locate Bio/DB/Sam.pm


```

* **Status:** FORGET!

## VirusFinder2
* paper: (2013) https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3663743/
num_of_citations: 96
* www/repo: https://bioinfo.uth.edu/VirusFinder/
* version: VirusFinder-2.0.tgz  from June 19, 2014
* mapper: bowtie2



```
requirements from the manual:
VirusFinder 2 requires: Linux, Bash shell, Java 1.6, and Perl 5. 

# testing jars
# current java
set -gx PATH /opt/soft/jdk_1.8.0_212/bin/  $PATH

## first jar
java -Xmx8G -jar GenomeAnalysisTK.jar

##### ERROR stack trace 
java.lang.ExceptionInInitializerError
	at org.broadinstitute.sting.gatk.GenomeAnalysisEngine.<init>(GenomeAnalysisEngine.java:161)
	at org.broadinstitute.sting.gatk.CommandLineExecutable.<init>(CommandLineExecutable.java:53)
	at org.broadinstitute.sting.gatk.CommandLineGATK.<init>(CommandLineGATK.java:54)
	at org.broadinstitute.sting.gatk.CommandLineGATK.main(CommandLineGATK.java:90)
<snip>
##### ERROR A GATK RUNTIME ERROR has occurred (version 2.4-9-g532efad):


## second (picard) jar:
java -Xmx8G -jar ./CreateSequenceDictionary.jar
Usage: net.sf.picard.sam.CreateSequenceDictionary [options]

<snip>
Version: 1.94(1484)

# downloading old java version from: 
https://www.oracle.com/technetwork/java/javase/downloads/java-archive-downloads-javase6-419409.html

# browser only
jdk-6u45-linux-x64.bin
chmod +x jdk-6u45-linux-x64.bin
mv -i jdk1.6.0_45/ jdk_1.6.0_45/
mv -i jdk_1.6.0_45/ /opt/soft/
/opt/soft/jdk_1.6.0_45/bin/java -jar virusfinder_2.0/bin/GenomeAnalysisTK.jar

```

## VERSE in VirusFinder
* paper (2015) https://genomemedicine.biomedcentral.com/articles/10.1186/s13073-015-0126-6
* 

## Virus-Clip (used in ViFi paper for comparison)
* paper: (2015) https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4673242/
* num_of_citations: 20


## seeksv
* paper: (2016) https://academic.oup.com/bioinformatics/article/33/2/184/2525700
* num_of_citations: 20
* repo: https://github.com/qiukunlong/seeksv
* lang c++
* 

# alternatives

## Viral-VDAP

* NCBI Hackathlon 2019
* repo: https://github.com/NCBI-Hackathons/Viral-VDAP

## inspiired
* paper:  (2017) https://www.sciencedirect.com/science/article/pii/S2329050116301309?via%3Dihub
* repo https://github.com/BushmanLab/INSPIIRED
* 


## VirTec (requires RNAseq?)
* repo https://github.com/WGLab/VirTect


## VIP ???

https://github.com/keylabivdc/VIP


## Magnet 

selecting i.e. non-human genome sequences out of fastq files
https://github.com/cobilab/magnet