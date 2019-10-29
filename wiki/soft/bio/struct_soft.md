# Installed

-  [GRIDSS](#gridss)
-  [Manta](#manta)
-  [Control-FREEC](#control-freec)
-  [FusorSV/SVE](#sve )
    


## GRIDSS

| Property | value |
| ------ | ------ |
| prog_name | GRIDSS |
| paper| https://genome.cshlp.org/content/27/12/2050.full |
| citations_num | 20 (from 2017)|
| obtained_from |https://github.com/PapenfussLab/gridss/releases |
| version | 2.6.3 |
| version_date |  2019.10.21 |
| last_ver_check | 2019.10.28 |
| activity_main | active |
| activity_dev| active |
| issues_github | active |
| lang_1 | java |
| lang_2 |  R |
| example | /opt/soft/gridss_2.5.2/example/|
| requirements_1 | java 1.8 |
| requirements_2 | R > 3.5 |
| install_1 | foo-server|
| install_1_path | /opt/soft/gridss_2.6.3 |
| install_1_admin | darked |
| install_1_date | 2019.10.05 |
| install_2 | bar-server|
| install_2_path | /opt/soft/gridss_2.6.2 |
| install_2_admin | darked |
| install_2_date | 2019.10.05 |
| java_ver | /opt/soft/jdk_1.8.0_212/bin/java |

### recommendation(s) for running it

* [x]  The ENCODE DAC blacklist  hg19
```
cd /mnt/vdb1/soft/grids_2.5.2/blacklists

wget https://www.encodeproject.org/files/ENCFF001TDO/@@download/ENCFF001TDO.bed.gz
mv ENCFF001TDO.bed.gz hg19_ENCFF001TDO.bed.gz
gunzip ENCFF001TDO.bed.gz

# BED has 411 regions
```
* [x]  The ENCODE DAC blacklist  hg38
```
cd /mnt/vdb1/soft/grids_2.4.0/blacklists

https://www.encodeproject.org/files/ENCFF419RSJ/@@download/ENCFF419RSJ.bed.gz

gunzip ENCFF419RSJ.bed.gz

# BED has 38 regions
```
### installation version 2.4.0 

```
# in a some tmp dir
wget https://github.com/PapenfussLab/gridss/archive/v2.4.0.tar.gz 
tar xfv v2.4.0.tar.gz 
cd gridss-2.4.0/


## move stuff not included in the bare jar file:
mkdir /opt/soft/grids_2.4.0/
mv -i scripts/ /opt/soft/grids_2.4.0/
mv -i example/ /opt/soft/grids_2.4.0/
mv -i docker/ /opt/soft/grids_2.4.0/
mv -i COPYING  /opt/soft/grids_2.4.0/
mv -i LICENSE.txt /opt/soft/grids_2.4.0/
mv Readme.md /opt/soft/grids_2.4.0/

# get the jar and scripts:

cd /opt/soft/grids_2.4.0/

wget https://github.com/PapenfussLab/gridss/releases/download/v2.4.0/gridss-2.4.0-gridss-jar-with-dependencies.jar 
ln -s gridss-2.4.0-gridss-jar-with-dependencies.jar gridss.jar

wget https://github.com/PapenfussLab/gridss/releases/download/v2.4.0/gridss_lite.sh
wget https://github.com/PapenfussLab/gridss/releases/download/v2.4.0/gridss.sh 

chmod uga+x scripts/*sh
chmod uga+x *sh

```


### testing
```
# running:
/opt/soft/gridss_current/example/gridss.sh

```
### old bwa BAM preprocessing

```
# bam2sam
samtools view -h -o R167101_S15.sam R167101_S15.bam
# set MAPQ to 0 for unmapped reads
java -jar /opt/picardtools/dist/picard.jar CleanSam I=R167101_S15.sam O=R167101_S15_cleaned.sam
# sam2bam
samtools view -bS R167101_S15_cleaned.sam > R167101_S15_cleaned.bam

```
### STATUS 20190520

```
# remapped to hg19canonical using bwa mem

BAM/BAI files:
/DATA/darked89/proj/remap_20190221/grids_threaded

** important **
use run_gridss_2.2.3_threaded.sh

# it runs with 16 threads as recommended with the newest gridss version

```
### gridss variant annotation 

#### R packages needed
```
install.packages("devtools")
library(devtools)
install_github("PapenfussLab/StructuralVariantAnnotation", ref="pre_bioconductor")
```
#### modified R script

```
simple-event-annotation_20190520a.R
#2 be put into GitLab after success

```

# Manta

| Property | value |
| ------ | ------ |
| prog_name | Manta |
| publication | https://academic.oup.com/bioinformatics/article/32/8/1220/1743909 |
| citations_num | 186 (2019.05.17) |
| first_release_year | 2015? |
| www | ?? |
| repo | https://github.com/Illumina/manta |
| lang_1 | C++ |
| lang_2 | python |
| obtained_from | https://github.com/Illumina/manta/releases/download/v1.6.0/manta-1.6.0.release_src.tar.bz2 |
| version | 1.6.0 |
| version_date |   2019.06.25  |
| last_ver_check | 2019.07.30 |
| activity_main | active (release 2019.06) |
| activity_dev| ??  |
| issues_github | active |
| requirements_1 | python 2.7  |
| requirements_2 | ?? |
| tutorial | ??  |
| test_data| ??  |
| install_1| foo-server|
| install_1_dir | /opt/soft/manta_1.6.0/ (src only) |

```
## configure did ask for doxygen. installed using apt-get

```

### running (2 stages)

```
# directory with links to DoD remapped to hg19 BAMs:

cd /DATA/darked89/proj/manta_testing20190520

## in fish shell
for fn in *bam
    /opt/soft/bin/configManta.py --bam=$fn --referenceFasta=/mnt/vdb1/gen/bwa_idx/hg19canon.fa --runDir=(basename $fn .bam).MantaWorkflow
    end


for fn in ./*.MantaWorkflow/runWorkflow.py
    python2 $fn --mode=local
end 
```





## Control-FREEC

| Property | value |
| ------ | ------ |
| prog_name | Control-FREEC |
| publication | https://academic.oup.com/bioinformatics/article/28/3/423/189142 |
| citations_num | 338 (2019.04.25) |
| first_release_year | 2012 |
| www | http://boevalab.com/FREEC/index.html |
| repo |https://github.com/BoevaLab/FREEC |
| lang | c++|
| obtained_from | https://github.com/BoevaLab/FREEC/archive/v11.5.tar.gz |
| version | 11.5 |
| version_date |  2018.08.05 |
| last_ver_check | 2019.04.15 |
| activity_main | inactive ~1year |
| activity_dev| no dev branch!  |
| issues_github | lethargic (last in Dec 2018, 20 issues open) |
| tutorial| http://boevalab.com/FREEC/tutorial.html|
| install_1| foo-server|
| install_1_dir | /opt/soft/freec_11.5/ |


### requirements
```
R 
samtools (for .BAM for inputs)
bedtools (if using minipileup files from .BAM)
sambamba (speedup of reading of .BAM files) 

```


### testing

### gem mapper mappability data needed
| Property | value |
| ------ | ------ |
| prog_name | GEM |
| source | https://sourceforge.net/projects/gemlibrary/files/gem-library/Binary%20pre-release%203/GEM-binaries-Linux-x86_64-core_i3-20130406-045632.tbz2 |
| version |  gem_20130406 |
| install_1| foo-server |
| install_1_dir | /home/darked89/soft/gem_20130406 | 

Example command (requires the GEM genome index, valid for a certain read length)
```
gem-mappability -T 16 -l 100  -I Ldonovani_gen.gem.gem -o Ldonovani_gen.map100

```


#### Leishmania donovani data:
```
cat ~/soft/freec_current/scripts/assess_significance.R | R --slave --args ERR206539_12.ld_gen.bam_CNVs < ERR206539_12.ld_gen.bam_ratio.txt

```
#### chromosome_lengths dla hg19canon
```
10	chr10	135534747
11	chr11	135006516
```


## SVE 

| Property | value |
| ------ | ------ |
| prog_name | SVE /FusorSV |
| publication | https://genomebiology.biomedcentral.com/articles/10.1186/s13059-018-1404-6 |
| citation_num | 1 (from 2018.03.20) check: 2019.05.08 |
| obtained_from | https://github.com/TheJacksonLaboratory/SVE |
| version |  0.1.0 |
| version_date |  2017.12.17 |
| last_ver_check | 2019.05.08 |
| activity_main | stalled |
| activity_dev| active (multiple commits, last ones2019.04.+)  |
| issues_github | active |
| install_1| foo-server|
| install_1_path| /opt/soft/SVE |

## Requirements
```
python 2.7
HTSeq  
numpy 
scipy 
subprocess32 
bx-python 
CrossMap 
mygene
gcc 4.8 
cmake >=3.0 
Root  https://root.cern.ch/

R 3.3 or greater. You may type "make R-install" to install R-3.3.3.
```

| Name | SVE default | SVE foo-server | Current version | Comments | Repo|
| ------ | ------ | ------ | ------ | ------ | ------ |
| BreakDancer | 1.4.5 | 1.4.5 | 1.4.5 | no updates? | https://github.com/genome/breakdancer  |
| BreakSeq | | | 2.2 | Nov 2015? | repo: https://github.com/bioinform/breakseq2 |
| cnMOPS | 1.24.0 | | 1.30.0 | R package. ver date unknown??  | http://www.bioinf.jku.at/software/cnmops/cnmops.html |
| CNVnator | |0.3.3 | 0.4.1 | update Aug 2019 | https://github.com/abyzovlab/CNVnator | 
| DELLY | | 0.8.1 | 0.8.1 | update Apr 2019 | https://github.com/dellytools/delly |
| Hydra  | | | | no updates for 4 years | https://github.com/arq5x/Hydra | 
| LUMPY | 0.2.13 | 0.2.13 | 0.3.0 | updated Apr 2019 | https://github.com/arq5x/lumpy-sv | 



## breakdancer 

```
# installation

git clone --recursive https://github.com/genome/breakdancer.git 
cd breakdancer
mkdir build 
cd build
cmake .. -DCMAKE_BUILD_TYPE=release 
make 
make test
cd ../..
mv -i breakdancer /opt/soft/breakdancer_20160618git/

```

# To check later

## Tangent from Broad (copy number)
https://github.com/broadinstitute/tangent
https://www.biorxiv.org/content/10.1101/566505v1.abstract

## Duphold 2019
https://academic.oup.com/gigascience/article/8/4/giz040/5477467




## svaba 33 citat 06.2018
https://genome.cshlp.org/content/28/4/581.full
repo: https://github.com/walaj/svaba

## Strelka & strelka2

https://github.com/Illumina/strelka

/opt/soft/strelka_2.9.10
## svtools

Tools for processing and analyzing structural variants

https://github.com/hall-lab/svtools

## paragraph

Graph realignment tools for structural variants

https://github.com/Illumina/paragraph

## Bamginer (simulation of scv-s)
https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1006080

## truvari

comparison of variant detected by 2 packages

https://github.com/spiralgenetics/truvari

## NAIBR 10x data

https://github.com/raphael-group/NAIBR

## Kevlar Titus Brown alignment free

https://github.com/kevlar-dev/kevlar


### Neusomatic

* https://www.nature.com/articles/s41467-019-09027-x

* https://github.com/bioinform/neusomatic