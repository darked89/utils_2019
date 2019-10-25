## Background

1. overview of mapping/quantification

https://peerj.com/preprints/27283.pdf

1. benchmarking

https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6192213/

- essential 
    - [STAR](#star)
    - [GMAP/GSNAP](#gmap)

- to check
    - [Salmon](#salmon)
   
## STAR  

| Property | value |
| ------ | ------ |
| prog_name | STAR |
| publication | https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3530905/ |
| citations_num | 6862 (2019.05.31) |
| first_release_year | 2013? |
| www |   |
| repo |https://github.com/alexdobin/STAR |
| lang | C |
| obtained_from | https://github.com/alexdobin/STAR/archive/2.7.3a.tar.gz |
| version | 2.7.3a |
| version_date |  2019.10.08 |
| last_ver_check | 2019.10.11 |
| activity_main | active |
| activity_dev| no dev branch!  |
| issues_github | active |
| documentation| https://github.com/alexdobin/STAR/blob/master/doc/STARmanual.pdf |
| install_1 | foo-server|
| install_1_dir | /opt/soft/star_2.7.3a |
| install_1_admin | darked |
| install_2| bar-server|
| install_2_dir | /opt/soft/star_2.7.2b |
| install_2_admin | darked |

### Notes

*  downloaded distro contains precompiled binaries 
*  tested (2019.09.03)

#### genome indexing
```
#canonical hg38p13 genome and gene set:
/opt/soft/star_2.7.2a/bin/Linux_x86_64_static/STARlong --runThreadN=24 \
--runMode=genomeGenerate \
--genomeDir=/opt/genome/hg38/ \
--genomeFastaFiles=/opt/genome/hg38/GCA_000001405.15_GRCh38_no_alt_bar-server_set.fna \
--sjdbGTFfile=/opt/genome/hg38/gencode.v31.annotation.gtf  

#extended genome with ALT and genes on ALT contigs:
#!/bin/bash

/opt/soft/star_2.7.2b/bin/STARlong --runThreadN=24 \
--runMode=genomeGenerate \
--genomeDir=/opt/genome/hg38p12/ \
--genomeFastaFiles=/opt/genome/hg38p12/GCA_000001405.15_GRCh38_full_bar-server_set.fna \
--sjdbGTFfile=/opt/genome/hg38p12/gencode.v31.chr_patch_hapl_scaff.annotation.gtf

# caveat: untested. 
# For some reason hg38p13 NCBI genome sequences for bwa/etc not available 2019.09.11
#
```

#### mapping paired reads with the bam sorting by samtools

```
# on bar-server:
/opt/soft/star_2.7.2a/bin/Linux_x86_64_static/STARlong \
--runThreadN 24 \
--genomeDir /opt/genome/hg38/ \
--runMode alignReads \
--readFilesCommand pbzip2 -dc \
--outStd SAM \
--outFileNamePrefix cbrako-fix089_PT_0_7.rna.mrgd_4.clump.star_hg38.r12
--readFilesIn cbrako-fix089_PT_0_7.rna.mrgd_4.clump.r1.fq.bz2 cbrako-fix089_PT_0_7.rna.mrgd_4.clump.r2.fq.bz2 | \
samtools sort -@12 -o cbrako-fix089_PT_0_7.rna.mrgd_4.clump.star_hg38.r12.bam

#caveat: fix the default log/etc. output
 
```


## GMAP  

| Property | value |
| ------ | ------ |
| prog_name | gmap |
| publication | https://academic.oup.com/bioinformatics/article/21/9/1859/409207 |
| citations_num | 1196 (2019.05.31) |
| first_release_year | 2005 |
| www | http://research-pub.gene.com/gmap/  |
| repo | none |
| lang | C |
| obtained_from | http://research-pub.gene.com/gmap/src/gmap-gsnap-2019-09-12.tar.gz |
| version | 2019-09-12 |
| version_date |  2019.09.12 |
| last_ver_check | 2019.10.11 |
| activity_main | active |
| activity_dev| no repo  |
| issues_github | no github |
| mailing_list|  http://listserver.ebi.ac.uk/pipermail/gsnap-users/ |
| documentation| README |
| install_1 | foo-server |
| install_1_dir | /opt/soft/gmap_2019.09.12.10 |
| install_1_admin | darked |
| install_2 | bar-server |
| install_2_dir | /opt/soft/gmap_2019.09.12.10  |
| install_2_admin | darked |

```
# install on bar-server 
# modify the software version + 
# and the destination dir naming: gmap_2019.09.12.10

wget http://research-pub.gene.com/gmap/src/gmap-gsnap-2019-06-10.tar.gz 
tar xfv gmap-gsnap-2019-06-10.tar.gz 
mv gmap-2019-06-10/ gmap_20190610
cd gmap_20190610

sudo mkdir /opt/genome/gmapdb
sudo mkdir /opt/soft/gmap_20190610/bin
sudo mkdir /opt/soft/gmap_20190610 

./configure --prefix=/opt/soft/gmap_20190610/ --with-gmapdb=/opt/genome/gmapdb
make
make check
sudo make install

#db creation
gmap_20190610/bin/gmap_build -d hg38p13gmap /opt/genome/hg38/GCA_000001405.15_GRCh38_no_alt_bar-server_set.fna

```


### Notes

* compiled and make tested
* not fully installed (requires moving binaries and creating a genome databases)
* not tested with real data (2019.05.31)

## salmon  

| Property | value |
| ------ | ------ |
| prog_name | salmon |
| publication | https://www.nature.com/articles/nmeth.4197 |
| citations_num | 891 (2019.10.11) |
| first_release_year | 2017? |
| www | https://combine-lab.github.io/salmon/  |
| repo | none |
| lang | C++ |
| obtained_from |  https://github.com/COMBINE-lab/salmon/releases/download/v0.14.2/salmon_0.14.2_linux_x86_64.tar.gz |
| version | 0.14.2 |
| version_date |  2019.10.05 |
| last_ver_check | 2019.10.11 |
| activity_main | active |
| activity_dev| active  |
| issues_github | active |
| documentation|  https://salmon.readthedocs.io/en/latest/ |
| install_1 | foo-server |
| install_1_dir | /opt/soft/salmon_0.14.2 |
| install_1_admin | darked |

## subread  

| Property | value |
| ------ | ------ |
| prog_name | subread |
| publication | https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3664803/ |
| citations_num | 1016 (from 2013) |
| first_release_year | 2013? |
| www | http://subread.sourceforge.net/  |
| repo | none |
| lang | C |
| obtained_from |  https://sourceforge.net/projects/subread/files/subread-2.0.0/subread-2.0.0-source.tar.gz/download |
| version | 2.0.0 |
| version_date |  2019.09.04 |
| last_ver_check | 2019.10.25 |
| activity_main | sourceforge... |
| activity_dev| no gitgub  |
| issues_github | no github |
| documentation_1 | http://bioinf.wehi.edu.au/subread/ |
| documentation_2 |  http://subread.sourceforge.net/ |
| install_1 | foo-server |
| install_1_dir | /opt/soft/subread_2.0.0 |
| install_1_admin | darked |

### status **untested**

## Subread vs Star & others

repo https://sourceforge.net/projects/subread/

paper https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3664803/

http://genomespot.blogspot.com/2014/10/rna-seq-aligners-subread-star-hpg_9.html



## BBMap

```
to be evaluated. Good scores in the benchmark
```
