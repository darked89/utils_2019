# Singularity


| Property | value |
| ------ | ------ |
| prog_name | singularity|
| publication | https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0177459 |
| citations_num | 239 (from May 2017) |
| first_release_year | 2017? |
| www | https://sylabs.io/singularity/  |
| repo | https://github.com/sylabs/singularity |
| lang | go |
| obtained_from |  https://github.com/sylabs/singularity/releases/download/v3.4.2/singularity-3.4.2.tar.gz |
| version | 3.4.2-1 |
| version_date |  2019.10.15 |
| last_ver_check | 2019.10.22 |
| installed_version | 3.4.2-1 |
| installed_version_date |  2019.10.15 |
| newest_version | 3.7.2 |
| newest_version_date | 2021.03.10 |
| last_ver_check |  2021.03.22 |
| activity_main | active  |
| activity_dev| multiple branches, active |
| issues_github | active |
| requirements_1 | sudo for creating .def files |
| documentation | https://sylabs.io/docs/ |
| examples | https://github.com/sylabs/examples |
| install_1| foo-server|
| install_1_dir | /opt/soft/bin/ |
| install_1_admin | darked |

## local definitions

The .def files are in: 
```
https://github.com/darked89/utils_2019/tree/master/soft/containers/singularity
```

* sambamba_0.7.0_alpine.def
* star_rnaseq_273a_alpine.def

 
## building .sif images

```
#sambamba
sudo singularity build sambamba_0.7.0_alpine.sif sambamba_0.7.0_alpine.def 

#star
sudo singularity build star_rnaseq_273a_alpine.sif star_rnaseq_273a_alpine.def
```

## running programs from images:

```
#sambamba
singularity exec sambamba_0.7.0_alpine.sif sambamba sort --sort-picard -t 24 --tmpdir=./ cbrako-fix116_BL_0.dna_tg1.r12.bwa_hg38p13.bam_mrgd.bam 

```



