
# Nextflow bioinformatics pipeline manager

| Property | value |
| ------ | ------ |
| prog_name | nextflow |
| publication | https://www.nature.com/articles/nbt.3820 |
| citations_num |  203 (2019.11.14) |
| first_release_year | 2014+ |
| www | https://www.nextflow.io/ |
| repo | https://github.com/nextflow-io/nextflow |
| lang_1 | groovy |
| obtained_from | see curl command below |
| version | 20.04.1 |
| version_date |  2020.05.03 |
| last_ver_check | 2020.07.02 |
| requirements_1 | java |
| documentation | https://www.nextflow.io/docs/latest/index.html |
| install_1| workstn01 |
| install_1_dir | /opt/soft/bin/nextflow|
| install_1_admin | darked |
| intall_1_date| 2020.07.02 |

## pipelines/modules:


https://github.com/nextflow-io/awesome-nextflow


```
curl -s https://get.nextflow.io | bash

     N E X T F L O W
     version 20.04.1 build 5335
     created 03-05-2020 19:37 UTC (21:37 CEST)
     cite doi:10.1038/nbt.3820
     http://nextflow.io


# move it to common directory

mv -i nextflow /opt/soft/bin/

```

## running

```
# in fish shell

set -gx PATH /opt/soft/jdk_1.8.0_current/bin $PATH

#run to check options:

/opt/soft/bin/nextflow 

# toy example run

/opt/soft/bin/nextflow run hello

```
