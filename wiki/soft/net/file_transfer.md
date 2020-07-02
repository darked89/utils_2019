## Filezilla 

GUI program to transfer files using sftp protocol from/to Linux servers. Windows/Mac clients.

| Property | value |
| ------ | ------ |
| prog_name | Filezilla Client |
| first_release_year | 2001|
| www  | https://filezilla-project.org/ |
| wikipedia | https://en.wikipedia.org/wiki/FileZilla |
| lang | C++ |
| platform_1 | Linux |
| platform_2 | Windows_10 |
| obtained_from | https://filezilla-project.org/download.php?platform=win64  |
| version | 3.48.1|
| version_date |  2020.05.19 |
| last_ver_check | 2020.07.02 |

## Aspera

| Property | value |
| ------ | ------ |
| prog_name | Aspera Client |
| first_release_year | ??? |
| www  | https://www.ibm.com/products/aspera |
| wikipedia | nope |
| lang | ??? |
| obtained_from | https://downloads.asperasoft.com/en/downloads/62  |
| version | 3.9.6 |
| version_date |  2020.01.31 |
| last_ver_check | 2020.07.02 |

**Note_1**

```
# The shell file: 
# ibm-aspera-cli-3.9.6.1467.159c5b1-linux-64-release.sh
# installs the software in
$HOME/.aspera/cli

# binaries in 
$HOME/.aspera/cli/bin

ascp  
ascp4  
aspera

```

**Note_2**

For browsed based SRA file downloads from NCBI check:  https://www.ncbi.nlm.nih.gov/books/NBK158898/

# legacy BAM and other file format transfer from CGHub

## GeneTorrent

The cghub web seems to be down. The software is not maintained.
There is a 3 years old Docker container:

* https://hub.docker.com/r/opengenomics/genetorrent/


```
You can compile GeneTorrent ver 3.8.7 on Centos 7. I have used installed from source xerces-c-3.1.2 plus XQilla-2.3.1. Apart from this redhat-lsb-core package. The obvious ones: openssl, openss-devel, openssl-libs, openssl-static[just in case...], pyOpenSSL, boost, curl, libcurl, libcurl-devel.

I configured it for testing with:
./configure --with-xerces=/home/gtuser/local/ --with-xqilla=/home/gtuser/test_soft/XQilla-2.3.1/ --prefix=/home/gtuser/local/
--enable-logging=verbose --with-examples=yes

The testing on a virtual machine takes long time, but so far seems that the test are running OK.

```
