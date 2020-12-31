# NGS DNA mapping software

- essential
    - [bwa](#bwa)
- accessory
    - [gem3](#gem3)
    - [last](#last)
    - [bowtie2](#bowtie2)
    - [novoalign](#novoalign)
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
| installed_version | 0.7.17-r1188 |
| installed_version_date |  2017.10.23 |
| newest_version | same as above |
| newest_version_date | same as above  |
| last_ver_check | 2020.12.29 |
| activity_main | active  |
| activity_dev|  |
| issues_github | active |
| requirements_1 | ??  |
| requirements_2 | ?? |
| tutorial | ?? |
| test_data| ?? |
| install_1| foo-server|
| install_1_dir | /usr/local/bin/ |
| install_1_admin | darked | 

## bwa-mem2

| Property | value |
| ------ | ------ |
| prog_name | bwa-mem2 |
| publication | XXX |
| citations_num | XXX |
| first_release_year | XXX |
| www | XXX  |
| repo | https://github.com/bwa-mem2/bwa-mem2 |
| lang | XXX |
| obtained_from | https://github.com/bwa-mem2/bwa-mem2/releases/download/v2.1/bwa-mem2-2.1_x64-linux.tar.bz2 |
| installed_version | 2.1 |
| installed_version_date |  2020.10.15 |
| newest_version | same as above |
| newest_version_date | same as above  |
| last_ver_check | 2020.12.29 |
| activity_main | active  |
| activity_dev |  |
| issues_github | active |
| requirements_1 | ??  |
| requirements_2 | ?? |
| tutorial | ?? |
| test_data| ?? |
| install_1| foo-server|
| install_1_dir | /usr/local/bin/ |
| install_1_admin | darked | 

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
| installed_version | >3.6.1 (git) |
| installed_version_date |  2019.05.24 |
| newest_version | same as above? |
| newest_version_date |  ??? |
| last_ver_check | 2020.12.29 |
| activity_main | active???  |
| activity_dev|  active |
| issues_github | active |
| requirements_1 | CUDA for GPU  |
| requirements_2 | ?? |
| tutorial | ?? |
| doc| ?? |
| test_data| ?? |
| install_1 | foo-server |
| install_1_dir | /opt/soft/gem3_3.6.1a |
| install_1_admin | darked | 
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
| installed_version | 992 |
| installed_version_date |  2019.10.09 |
| newest_version | 1170 |
| newest_version_date |  2020.12.28 |
| last_ver_check | 2020.12.29 |
| activity_main | active  |
| activity_dev|  ? |
| issues_github | not on github |
| requirements_1 | ??  |
| requirements_2 | ?? |
| tutorial | http://last.cbrc.jp/doc/last-tutorial.html |
| doc| http://last.cbrc.jp/doc/ |
| test_data| ?? |
| install_1| foo-server|
| install_1_dir | /opt/soft/last_992/ |
| install_1_admin | darked | 

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
| installed_version | 2.3.5.1 |
| installed_version_date |  2019.04.17 |
| newest_version | 2.4.2 |
| newest_version_date |  2020.10.06 |
| last_ver_check | 2020.12.29 |
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
| install_1_admin | darked |


## novoalign 

| Property | value |
| ------ | ------ |
| prog_name | novoalign |
| publication | ??? |
| citations_num | ??? |
| first_release_year | ??? |
| www |  http://bowtie-bio.sourceforge.net/bowtie2/index.shtml  |
| repo | https://github.com/BenLangmead/bowtie2  |
| lang | C++ |
| obtained_from | http://www.novocraft.com/support/download/ |
| installed_version | 3.09.04 |
| installed_version_date |  2019.10.04 |
| newest_version |4.03.02 |
| newest_version_date |  2020.11.24? |
| last_ver_check | 2020.12.29 |
| activity_main | active  |
| activity_dev|  no github |
| issues_github | no_gitgum |
| requirements_1 | ??  |
| requirements_2 | ?? |
| tutorial | ?? |
| doc |/opt/soft/novocraft_3.09.04/NovoalignReferenceManualV3.09.pdf |
| test_data| ?? |
| install_1| foo-server |
| install_1_dir | /opt/soft/novocraft_3.09.04/ |
| install_1_admin | darked |



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
