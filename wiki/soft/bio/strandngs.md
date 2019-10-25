## strandNGS

* installed on Linux (pharmacy) and on Windows (Biobank)

| Property | value |
| ------ | ------ |
| prog_name | strandNGS|
| publication | ??? |
| citations_num | ??? |
| first_release_year | ??? |
| www |  https://www.strand-ngs.com/  |
| repo | none |
| lang | Java/R? |
| obtained_from |  https://www.strand-ngs.com/download/installers |
| version | ?? |
| version_date |  ?? |
| last_ver_check |  |
| requirements_1 | cc/gcc |
| install_1 | ryzen-manjaro-dk |
| install_1_IP | 5.5.0.190 |
| install_1_dir | /opt/soft/strandNGS/ |

### running it

```
#connect to 5.5.0.190 (you need to be connected to a pharmacy subnet)

ssh -XY strandngs@5.5.0.190
# it asks for a password (one containing a secret location)

#you connect and the prompt looks like:
# strandngs@ryzen-manjaro-dk

# in case of doubt, check who you are and where you are:

whoami

uname -a

# to start the GUI of the program:

run_strandngs


```
