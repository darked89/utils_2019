# to transfer data from biobank.edu.pl using ssh and port 1212:

```
rsync -avsh -e "ssh -p 1212" darked89@mars.venus.tu:/mnt/vdb1/home/pawols/genotyping_xyz/QI-1576_Nexus_male/QI-1576_190916_Nexus_male/ ./ 
```


For more info, see also:
```
https://www.tecmint.com/rsync-local-remote-file-synchronization-commands/

https://mike-hostetler.com/rsync-non-standard-ssh-port/

```
