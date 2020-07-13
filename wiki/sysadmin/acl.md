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
# note the dot after the permissions (acl available but empty):
-rw-rw-r--. 1 vagrant vagrant    0 Jul 13 12:30 foobar.01 

# plus sign means that acl are set for that file
-rw-rw-r--+ 1 vagrant vagrant    0 Jul 13 12:30 foobar.02
```

## Commands:

* setfacl & getfacl

```
# add rw access for someuser (someuser must exist)
setfacl -m u:someuser:rw foobar

getfacl foobar

# file: foobar
# owner: vagrant
# group: vagrant
user::rw-
user:ldap:rw-
group::rw-
mask::rw-
other::r--
```

## More info

see: https://linuxconfig.org/how-to-manage-acls-on-linux
