# to transfer data from biobank.edu.pl using ssh and port 1212:

```
rsync -avsh -e "ssh -p 1212" darked89@biobank.edu.pl:/mnt/vdb1/home/pawols/genotyping_uppsala/QI-1576_Nexus_male/QI-1576_190916_Nexus_male/ ./ 
```


For more info, see also:
```
https://www.tecmint.com/rsync-local-remote-file-synchronization-commands/

https://mike-hostetler.com/rsync-non-standard-ssh-port/

```