# TOC
- extract counts/quantify (primary)
    - [RSEM](#rsem)
    - [HTseq](#htseq)
- differential expression
    - [DESeq2](#deseq2)
    - [edgeR](#edger)


# Quantification

## RSEM

| Property | value |
| ------ | ------ |
| prog_name | rsem |
| publication | https://bmcbioinformatics.biomedcentral.com/articles/10.1186/1471-2105-12-323 |
| citations_num | 6045  (from 2011) |
| first_release_year | 2011? |
| www | http://deweylab.github.io/RSEM/  |
| repo | https://github.com/deweylab/RSEM |
| lang_1 | R |
| lang_2 | C++ |
| obtained_from | https://github.com/deweylab/RSEM/archive/v1.3.2.tar.gz |
| installed_version |  1.3.2 |
| installed_version_date | 2019.04.06 |
| newest_version | 1.3.3 |
| newest_version_date |  2020.02.14 |
| last_ver_check | 2020.12.31 |
| activity_main | active  |
| activity_dev| +/- active (2018) |
| issues_github | active |
| requirements_1 | ??  |
| requirements_2 | ?? |
| tutorial  | ?? |
| test_data | ?? |
| install_1 | foo-server|
| install_1_dir | /opt/soft/rsem_1.3.2 |
| install_1_admin | darked |

### Installation

```
wget https://github.com/deweylab/RSEM/archive/v1.3.2.tar.gz
tar xfv v1.3.2.tar.gz
mv RSEM-1.3.2/ rsem_1.3.2/
cd rsem_1.3.2
make
# caveat: binaries /scripts in the main dir

```

### primary use: 

RSEM is a software package for estimating gene and isoform expression levels 

## HTseq

| Property | value |
| ------ | ------ |
| prog_name | htseq |
| publication | https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4287950/ |
| citations_num |  6664   (from 2015) |
| first_release_year | 2015? |
| www |https://github.com/simon-anders/htseq  |
| repo | https://github.com/simon-anders/htseq |
| lang_1 | python |
| lang_2 | C++ |
| lang_3 | C? |
| obtained_from | https://github.com/simon-anders/htseq/archive/release_0.11.2.tar.gz |
| installed_version |  0.11.2 |
| installed_version_date | 2019.01.08 |
| newest_version | 0.11.3 |
| newest_version_date |  2020.03.01 |
| last_ver_check | 2020.12.31 |
| activity_main | active  |
| activity_dev| no dev, other branches |
| issues_github | active |
| requirements_1 | ??  |
| requirements_2 | ?? |
| documentation  | https://htseq.readthedocs.io/en/release_0.11.1/ |
| tutorial  | ?? |
| test_data | ?? |
| install_1 | foo-server|
| install_1_dir | xyz |
| install_1_admin | darked |


## DESeq2


| Property | value |
| ------ | ------ |
| prog_name | dseq2 (R package) |
| publication | https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4302049/ |
| citations_num | 11978 (from 2014) |
| first_release_year | 2014? |
| www | http://deweylab.github.io/RSEM/  |
| www_bioconductor | https://bioconductor.org/packages/release/bioc/html/DESeq2.html |
| repo | https://github.com/mikelove/DESeq2 |
| lang_1 | R |
| lang_2 | C++ |
| obtained_from | R/bioconductor/conda |
| installed_version |  1.26.0 |
| installed_version_date | 2019.10.18? |
| newest_version | 1.30.0 |
| newest_version_date |  ??? |
| last_ver_check | 2020.12.31 |
| activity_main | active  |
| activity_dev| no dev |
| issues_github | active at: https://support.bioconductor.org/  |
| requirements_1 | ??  |
| requirements_2 | ?? |
| tutorial  | ?? |
| test_data | ?? |
| install_1 | foo-server |
| install_1_dir | xyz |


### installation 
```
#inside R

if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

BiocManager::install("DESeq2")
```

### notes

Latest version 1.30.0 includes glmGamPoi method described here:  doi:10.1101/2020.08.13.249623
Relevant especially for single cell analysis. 


## edgeR


| Property | value |
| ------ | ------ |
| prog_name | edgeR |
| publication | https://academic.oup.com/nar/article/40/10/4288/2411520 |
| citations_num | 1609  (from 2012) |
| first_release_year | 2012? |
| www | http://bioinf.wehi.edu.au/edgeR/  |
| www_bioconductor | https://bioconductor.org/packages/release/bioc/html/edgeR.html |
| repo | no github repo (???) |
| lang_1 | R |
| lang_2 | C++ |
| obtained_from | R/bioconductor/conda |
| installed_version |  3.26.8 |
| installed_version_date |  2019.07.30? |
| newest_version | 	3.32.0 |
| newest_version_date |  ??? |
| last_ver_check | 2020.12.31 |
| activity_main | active  |
| activity_dev| no github repo |
| issues_github | active at: https://support.bioconductor.org/  |
| requirements_1 | ??  |
| requirements_2 | ?? |
| tutorial  | ?? |
| test_data | ?? |
| install_1 | foo-server |
| install_1_dir | xyz |


### installation 
```
#inside R
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

BiocManager::install("edgeR")

```


# background

* [A comprehensive evaluation of normalization methods for Illumina high-throughput RNA sequencing data analysis](https://academic.oup.com/bib/article/14/6/671/189645)

* [RNA sequencing: the teenage years 2019.07.24](https://www.uab.edu/hcgs/images/PDF_documents/RNA_sequencing-the_teenage_years_Nat_Rev_Genetics.pdf)

# to check

* [DropLasso: A robust variant of Lasso for single cell
RNA-seq data](https://hal.archives-ouvertes.fr/hal-01716704v2/document)


# to install/evaluate

## featureCounts from Subread package 

* http://bioinf.wehi.edu.au/featureCounts/

## kalisto


```
NL Bray, H Pimentel, P Melsted and L Pachter, Near optimal probabilistic RNA-seq quantification, Nature Biotechnology 34, p 525--527 (2016).

kallisto quantified bulk RNA-Seq can be analyzed with sleuth.

kallisto can be used together with bustools to pre-process single-cell RNA-seq data. See the kallistobus.tools website for instructions.

```

## sleuth

* https://github.com/pachterlab/sleuth



## todo

```
#stringtie
https://ccb.jhu.edu/software/stringtie/




# try limma + voom
https://ucdavis-bioinformatics-training.github.io/2018-June-RNA-Seq-Workshop/thursday/DE.html
 
```
