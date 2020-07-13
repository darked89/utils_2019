# cgroups


## Info
Cgroups is a system to allocate cpu, RAM, network bandwidth, etc. to tasks run by users. One can limit resources avalable to a given user. On the high end of the capabilities there is freezing: 
stop and freeze a process/group of processes and thaw/restore it to a running state.

The system exist under:
```
/sys/fs/cgroup/
```


## debian packages

```
cgroup-tools
libpam-cgroup
```

## centos / RedHat

```
yum install libcgroup
yum install libcgroup-tools
```

## basic usage

* lssubsys (info about cgroups system)

```
# Display information about hierarchies
lssubsys -i

# Display mount points

lssubsys -m

```

* cgcreate (create new cgroup(s) )

* cgdelete (delete cgroup(s) )

* cgclear (unload the cgroups system)



## extra info

https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/6/html/resource_management_guide/ch01


