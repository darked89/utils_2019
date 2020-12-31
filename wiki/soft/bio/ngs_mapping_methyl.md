# Methylation software

## Alignment

### Bismark

| Property | value |
| ------ | ------ |
| prog_name | Bismark |
| publication | https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3102221/ |
| citations_num | 1378 (2019.04.25) |
| first_release_year | 2011 |
| www | https://www.bioinformatics.babraham.ac.uk/projects/bismark/ |
| repo | https://github.com/FelixKrueger/Bismark |
| lang | perl |
| obtained_from | https://github.com/FelixKrueger/Bismark/archive/0.22.1.tar.gz |
| installed_version |  0.22.1 |
| installed_version_date |  2019.04.21 |
| newest_version | 0.23.0 |
| newest_version_date |  2020.11.09   |
| last_ver_check | 2020.12.31 |
| activity_main | active |
| activity_dev| no dev branch!  |
| issues_github | active |
| requirements_1 | Bowtie2 or HISAT2  |
| requirements_2 | Samtools |
| tutorial | https://rawgit.com/FelixKrueger/Bismark/master/Docs/Bismark_User_Guide.html |
| test_data| https://www.bioinformatics.babraham.ac.uk/projects/bismark/test_data.fastq (! uncompressed FASTQ) |
| install_1| foo-server|
| install_1_dir | /opt/soft/bismark_0.22.1/ |

## 2 check
### bisulfighter (uses LAST )


| Property | value |
| ------ | ------ |
| prog_name | bisulfighter |
| publication | https://www.ncbi.nlm.nih.gov/pubmed/24423865 |
| citations_num | 47 (2019.05.08) |
| first_release_year | 2014 |
| www | https://epigenome.cbrc.jp/bisulfighter |
| repo | https://github.com/yutaka-saito/Bisulfighter |

###  hpg-methyl

| Property | value |
| ------ | ------ |
| prog_name | hpg-methyl |
| publication | https://bmcbioinformatics.biomedcentral.com/articles/10.1186/s12859-017-1574-3 |
| citations_num | 6 (2019.04.25) mostly self |
| first_release_year | 2017 |
| repo | https://github.com/grev-uv/hpg-methyl |
| lang | C |

###  BitMapperBS
| Property | value |
| ------ | ------ |
| prog_name | BitMapperBS |
| publication | https://www.biorxiv.org/content/10.1101/442798v2 |
| citations_num | 0 (2019.04.25) |
| first_release_year | 2019? |
| repo | https://github.com/chhylp123/BitMapperBS |
| lang | c++ |


### Bison

article https://bmcbioinformatics.biomedcentral.com/articles/10.1186/1471-2105-15-337

repo https://github.com/dpryan79/bison

## Bicicle

article https://academic.oup.com/bioinformatics/article/34/8/1414/4683461

www http://www.sing-group.org/bicycle/

repo https://github.com/sing-group/bicycle

## Biscuit (2019?)

repo https://github.com/zwdzwd/biscuit
docker https://github.com/genome/docker-biscuit

## GEMBss from CNAG / Angelika

https://github.com/heathsc/gemBS


### install

```
sudo apt-get update
sudo apt-get install -y python3 build-essential git python3-pip wget pigz
sudo apt-get install -y zlib1g-dev libbz2-dev gsl-bin libgsl0-dev
sudo apt-get install -y libncurses5-dev liblzma-dev libssl-dev libcurl4-openssl-dev
# no sudo in the git readme
sudo pip3 install matplotlib multiprocess


git clone --recursive https://github.com/heathsc/gemBS.git

cd gemBS

python3 setup.py install
sudo python3 setup.py install

# installs in /usr/local/bin
-rwxr-xr-x 1 root     staff         220 Jun 27 16:16 f2py3.5*
-rwxr-xr-x 1 root     staff         220 Jun 27 16:16 f2py3*
-rwxr-xr-x 1 root     staff         220 Jun 27 16:16 f2py*
-rwxr-xr-x 1 root     staff        1651 Jun 27 16:16 get_objgraph*
-rwxr-xr-x 1 root     staff         587 Jun 27 16:16 undill*
-rwxr-xr-x 1 root     staff         444 Jun 27 16:27 gemBS*


```

## Post-alignment 2 check
MethGo: a comprehensive tool for analyzing whole-genome bisulfite sequencing data (packages inside as well)
https://bmcgenomics.biomedcentral.com/articles/10.1186/1471-2164-16-S12-S11


## 2 check

* https://github.com/dpryan79/MethylDackel
