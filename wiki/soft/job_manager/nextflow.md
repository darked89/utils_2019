
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
| version | 19.10.0 |
| version_date |  2019.10.31 |
| last_ver_check | 2019.11.14 |
| requirements_1 | java |
| documentation | https://www.nextflow.io/docs/latest/index.html |
| install_1| foo |
| install_1_dir | /opt/soft/bin/nextflow|
| install_1_admin | darked |
| intall_1_date| 2019.11.14 |

## pipelines/modules:


https://github.com/nextflow-io/awesome-nextflow


```
curl -s https://get.nextflow.io | bash

      N E X T F L O W
      version 19.10.0 build 5170
      created 21-10-2019 15:07 UTC (17:07 CEST)
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