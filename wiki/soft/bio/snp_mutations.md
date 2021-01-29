# SNP calling software

## Background

* overview with detailed procedures (GATK, FreeBayes, VCFtools): https://wellcomeopenresearch.org/articles/4-50
* comparison #1 (somatic mutations calls): https://www.nature.com/articles/srep43169
* comparison #2 (octopus preprint) https://www.biorxiv.org/content/10.1101/456103v1 

# Mainline

## GATK

| Property | value |
| ------ | ------ |
| prog_name | GATK |
| publication | https://www.ncbi.nlm.nih.gov/pubmed?term=20644199|
| citations_num |  9876 (2019.05.08) |
| first_release_year | 2010? |
| www | https://software.broadinstitute.org/gatk/ |
| repo | https://github.com/broadinstitute/gatk |
| lang_1 | java |
| lang_2 | python |
| lang_3 | R |
| obtained_from | https://github.com/broadinstitute/gatk/releases/download/4.1.4.0/gatk-4.1.4.0.zip |
| version | 4.1.4.0 |
| version_date |  2019.10.08 |
| last_version | 4.1.9.0 |
| last_version_date | 2020.10.10 |
| last_ver_check | 2020.12.13 |
| requirements_1 | java 8 |
| requirements_2 | samtools |
| documentation | https://software.broadinstitute.org/gatk/documentation/ |
| input_requirement | **RG in BAM files** |
| install_1| foo-server|
| install_1_dir | /opt/soft/gatk_4.1.4.0 |
| install_1_admin | darked |

## FreeBayes

| Property | value |
| ------ | ------ |
| prog_name | FreeBayes |
| publication | https://arxiv.org/abs/1207.3907 |
| citations_num |  956 (2019.05.08) |
| first_release_year | 2012? |
| www |  https://github.com/ekg/freebayes |
| repo | https://github.com/ekg/freebayes |
| lang_1 | C (freebayes) |
| lang_2 | C++ (tools?) |
| obtained_from | git clone --recursive git://github.com/ekg/freebayes.git |
| version | 1.3.1-17-gaa2ace8 |
| version_date |  2019.06.03 | 
| last_version | 1.3.4 |
| last_version_date | 2021.02.29 |
| last_ver_check | 2021.01.29 |
| requirements | python |
| documentation | https://github.com/ekg/freebayes/blob/master/README.md |
| input_requirement | **RG in BAM files** |
| install_1| foo-server|
| install_1_dir | /opt/soft/freebayes_1.3.1.17 |
| install_1_admin| darked |


### BCFtools

| Property | value |
| ------ | ------ |
| prog_name | BCFtools |
| publication | ??? |
| citations_num |  ??? |
| first_release_year |  |
| www |   http://samtools.github.io/bcftools |
| repo | https://github.com/samtools/bcftools |
| lang_1 | C |
| obtained_from | https://github.com/samtools/bcftools/releases/download/1.9/bcftools-1.9.tar.bz2 |
| version | 1.9 |
| version_date |  2018.07.18 |
| last_version | 1.11 |
| last_version_date | 2020.09.22 |
| last_ver_check | 2020.12.13 |
| requirements | ??? |
| documentation |  http://samtools.github.io/bcftools/howtos/index.html|
| install_1| foo-server|
| install_1_dir | /usr/local/bin |



# in house main caller

## platypus

| Property | value |
| ------ | ------ |
| prog_name | platypus |
| publication | https://www.nature.com/articles/ng.3036|
| citations_num |  400 (2019.05.08) |
| first_release_year | 2012? |
| www | [lunter-group](https://www.imm.ox.ac.uk/research/units-and-centres/mrc-wimm-centre-for-computational-biology/groups/lunter-group/lunter-group/platypus-a-haplotype-based-variant-caller-for-next-generation-sequence-data ) |
| repo | https://github.com/andyrimmer/Platypus |
| lang_1 | python |
| lang_2 | cython |
| obtained_from | https://github.com/chapmanb/Platypus/releases/download/v0.8.1.2/Platypus_0.8.1.2.tgz |
| version | 0.8.1.2 |
| version_date |  2018.06.22 |
| last_ver_check | 2019.05.08 |
| requirements_1 | ??? |
| documentation | ??? |
| install_1| foo-server|
| install_1_dir | /opt/soft/platypus_20190508 |

```
# AP options sent 20190514

python /opt/platypus/Platypus.py callVariants

--bamFiles=/path/to/bam/foobar_001.bam
--regions=chr1,chr2,chr3,chr4,chr5,chr6,chr7,chr8,chr9,chr10,chr11,chr12,chr
13,chr14,chr15,chr16,chr17,chr18,chr19,chr20,chr21,chr22,chrX,chrY,chrM
--output=R014141_S9_001.vcf
--refFile=/opt/galaxy/data/hg38/hg38canon/bwa_index/hg38canon.fa
--logFileName=R014141_S9_001_log.txt --nCPU=6 --minReads=5 --minMapQual=30
--minBaseQual=30 --mergeClusteredVariants=0

```





# experimental

## octopus

| Property | value |
| ------ | ------ |
| prog_name | octopus |
| publication | https://www.biorxiv.org/content/10.1101/456103v1  |
| citations_num |  preprint |
| first_release_year | 2019? |
| www |   https://github.com/luntergroup/octopus |
| repo | https://github.com/luntergroup/octopus  |
| lang_1 | C++ |
| obtained_from | reo above   |
| version | 0.6.3 beta |
| version_date |  2019.03.21 |
| last_ver_check | 2019.10.06 |
| requirements | ??? |
| documentation | https://github.com/luntergroup/octopus |
| input_requirement | **RG in BAM files** |
| install_1| foo-server|
| install_1_dir | /opt/soft/octopus_201005 |
| install_1 admin| darked |

0.7.0 new version 2020.09.22

#### requirements from the github page

```
A C++14 compiler with SSE2 support
A C++14 standard library implementation
Git 2.5 or greater
Boost 1.65 or greater
htslib 1.4 or greater
GMP 5.1.0 or greater
CMake 3.9 or greater
Optional:
Python3 or greater
```
##### installation
```
#python3 required

git clone -b develop https://github.com/luntergroup/octopus.git
$ octopus/scripts/install.py --install-dependencies --download-forests

#two below are OK only if one wants to put octopus on the personal PATH
$ echo 'export PATH='$(pwd)'/octopus/bin:$PATH' >> ~/.bash_profile
$ source ~/.bash_profile
```

## DeepVariant

| Property | value |
| ------ | ------ |
| prog_name | DeepVariant |
| publication | https://www.nature.com/articles/nbt.4235 |
| citations_num |  53 (from 2018.10 !!!)  |
| first_release_year | 2018? |
| www |   https://github.com/google/deepvariant |
| repo | https://github.com/google/deepvariant |
| lang_1 | python |
| lang_1 | c++ |
| obtained_from | https://github.com/google/deepvariant/archive/v0.8.0.tar.gz |
| version | 0.8.0 |
| version_date |  2019.04.12 |
| last_ver_check | 2019.10.25 |
| requirements_1 | bazel |
| requirements_2 | numpy |
| documentation | https://github.com/google/deepvariant/tree/r0.8/docs |
| input_requirement | **RG in BAM files** xxx unknown xxx |
| install_1| foo-server |
| install_1_dir | /opt/soft/deepvariant_0.8.0 |
| install_1_admin | darked |

#### status: automatic tests during installation 

```
Executed 36 out of 36 tests: 34 tests pass and 2 fail locally.
```

## VarDict

| Property | value |
| ------ | ------ |
| prog_name | VarDict |
| publication | https://academic.oup.com/nar/article/44/11/e108/2468301?searchresult=1 |
| citations_num |  160 (from 2016)  |
| first_release_year | 2014/2016 |
| www |   ?? |
| repo | https://github.com/AstraZeneca-NGS/VarDictJava |
| lang_1 | java |
| lang_1 | perl (orig implement) |
| obtained_from | https://github.com/AstraZeneca-NGS/VarDictJava/releases/download/v1.6/VarDict-1.6.0.tar |
| version | 1.6.0 |
| version_date |  2019.06.04 |
| last_ver_check | 2019.10.06 |
| requirements | R |
| documentation | https://github.com/AstraZeneca-NGS/VarDictJava |
| install_1| foo-server |
| install_1_dir | /opt/soft/vardict_1.6.0|
| install_1_admin | darked |

#### status: untested





# brainstorm

* https://github.com/OpenGenomics/mc3

```
"Scalable Open Science Approach for Mutation Calling of Tumor Exomes Using Multiple Genomic Pipelines" Ellrott K, Bailey MH, Saksena G, Covington KR, Kandoth C, Stewart C, Hess J, Ma S, Chiotti KE, McLellan M, Sofia HJ, Hutter C, Getz G, Wheeler D, Ding L; MC3 Working Group; Cancer Genome Atlas Research Network. Cell Syst. 2018 Mar 28;6(3):271-281.e7. doi: 10.1016/j.cels.2018.03.002. PubMed PMID: 29596782. (http://www.cell.com/cell-systems/fulltext/S2405-4712(18)30096-6)
```

# varia

* PHEnix:  Public Health England SNP calling pipeline. http://phenix.readthedocs.io/en/latest/
