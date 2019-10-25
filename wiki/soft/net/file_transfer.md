## Filezilla 

GUI program to transfer files using sftp protocol from/to Linux servers. Windows/Mac clients.

| Property | value |
| ------ | ------ |
| prog_name | Filezilla Client |
| first_release_year | 2001|
| www  | https://filezilla-project.org/ |
| wikipedia | https://en.wikipedia.org/wiki/FileZilla |
| lang | C++ |
| obtained_from | https://filezilla-project.org/download.php?platform=win64  |
| version | 3.42.1|
| version_date |  2019-05-08 |
| last_ver_check | 2019.06.24 |

# legacy BAM and other file format transfer from CGHub

```
You can compile GeneTorrent ver 3.8.7 on Centos 7. I have used installed from source xerces-c-3.1.2 plus XQilla-2.3.1. Apart from this redhat-lsb-core package. The obvious ones: openssl, openss-devel, openssl-libs, openssl-static[just in case...], pyOpenSSL, boost, curl, libcurl, libcurl-devel.

I configured it for testing with:
./configure --with-xerces=/home/gtuser/local/ --with-xqilla=/home/gtuser/test_soft/XQilla-2.3.1/ --prefix=/home/gtuser/local/
--enable-logging=verbose --with-examples=yes

The testing on a virtual machine takes long time, but so far seems that the test are running OK.

```
