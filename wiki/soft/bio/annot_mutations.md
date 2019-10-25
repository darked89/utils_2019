-  Programs installed/being installed
    * [VEP](#vep)
    * [Annovar](#annovar)
    * [MutSig](#mutsigcv)
    * [Nirvana](#nirvana)
    * [2020plus](#2020plus)
    * [oncotator](#oncotator)
    * [vcfanno](#vcfanno)
    * [gemini](#gemini)
    * [annotSV](#annotsv)
    * [Genome STRiP](#svannotator)
    * [SURVIVOR_ant](#svcompare)




# VEP

| Property | value |
| ------ | ------ |
| prog_name | VEP |
| publication | https://genomebiology.biomedcentral.com/articles/10.1186/s13059-016-0974-4 |
| citations_num | 839 (2019.05.13) |
| first_release_year | 2016? |
| www | https://www.ensembl.org/info/docs/tools/vep/index.html |
| repo | https://github.com/Ensembl/ensembl-vep |
| docker | docker pull ensemblorg/ensembl-vep |
| lang | perl |
| obtained_from | docker install |
| version | 96.3 |
| version_date |  2019.06.21 |
| last_ver_check | 2019.06.24 |
| activity_main | active (release 2019.04+) |
| activity_dev (next relase)| active |
| issues_github | active |
| requirements_1 | ??  |
| requirements_2 | ?? |
| documentation | https://www.ensembl.org/info/docs/tools/vep/script/index.html |
| test_data| ?? |
| install_1| bar-server|
| install_1_dir | docker |
| install_2| foo-server |
| install_2_dir | docker |




Docker install on bar-server. 
/DANE_SYNOLOGY/users/darked89/vep_data

```
## commands
#1 (docker image)
sudo docker pull ensemblorg/ensembl-vep 
#2 (genome -> selected human)
docker run -t -i -v  /DANE_SYNOLOGY/users/darked89/vep_data:/opt/vep/.vep ensemblorg/ensembl-vep perl INSTALL.pl
#3 (VEP pluggins)
sudo docker run -t -i -v /DANE_SYNOLOGY/users/darked89/vep_data:/opt/vep/.vep ensemblorg/ensembl-vep perl INSTALL.pl -a cfp -s homo_sapiens -y GRCh38 -g all

darked89@bar-server /D/u/d/vep_data> sudo docker run -t -i -v /DANE_SYNOLOGY/users/darked89/vep_data:/opt/vep/.vep ensemblorg/ensembl-vep perl INSTALL.pl -a cfp -s homo_sapiens -y GRCh38 -g all

[sudo] password for darked89: 
 - getting list of available cache files

WARNING: It looks like you already have the cache for homo_sapiens GRCh38 (v96) installed.

Delete the folder /opt/vep/.vep/homo_sapiens/96_GRCh38 and re-run INSTALL.pl if you want to re-install
 - skipping homo_sapiens
 - downloading Homo_sapiens.GRCh38.dna.toplevel.fa.gz
 - downloading Homo_sapiens.GRCh38.dna.toplevel.fa.gz.fai
 - downloading Homo_sapiens.GRCh38.dna.toplevel.fa.gz.gzi

The FASTA file should be automatically detected by the VEP when using --cache or --offline.
If it is not, use "--fasta /opt/vep/.vep/homo_sapiens/96_GRCh38/Homo_sapiens.GRCh38.dna.toplevel.fa.gz"


WARNING: The following plugins have not been found: all
Available plugins: AncestralAllele,Blosum62,CADD,CSN,Carol,Condel,Conservation,Downstream,Draw,ExAC,ExACpLI,FATHMM_MKL,G2P,GO,GeneSplicer,Gwava,LD,LOVD,LoF,LoFtool,LocalID,MPC,MTR,MaxEntScan,NearestGene,Phenotypes,ProteinSeqs,REVEL,SameCodon,SpliceRegion,TSSDistance,dbNSFP,dbscSNV,miRNA

 - installing "AncestralAllele"
 - This plugin requires data
 - See /opt/vep/.vep/Plugins/AncestralAllele.pm for details
 - OK

 - installing "Blosum62"
 - add "--plugin Blosum62" to your VEP command to use this plugin
 - OK

 - installing "CADD"
 - This plugin requires data
 - See /opt/vep/.vep/Plugins/CADD.pm for details
 - OK

 - installing "CSN"
 - add "--plugin CSN" to your VEP command to use this plugin
 - OK

 - installing "Carol"
 - This plugin requires installation
 - See /opt/vep/.vep/Plugins/Carol.pm for details
 - OK

 - installing "Condel"
 - This plugin requires installation
 - See /opt/vep/.vep/Plugins/Condel.pm for details
 - OK

 - installing "Conservation"
 - add "--plugin Conservation,[options]" to your VEP command to use this plugin
 - OK

 - installing "Downstream"
 - add "--plugin Downstream" to your VEP command to use this plugin
 - OK

 - installing "Draw"
 - This plugin requires installation
 - See /opt/vep/.vep/Plugins/Draw.pm for details
 - OK

 - installing "ExAC"
 - This plugin requires data
 - See /opt/vep/.vep/Plugins/ExAC.pm for details
 - OK

 - installing "ExACpLI"
 - This plugin requires data
 - See /opt/vep/.vep/Plugins/ExACpLI.pm for details
 - OK

 - installing "FATHMM_MKL"
 - This plugin requires data
 - See /opt/vep/.vep/Plugins/FATHMM_MKL.pm for details
 - OK

 - installing "G2P"
 - This plugin requires data
 - See /opt/vep/.vep/Plugins/G2P.pm for details
 - OK

 - installing "GO"
 - add "--plugin GO" to your VEP command to use this plugin
 - OK

 - installing "GeneSplicer"
 - This plugin requires installation
 - See /opt/vep/.vep/Plugins/GeneSplicer.pm for details
 - OK

 - installing "Gwava"
 - This plugin requires data
 - See /opt/vep/.vep/Plugins/Gwava.pm for details
 - OK

 - installing "LD"
 - add "--plugin LD,[options]" to your VEP command to use this plugin
 - OK

 - installing "LOVD"
 - add "--plugin LOVD" to your VEP command to use this plugin
 - OK

 - installing "LoF"
 - This plugin requires installation
 - This plugin requires data
 - See /opt/vep/.vep/Plugins/LoF.pm for details
 - OK

 - installing "LoFtool"
 - This plugin requires data
 - See /opt/vep/.vep/Plugins/LoFtool.pm for details
 - OK

 - installing "LocalID"
 - add "--plugin LocalID" to your VEP command to use this plugin
 - OK

 - installing "MPC"
 - This plugin requires data
 - See /opt/vep/.vep/Plugins/MPC.pm for details
 - OK

 - installing "MTR"
 - This plugin requires data
 - See /opt/vep/.vep/Plugins/MTR.pm for details
 - OK

 - installing "MaxEntScan"
 - This plugin requires installation
 - See /opt/vep/.vep/Plugins/MaxEntScan.pm for details
 - OK

 - installing "NearestGene"
 - add "--plugin NearestGene" to your VEP command to use this plugin
 - OK

 - installing "Phenotypes"
 - This plugin requires data
 - See /opt/vep/.vep/Plugins/Phenotypes.pm for details
 - OK

 - installing "ProteinSeqs"
 - add "--plugin ProteinSeqs" to your VEP command to use this plugin
 - OK

 - installing "REVEL"
 - This plugin requires data
 - See /opt/vep/.vep/Plugins/REVEL.pm for details
 - OK

 - installing "SameCodon"
 - add "--plugin SameCodon" to your VEP command to use this plugin
 - OK

 - installing "SpliceRegion"
 - add "--plugin SpliceRegion" to your VEP command to use this plugin
 - OK

 - installing "TSSDistance"
 - add "--plugin TSSDistance" to your VEP command to use this plugin
 - OK

 - installing "dbNSFP"
 - This plugin requires installation
 - This plugin requires data
 - See /opt/vep/.vep/Plugins/dbNSFP.pm for details
 - OK

 - installing "dbscSNV"
 - This plugin requires installation
 - This plugin requires data
 - See /opt/vep/.vep/Plugins/dbscSNV.pm for details
 - OK

 - installing "miRNA"
 - add "--plugin miRNA" to your VEP command to use this plugin
 - OK

NB: One or more plugins that you have installed will not work without installation or downloading data; see logs above

All done

```

### mounting cache data(?) and running inside of the container
```
sudo docker run -t -i -v /DANE_SYNOLOGY/users/darked89/vep_data:/opt/vep/.vep:Z ensemblorg/ensembl-vep
```

# Annovar 


| Property | value |
| ------ | ------ |
| prog_name | annovar |
| publication | https://academic.oup.com/nar/article/38/16/e164/1749458 |
| citations_num | 5157 (2019.05.31) |
| first_release_year | 2010? |
| www | http://annovar.openbioinformatics.org/en/latest/ |
| repo | no repo |
| lang | perl |
| obtained_from | autor after registering ( http://download.openbioinformatics.org/annovar_download_form.php) |
| version | 2018.04.16 |
| version_date |  2018.04.16 |
| last_ver_check | 2019.05.31 |
| activity_main | active (release 2018.04+) |
| activity_dev | ?? |
| issues_github | no gitgub |
| requirements_1 | ??  |
| requirements_2 | ?? |
| documentation | http://annovar.openbioinformatics.org/en/latest/ |
| test_data| ?? |
| install_1| foo-server |
| install_1_dir | /opt/soft/annovar_20180416 |

### databases to download



* [x]  hg38 refGene
* [x]  hg38 knownGene
* [x]  hg38 ensGene
* [x]  hg38 dbnsfp35a
* [x]  hg38 dbscsnv11
* [x]  hg38 intervar_20180118
```
Note: newer version exists here: https://github.com/WGLab/InterVar/releases

Version 2.1.2
```
* [x]  hg38 esp6500siv2_all
* [x]  hg38 exac03
* [x]  hg38 exac03nontcga
* [x]  hg38 exac03nonpsych
* [x]  hg38 gnomad211_exome
* [x]  hg38 gnomad211_genome
* [x]  hg38 kaviar_20150923
```
Info: newer VCF version exist: http://db.systemsbiology.net/kaviar/
```
* [x]  hg38 hrcr1
* [x]  hg38 1000g2015aug ??? (6 data sets) ???
* [x]  hg38 mcap
* [x]  hg38 revel
* [x]  hg38 avsnp150
* [x]  hg38 nci60
* [x]  hg38 clinvar_20190305
* [x]  hg38 regsnpintron (from annovar, the web site is here https://regsnps-intron.ccbb.iupui.edu/)
* [x]  hg38?? LoFtool_scores
* [x]  hg38?? LoFtool_scores

```
wget http://www.openbioinformatics.org/annovar/download/LoFtool_scores.txt.gz
pigz -d LoFtool_scores.txt.gz
```



* [x]  COSMIC (manual download and preparation)
```
# besed on the procedure: http://annovar.openbioinformatics.org/en/latest/user-guide/filter/#cosmic-annotations

# web: https://cancer.sanger.ac.uk/cosmic/download (after registration, confirming account then re-logging)
# COSMIC v89, released 15-MAY-19

CosmicCodingMuts.vcf.gz
CosmicNonCodingVariants.vcf.gz
CosmicMutantExport.tsv.gz
CosmicNCV.tsv.gz 


# get the script (! error in the link !):
wget http://www.openbioinformatics.org/annovar/download/prepare_annovar_user.txt
mv prepare_annovar_user.txt prepare_annovar_user.pl
chmod +x prepare_annovar_user.pl

pigz -d Cosmic*gz

# coding cosmic:
../prepare_annovar_user.pl -dbtype cosmic CosmicMutantExport.tsv  -vcf CosmicCodingMuts.vcf > hg38_cosmic89_coding.txt

## messages:
# NOTICE: Finished reading 4787561 mutation ID from the VCF file CosmicCodingMuts.vcf
# NOTICE: Finished reading 3378630 COSMIC records in DB file CosmicMutantExport.tsv
# WARNING: 14027 COSMIC ID from MutantExport file cannot be found in VCF file (this may be normal if the VCF file only contains coding or noncoding variants

# non-coding cosmic:
../prepare_annovar_user.pl -dbtype cosmic CosmicNCV.tsv  -vcf CosmicNonCodingVariants.vcf > hg38_cosmic89_noncoding.txt 

## messages:
# NOTICE: Finished reading 21373936 mutation ID from the VCF file CosmicNonCodingVariants.vcf
# NOTICE: Finished reading 19106570 COSMIC records in DB file CosmicNCV.tsv
# WARNING: 460 COSMIC ID from MutantExport file cannot be found in VCF file (this may be normal if the VCF file only contains coding or noncoding variants

```

```
#!/bin/bash

./annotate_variation.pl -downdb --webfrom annovar -buildver hg38 refGene humandb/
./annotate_variation.pl -downdb --webfrom annovar -buildver hg38 knownGene humandb/
./annotate_variation.pl -downdb --webfrom annovar -buildver hg38 ensGene humandb/
./annotate_variation.pl -downdb --webfrom annovar -buildver hg38 dbnsfp35a humandb/
./annotate_variation.pl -downdb --webfrom annovar -buildver hg38 dbscsnv11 humandb/
./annotate_variation.pl -downdb --webfrom annovar -buildver hg38 intervar_20180118 humandb/
./annotate_variation.pl -downdb --webfrom annovar -buildver hg38 esp6500siv2_all humandb/
./annotate_variation.pl -downdb --webfrom annovar -buildver hg38 esp6500siv2_all humandb/
./annotate_variation.pl -downdb --webfrom annovar -buildver hg38 exac03nontcga  humandb/
./annotate_variation.pl -downdb --webfrom annovar -buildver hg38 exac03nonpsych  humandb/
./annotate_variation.pl -downdb --webfrom annovar -buildver hg38 gnomad211_exome  humandb/
./annotate_variation.pl -downdb --webfrom annovar -buildver hg38 gnomad211_genome  humandb/
./annotate_variation.pl -downdb --webfrom annovar -buildver hg38 kaviar_20150923  humandb/
./annotate_variation.pl -downdb --webfrom annovar -buildver hg38 hrcr1  humandb/
./annotate_variation.pl -downdb --webfrom annovar -buildver hg38 1000g2015aug  humandb/
./annotate_variation.pl -downdb --webfrom annovar -buildver hg38 mcap  humandb/
./annotate_variation.pl -downdb --webfrom annovar -buildver hg38 revel  humandb/
./annotate_variation.pl -downdb --webfrom annovar -buildver hg38 avsnp150  humandb/
./annotate_variation.pl -downdb --webfrom annovar -buildver hg38 nci60  humandb/
./annotate_variation.pl -downdb --webfrom annovar -buildver hg38 clinvar_20190305  humandb/
./annotate_variation.pl -downdb --webfrom annovar -buildver hg38 regsnpintron  humandb/

```



# MutSigCV

| Property | value |
| ------ | ------ |
| prog_name | mutsig |
| publication | https://www.nature.com/articles/nature12912 |
| citations_num | 1667 20190613 |
| first_release_year | 2014 |
| www | https://software.broadinstitute.org/cancer/cga/mutsig |
| repo | none |
| lang | Matlab |
| obtained_from | https://software.broadinstitute.org/cancer/cga/mutsig_download |
| version | 1.41  |
| version_date |  ?? |
| last_ver_check | 2019.06.13 |
| requirements_1 |  libncursesw.so.5 |
| requirements_2 | ?? |
| documentation | http://software.broadinstitute.org/cancer/software/genepattern/modules/docs/MutSigCV |
| test_data| https://software.broadinstitute.org/cancer/cga/mutsig_run (part Example data) !not working!|
| install_1| manjaro-linux-dk|
| install_1_dir | /home/darked89/proj_soft/mutsigcv_1.41 |

## inputs 

* MAF
```
One common source for MAF files that have been used in MutSigCV during the algorithm's development 
was the MuTect tool, followed by annotation of its output using Oncotator.  
More information can be found on MuTect here: http://www.broadinstitute.org/cancer/cga/mutect.    
Information about Oncotator can be found here: http://www.broadinstitute.org/oncotator.

## from the Supplement of the paper:
Mutation table
This file contains information about the mutations detected in the sequencing
project. It lists one mutation per row, and the columns (named in the header
row) report several pieces of information for each mutation. The five columns
required by MutSigCV are
• Hugo Symbol = name of the gene that the mutation was in
• Tumor Sample Barcode = name of the patient that the mutation was
in
• categ = number of the category that the mutation was in (categories
must match those in the coverage table)
• is coding = 1 (the mutation in a coding region or splice-site) or 0 (the
mutation is in a noncoding flanking region)
• is silent = 1 (the mutation is a synonymous change) or 0 (the mutation is a coding change or is noncoding)
For the specific data file used in the present manuscript, the category
numbers in categ are
1. transition mutations at CpG dinucleotides
2. transversion mutations at CpG dinucleotides
3. transition mutations at C:G basepairs not in CpG dinucleotides
4. transversion mutations at C:G basepairs not in CpG dinucleotides
5. transition mutations at A:T basepairs
6. transversion mutations at A:T basepairs
7. null+indel mutations, including nonsense, splice-site, and indel mut



```
* coverage file

```
Coverage file
This file contains information about the sequencing coverage achieved for each gene and patient/tumor. Within each gene-patient bin, the coverage is broken down further according to the mutation category (e.g., A:T basepairs, C:G basepairs), and also according to the effect (silent/nonsilent/noncoding). This tab-delimited file can be produced by processing the sample-level coverage files in WIG (wiggle) format output by the MuTect tool.  More information on MuTect can be found here: http://www.broadinstitute.org/cancer/cga/mutect.  If detailed coverage information is not available, the user can use a “full coverage” file that is available on the GenePattern server.

The columns of the file are:

gene: name of the gene for which this line reports coverage (corresponds to the MAF file's Hugo_Symbol)
effect: silent, nonsilent, or noncoding
categ: number of the category that this line reports coverage for (must match the categ in the mutation table)
<patient_name_1>: number of covered bases for this gene, effect, and category
<patient_name_2>: number of covered bases for this gene, effect, and category
<patient_name_ ...>: number of covered bases for this gene, effect, and category

## from the supplement:

Coverage table
This file contains information about the sequencing coverage achieved for
each gene and patient. Within each gene-patient bin, the coverage is broken
down further according to the category (e.g. A:T basepairs, C:G basepairs),
and also according to the zone (silent/nonsilent/noncoding). The columns
of the file are
• gene = name of the gene that this line reports coverage for
• zone = either silent, nonsilent, or noncoding
• categ = number of the category that this line reports coverage for
(must match the categories in the mutation table)
• PATIENT1 NAME = number of covered bases for PATIENT1 in this
gene, zone, and category
• PATIENT2 NAME = number of covered bases for PATIENT2 in this
gene, zone, and category
• ...
• PATIENTnp NAME = number of covered bases for PATIENTnp in
this gene, zone, and category
Note, covered bases will typically contribute fractionally to more than one
zone depending on the consequences of mutating to each of three different
possible alternate bases. For example, a particular covered C base may count
2
3 toward the nonsilent zone and 1
3 toward the silent zone, if mutation
to A or G causes an amino acid change whereas mutation to T is silent
(synonymous).

```

* Covariate file

```
Covariate file
This file contains the genomic covariate data for each gene, for example, expression levels and DNA replication times, that will be used in MutSigCV to judge which genes are close to each other in mathematical "covariate space."

In general, the columns of this file are:

gene: name of the gene for which this line reports coverage
COVARIATE1 NAME: value of COVARIATE1 for this gene
COVARIATE2 NAME: value of COVARIATE2 for this gene
COVARIATEnv NAME: value of COVARIATEnv for this gene
For the specific data file supplied in GenePattern, the columns are:

gene: name of the gene for which this line reports coverage
expr: expression level of this gene, averaged across 91 cell lines in the Cancer Cell Line Encylcopedia (CCLE)
reptime: DNA replication time of this gene (measured in HeLa cells), ranging from 100 (very early) to 1000 (very late)
hic: chromatin state of this gene (measured from HiC experments in K562 cells) ranging approximately from -50 (very closed) to +50 (very open)

## from the Supplement

This file contains the genomic covariate data for each gene, for example
expression levels and DNA replication times, that will be used in MutSigCV
to judge which genes are near to each other in covariate space. In general,
the columns of this file are
• gene = name of the gene that this line reports coverage for
21
W W W. N A T U R E . C O M / N A T U R E | 2 1
SUPPLEMENTARY INFORMATION RESEARCH
• COVARIATE1 NAME = value of COVARIATE1 for this gene
• COVARIATE2 NAME = value of COVARIATE2 for this gene
• ...
• COVARIATEnv NAME = value of COVARIATEnv for this gene
For the specific data file used in the present manuscript, the columns are
• gene = name of the gene that this line reports coverage for
• expr = expression level of this gene, averaged across many cell lines in
the Cancer Cell Line Encylcopedia
• reptime = DNA replication time of this gene, ranging approximately
from 100 (very early) to 1000 (very late)
• hic = chromatin compartment of this gene, measured from HiC experment, ranging approximately from -50 (very closed) to +50 (very
open)
Note, gene and patient names must agree across these three tables. Similarly, the categ category numbers must agree between the mutation table
and the coverage table.

```


## Web module in GenePattern (registration required)

www: https://cloud.genepattern.org/gp/pages/index.jsf

version of Mutsig: 1.3.4

 
## local linux install

```
# on manjaro-linux-dk

# matlab LD_LIBRARY_PATH
/opt/soft/matlab_R2016a/runtime/v901/runtime/glnxa64:/opt/soft/matlab_R2016a/runtime/v901/bin/glnxa64:/opt/soft/matlab_R2016a/runtime/v901/sys/os/glnxa64:

# running requires unst
ncurses5-compat-libs

# set up env (bash)
export LD_LIBRARY_PATH=/opt/soft/matlab_R2016a/runtime/v901/runtime/glnxa64:/opt/soft/matlab_R2016a/runtime/v901/bin/glnxa64:/opt/soft/matlab_R2016a/runtime/v901/sys/os/glnxa64:/opt/soft/matlab_R2016a/runtime/v901/sys/opengl/lib/glnxa64

# download example data and unzip
cd data

https://software.broadinstitute.org/cancer/cga/sites/default/files/data/tools/mutsig/MutSigCV_example_data.1.0.1.zip

unzip MutSigCV_example_data.1.0.1.zip

# run it:
../../MutSigCV  LUSC.mutations.maf LUSC.coverage.txt gene.covariates.txt  output.txt

======================================
  MutSigCV
  v1.4

  (c) Mike Lawrence and Gaddy Getz
  Broad Institute of MIT and Harvard
======================================


MutSigCV: PREPROCESS
--------------------
Loading mutation_file...
Loading coverage file...
Processing mutation "effect"...
NOTE:  This version now ignores "is_coding" and "is_silent".
       Requires Variant_Classification/type column and mutation_type_dictionary so we can assign nulls.
Error using MutSigCV>MutSig_preprocess (line 291)
missing mutation_type_dictionary_file

Error in MutSigCV (line 184)

# missing mutation_type_dictionary_file.txt
# discovered putative mutation_type_dictionary file:

wget https://raw.githubusercontent.com/tgen/CovGen/master/snpEff_ANN_mutation_type_dictionary_file.txt
mv -i snpEff_ANN_mutation_type_dictionary_file.txt mutation_type_dictionary_file.txt

# missing chromosome files
wget http://www.broadinstitute.org/cancer/cga/sites/default/files/data/tools/mutsig/reference_files/chr_files_hg19.zip

unzip chr_files_hg19.zip
ln -s chr_files_hg19 chr_files

# wrong mutation_names in the LUSC.mutations.maf
Frame_Shift_Ins   => inframe_insertion
Frame_Shift_Del   => inframe_deletion
Intron            => intron_variant
Silent            => synonymous_variant
Missense_Mutation => missense_variant
3'UTR             => 3_prime_UTR_variant #6
5'UTR             => 5_prime_UTR_variant #7
# the types left:

5'Flank 
Nonsense_Mutation
Nonstop_Mutation
RNA
Splice_Site
Translation_Start_Site
Variant_Classification


# running again: (with 3_prime_UTR_variant #6 corrections)
./MutSigCV data/LUSC.maf data/LUSC.coverage.txt data/gene.covariates.txt ./new_lusk

<snip>
MutSigCV: PREPROCESS
--------------------
Loading mutation_file...
Loading coverage file...
Processing mutation "effect"...
NOTE:  This version now ignores "is_coding" and "is_silent".
       Requires Variant_Classification/type column and mutation_type_dictionary so we can assign nulls.
WARNING:  8286/137343 mutations could not be mapped to effect using mutation_type_dictionary_file:

                       RNA: [33]
          Nonstop_Mutation: [58]
    Translation_Start_Site: [103]
                   5'Flank: [1255]
               Splice_Site: [1307]
                     5'UTR: [1634]
         Nonsense_Mutation: [3896]
                 ----TOTAL: [8286]
          They will be removed from the bar-server.
<snip>
MutSigCV: RUN
-------------
Loading mutation_file...
NOTE:  Both "gene" and "Hugo_Symbol" are present in mutation_file.  Using "gene".
NOTE:  Both "patient" and "Tumor_Sample_Barcode" are present in mutation_file.  Using "patient".
Loading coverage file...
Loading covariate file...
NOTE:  Trimming "-Tumor" from patient names.
NOTE:  Converting "-" to "_" in patient names.
Building n and N tables...
Processing covariates...
Finding bagels...  1000/18267 2000/18267 3000/18267 4000/18267 5000/18267 6000/18267 7000/18267 8000/18267 9000/18267 10000/18267 11000/18267 12000/18267 13000/18267 14000/18267 15000/18267 16000/18267 17000/18267 18000/18267 
Expanding to (x,X)_gcp...
Calculating p-value using 2D Projection method...  1000/18267 2000/18267 3000/18267 4000/18267 5000/18267 6000/18267 7000/18267 8000/18267 9000/18267 10000/18267 11000/18267 12000/18267 13000/18267 14000/18267 15000/18267 16000/18267 17000/18267 18000/18267 
Done.  Wrote results to ./new_lusk.sig_genes.txt

# running with 5_prime_UTR_variant #7:

./MutSigCV data/LUSC.maf data/LUSC.coverage.txt data/gene.covariates.txt ./7_muttype_corrected

# WARNING:  6652/137343 mutations could not be mapped

```

## checking if it is possible to run the Matlab code using Octave

```
# manjaro linux
# GNU Octave, version 5.1.0

In Octave GUI:
MutSigCV('data/LUSC.maf','data/LUSC.coverage.txt','data/gene.covariates.txt','LUSC.output_dk01.txt')

# warning: the 'verLessThan' function is not yet implemented in Octave

# fixing it (hack):
%%% dk 20190614a
function v = verLessThan()
    v = true;
end
%%% dk 20190614a end

# running again:
MutSigCV('data/LUSC.maf','data/LUSC.coverage.txt','data/gene.covariates.txt','LUSC.output_dk01.txt')

# error: 'fields' undefined near line 2103 column 11
# error: called from
#    MutSigCV>slength at line 2103 column 9
#    MutSigCV>MutSig_preprocess at line 303 column 7
#    MutSigCV at line 184 column 3

# checking if octave_python may be used to make more sense of the errors
# in Octave GUI Command window:

pkg install https://gitlab.com/mtmiller/octave-pythonic/-/archive/v0.0.1/octave-pythonic-v0.0.1.tar.gz
pkg load pythonic

# status:
# while simple things like py.print(some_variable) do work, the pythonic way of printing i.e all used parameters 
# is not working when using some_variable from Octave/Matlab out of the box. 
# abandoned for time being 20190617

```

### generating inputs for MutSigCV

* oncotator generates a file 

```
test_Patient0.snp.maf.txt

#9 column values counts:

     15 3'UTR
      7 5'Flank
      7 5'UTR
     16 IGR
     20 Intron
      1 lincRNA
    414 Missense_Mutation
     19 Nonsense_Mutation
      3 RNA
    212 Silent
     15 Splice_Site
      1 Start_Codon_SNP
      1 Variant_Classification

```

### info about preprocessing

* using VEP: https://www.biostars.org/p/108112/
* vcf2maf https://github.com/mskcc/vcf2maf

```
# newer MAF files look like being processed by VEP with some effect prediction
Run online VEP at:
https://www.ensembl.org/Homo_sapiens/Tools/VEP/Results?db=core;tl=UUNNMKIL4SaYItNz-5404366

```

# 2 check 

## Nirvana

NImble and Robust VAriant aNnotAtor

| Property | value |
| ------ | ------ |
| prog_name | nirvana |
| publication | https://www.pnas.org/content/113/50/14330 |
| citations_num | 99 (2019.06.17) |
| first_release_year | 2016? |
| www | ?? |
| repo | https://github.com/Illumina/Nirvana |
| docker | ?? |
| lang | C# |
| obtained_from |  https://github.com/Illumina/Nirvana/archive/v2.0.9.tar.gz |
| version | 2.0.9 |
| version_date |  2018.04.26 |
| last_ver_check | 2019.06.18 |
| activity_main | on hold last year |
| activity_dev | on hold last year |
| issues_github | active |
| requirements_1 | Microsoft .Net runtime (see below)  |
| requirements_2 | ?? |
| documentation | https://github.com/Illumina/Nirvana/wiki  |
| test_data| ?? |
| install_1| mab@TASK|
| install_1_dir | /mnt/vdb1/soft/nirvana_2.0.9 |
| status | test script passed |

TestNirvana.sh

https://github.com/Illumina/Nirvana

### to get .NET runtime

```
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.asc.gpg
sudo mv microsoft.asc.gpg /etc/apt/trusted.gpg.d/
wget -q https://packages.microsoft.com/config/debian/9/prod.list
sudo mv prod.list /etc/apt/sources.list.d/microsoft-prod.list
sudo chown root:root /etc/apt/trusted.gpg.d/microsoft.asc.gpg
sudo chown root:root /etc/apt/sources.list.d/microsoft-prod.list

# installation 
sudo apt-get install apt-transport-https

sudo apt-get update

# this is not needed:
# sudo apt-get install aspnetcore-runtime-2.2

#use:
sudo apt-get install dotnet-runtime-2.2

```


### install from source
```
https://github.com/Illumina/Nirvana/archive/v2.0.9.tar.gz
tar xfvz v2.0.9.tar.gz
mv -i Nirvana-2.0.9/ nirvana_2.0.9/

##  testing (edit script)
https://raw.githubusercontent.com/wiki/Illumina/Nirvana/scripts/TestNirvana.sh

```
### databases listed 

* dbSNP
* 1000 Genomes Project
* EVS
* ExAC
* phyloP conservation score
* ClinVar
* COSMIC
* DGV

Multiple other annotations included (see the wiki page)

### running it

```
input: VCF

output: json
```


## 2020plus



* for cancer

| Property | value |
| ------ | ------ |
| prog_name | 2020plus |
| publication | https://www.pnas.org/content/113/50/14330 |
| citations_num | 99 (2019.06.17) |
| first_release_year | 2016? |
| www | ?? |
| repo | https://github.com/KarchinLab/2020plus |
| docker | ?? |
| lang | Python |
| obtained_from | https://github.com/KarchinLab/2020plus/archive/v1.2.2.tar.gz |
| version | 1.2.3 (version num problem) |
| version_date |  2019.05.30? |
| last_ver_check | 2019.06.17 |
| activity_main | active |
| activity_dev | active |
| issues_github | active |
| requirements_1 | conda  |
| requirements_2 | ?? |
| documentation | https://2020plus.readthedocs.io/en/latest/ |
| test_data| ?? |
| install_1| mab@TASK|
| install_1_dir | /opt/soft/2020plus_1.2.3/ |
| status | not tested |


## TUSON

https://www.ncbi.nlm.nih.gov/pubmed/24183448

## Speedseq??

https://github.com/hall-lab/speedseq





## oncotator 

* for MutSigCv pipeline

```
lftp gsapubftp-anonymous@ftp.broadinstitute.org/bundle/oncotator/
# empty passwd, press enter
get oncotator_v1_ds_April052016.tar.gz
# 15GB download, ~2hrs on mab@TASK 

wget https://github.com/broadinstitute/oncotator/archive/v1.9.9.0.tar.gz
tar xfvz v1.9.9.0.tar.gz
mv -i oncotator-1.9.9.0/ /opt/soft/oncotator_1.9.9.0/
cd /opt/soft/oncotator_1.9.9.0/
wget https://personal.broadinstitute.org/lichtens/oncobeta/tx_exact_uniprot_matches.AKT1_CRLF2_FGFR1.txt 

# Oncotator requires Python 2.7.x; 
# DEPRECATION: Python 2.7 will reach the end of its life on January 1st, 2020.



sudo pip install virtualenv
bash scripts/create_oncotator_venv.sh -e /opt/soft/oncotator_1.9.9.0/ 
source ./bin/activate.fish

python setup.py install

# checking if it works

oncotator -h

#success!


```

### running tests

```
bash run_ci_tests_no_activate.sh  MY_DB_DIR/

# problems with bigWig (to be ignored since we do not use them)

# problems with COSMIC indexing and retrieval (4 solving)

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


## gemini


| Property | value |
| ------ | ------ |
| prog_name | gemini |
| publication | https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1003153 |
| citations_num | 211  (2019.06.24) |
| first_release_year | 2013 |
| www | https://gemini.readthedocs.io/en/latest/ |
| repo | https://github.com/arq5x/gemini |
| lang | python |
| obtained_from | https://github.com/arq5x/gemini  |
| version | 0.30.1  |
| version_date |  2019.02.07 |
| last_ver_check | 2019.06.24 |
| requirements_1 | python |
| install_1| foo-server|
| install_1_dir | /opt/soft/gemini/ |

### installation

```
# caveat: few links/mv missing
mkdir gemini_20190618
cd gemini_20190618/

wget https://github.com/arq5x/gemini/raw/master/gemini/scripts/gemini_install.py
python gemini_install.py /opt/soft/gemini/  /opt/soft/gemini/
PATH=$tools/bin:$data/anaconda/bin:$PATH
```

### usage

* hg19 only
* python2 




## CVE in R

https://bioconductor.org/packages/release/bioc/vignettes/CVE/inst/doc/CVE_tutorial.html


### annotate VCF with coverage if not already done

* check: https://pvactools.readthedocs.io/en/latest/pvacseq/input_file_prep/readcounts.html

## crossmap -> lift the annotations between genomes

https://sourceforge.net/projects/crossmap/files/


# AnnotSV

| Property | value |
| ------ | ------ |
| prog_name | AnnotSV |
| publication |  |
| citations_num | |
| first_release_year |  |
| www | https://lbgi.fr/AnnotSV/ |
| repo | https://github.com/lgmgeo/AnnotSV |
| docker |  |
| lang | Tcl |
| obtained_from |  |
| version | 2.2 |
| version_date |  2019/07/09 |
| last_ver_check | 2019/08/25 |
| activity_main |  |
| activity_dev (next relase)|  |
| issues_github |  |
| requirements_1 | ??  |
| requirements_2 | ?? |
| documentation |  |
| test_data| ?? |
| install_1| bar-server|
| install_1_dir | /opt/soft/AnnotSV_2.2 |





### Test installation commands:

```
## commands
export ANNOTSV=/opt/soft/AnnotSV_2.2
/opt/soft/AnnotSV_2.2/bin/AnnotSV/AnnotSV.tcl -SVinputFile /opt/soft/AnnotSV_2.2/share/example/HG00096.SV.bed -vcfFiles "/opt/soft/AnnotSV_2.2/share/example/input/HG00096.chr*phase3.vcf" -outputFile ./HG00096.SV.annotated.tsv


```

# Genome STRiP

| Property | value |
| ------ | ------ |
| prog_name | Genome STRiP (svtoolkit) > SVAnnotator |
| publication |  |
| citations_num | |
| first_release_year |  |
| www | http://software.broadinstitute.org/software/genomestrip/org_broadinstitute_sv_main_SVAnnotator.html |
| repo |  |
| docker |  |
| lang | Java |
| obtained_from |  |
| version | 2.00.1918 |
| version_date |  2019/05/27 |
| last_ver_check | 2019/08/25 |
| activity_main |  |
| activity_dev (next relase)|  |
| issues_github |  |
| requirements_1 | ??  |
| requirements_2 | ?? |
| documentation |  |
| test_data| ?? |
| install_1| bar-server|
| install_1_dir | /opt/soft/svtoolkit_2.00.1918 |





### Test installation commands:

```
## commands
export SV_DIR=/opt/soft/svtoolkit_current
export JAVA_HOME=/opt/soft/graalvm-ee_current
export PATH=/opt/soft/graalvm-ee_current/bin:$PATH
/opt/soft/svtoolkit_current/installtest/discovery.sh
/opt/soft/svtoolkit_current/installtest/genotyping.sh

```


# SURVIVOR_ant

| Property | value |
| ------ | ------ |
| prog_name | SURVIVOR_ant (svcompare) |
| publication | https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5668921/ |
| citations_num | |
| first_release_year |  |
| www | https://github.com/NCBI-Hackathons/svcompare |
| repo | https://github.com/NCBI-Hackathons/svcompare |
| docker |  |
| lang | Perl, R |
| obtained_from |  |
| version |  |
| version_date |  2019/08/20 |
| last_ver_check | 2019/08/25 |
| activity_main |  |
| activity_dev (next relase)|  |
| issues_github |  |
| requirements_1 | ??  |
| requirements_2 | ?? |
| documentation |  |
| test_data| ?? |
| install_1| bar-server|
| install_1_dir | /opt/soft/svcompare |





### Test installation commands:

```
## commands
/opt/soft/svcompare/scripts/bar-server//run_all.sh

```
