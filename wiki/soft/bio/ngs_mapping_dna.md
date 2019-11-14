# NGS DNA mapping software

- essential
    - [bwa](#bwa)
- accessory
    - [gem3](#gem3)
    - [last](#last)
    - [bowtie2](#bowtie2)
    - [bowtie](#bowtie)
- legacy, possibly needed for other packages
    - [Mosaic](#mosiac)
## bwa

| Property | value |
| ------ | ------ |
| prog_name | bwa |
| publication | https://www.ncbi.nlm.nih.gov/pmc/articles/PMC2828108/ |
| citations_num | 4874 (2019.05.22) |
| first_release_year | 2010? |
| www | http://bio-bwa.sourceforge.net/  |
| repo | https://github.com/lh3/bwa |
| lang | C |
| obtained_from | https://github.com/lh3/bwa/archive/v0.7.17.tar.gz |
| version | 0.7.17-r1188 |
| version_date |  2017.10.23 |
| last_ver_check | 2019.05.22 |
| activity_main | active  |
| activity_dev|  |
| issues_github | active |
| requirements_1 | ??  |
| requirements_2 | ?? |
| tutorial | ?? |
| test_data| ?? |
| install_1| foo-server|
| install_1_dir | /usr/local/bin/ |

|


## gem3 

| Property | value |
| ------ | ------ |
| prog_name | gem|
| publication | ?? |
| citations_num | ?? |
| first_release_year | ?? |
| www |  https://github.com/smarco/gem3-mapper  |
| repo | https://github.com/smarco/gem3-mapper |
| lang | C |
| obtained_from | https://github.com/smarco/gem3-mapper |
| version | >3.6.1 (git) |
| version_date |  2019.05.24 |
| last_ver_check | 2019.05.24 |
| activity_main | active  |
| activity_dev|  active |
| issues_github | active |
| requirements_1 | CUDA for GPU  |
| requirements_2 | ?? |
| tutorial | ?? |
| doc| ?? |
| test_data| ?? |
| install_1 | foo-server |
| install_1_dir | /opt/soft/gem3_3.6.1a |
| instal_1_note| no CUDA |



## last

| Property | value |
| ------ | ------ |
| prog_name | last |
| publication | https://genome.cshlp.org/content/21/3/487.short |
| citations_num | >513 (2019.05.2) |
| first_release_year | 2011 |
| www |  http://last.cbrc.jp/  |
| repo | http://last.cbrc.jp/last/  |
| lang | C |
| obtained_from | http://last.cbrc.jp/ |
| version | 984 |
| version_date |  2019.08.21 |
| last_ver_check | 2019.09.06 |
| activity_main | active  |
| activity_dev|  ? |
| issues_github | not on github |
| requirements_1 | ??  |
| requirements_2 | ?? |
| tutorial | http://last.cbrc.jp/doc/last-tutorial.html |
| doc| http://last.cbrc.jp/doc/ |
| test_data| ?? |
| install_1| foo-server|
| install_1_dir | /opt/soft/last_984/ |

### fixing the executables location for version specific install

```
#!/bin/bash 

# script name: fix_locations.sh
# post-building to move the executables to a ./bin dir

mkdir bin
find ./src/ -executable -type f | awk '{print "mv -i " $1, "./bin"}' > mover.sh
source mover.sh
cd bin
ln -s ../scripts/* ./
```

### python3 problem

Headers of the scripts use 
```
#! /usr/bin/env python
```
but what is assumed is python3 (grep print).

Needs to be fixed

## bowtie2

| Property | value |
| ------ | ------ |
| prog_name | bowtie2 |
| publication | https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3322381/ |
| citations_num | 14526  (2019.06.17) |
| first_release_year | 2012? |
| www |  http://bowtie-bio.sourceforge.net/bowtie2/index.shtml  |
| repo | https://github.com/BenLangmead/bowtie2  |
| lang | C++ |
| obtained_from | https://github.com/BenLangmead/bowtie2/releases/download/v2.3.5.1/bowtie2-2.3.5.1-linux-x86_64.zip |
| version | 2.3.5.1 |
| version_date |  2019.04.17 |
| last_ver_check | 2019.06.17 |
| activity_main | active  |
| activity_dev|  ? |
| issues_github | active |
| requirements_1 | ??  |
| requirements_2 | ?? |
| tutorial | ?? |
| doc | http://bowtie-bio.sourceforge.net/bowtie2/manual.shtml |
| test_data| ?? |
| install_1| foo-server|
| install_1_dir | /opt/soft/bowtie2_2.3.5.1/ |

## bowtie



## MOSAIK (for other programs)

### from Gihub


```
git clone https://github.com/wanpinglee/MOSAIK.git
cd MOSAIK/src
make

cd ../demo
./Build.sh

./Align.sh 
------------------------------------------------------------------------------
MosaikAligner 2.2.30                                                2014-06-27
Wan-Ping Lee & Michael Stromberg  Marth Lab, Boston College Biology Department
------------------------------------------------------------------------------

WARNING: Paired-end data is detected, but the median fragment length is not specified.
         Accordingly, local alignment search is not enabled.
         The median fragment length (-mfl parameter) can be specified in MosaikBuild.

- Using the following alignment algorithm: all positions
- Using the following alignment mode: aligning reads to all possible locations
- Using a maximum mismatch percent threshold of 0.15
- Using a Smith-Waterman bandwidth of 39
- Using an alignment candidate threshold of 33bp.
- Setting hash position threshold to 200
- loading reference sequence... finished.

Hashing reference sequence:
100%[=====================================================================================] 4,938,906 ref bases/s        in  1 s  


Aligning read library (5000):
 0% [                                                                                         ]                                  |ERROR: buffer overflow detected when creating the packed cigar string.

```

### from 

```
wget https://odin.mdacc.tmc.edu/~xsu1/Mosaik.tar.gz

tar xfvz Mosaik.tar.gz

# warning: spreads files without creating directory!:
Mosaik-0.9.891-Documentation.pdf
MosaikAligner
MosaikAssembler
MosaikBuild
MosaikCoverage
MosaikJump
MosaikMerge
MosaikSort
MosaikText
Spanner

# cleaning up:

mkdir mosaik_0.9.0891
mv -i Mosaik* mosaik_0.9.0891/
mv -i Spanner mosaik_0.9.0891/

```