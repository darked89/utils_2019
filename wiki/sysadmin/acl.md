# Access Control Lists

## Info
Default on the RedHat/Centos systems with Selinux.
One can check if the given partition has ACL:

```
sudo tune2fs -l /dev/sda1 | grep 'Default mount options'

#Default mount options:    user_xattr acl
```
Also:

```
ls -l 
# note the dot after the permissions:
-rw-rw-r--. 1 vagrant vagrant    0 Jul 13 12:30 foobar
```

## Commands:

setfacl
getfacl


## More info

see: https://linuxconfig.org/how-to-manage-acls-on-linux
