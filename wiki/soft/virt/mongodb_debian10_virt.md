# Mongodb installation inside the Debian 10.2 virtual machine


## VirtualBox on Linux Manjaro 

* install using GUI package manager
    * Oracle VM VirtualBox (virtualbox)  6.0.14-1  
    * virtualbox-guest-iso  6.0.14-1
    * virtualbox-host-dkms  6.0.14-1
    
## debian iso 

```
debian-10.2.0-amd64-netinst.iso from:

https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-10.2.0-amd64-netinst.iso
```

## installing VBox Guest Linux Additions 


*  insert Guest Additions into virtual CD drive (running Debian VM -> Devices)  


* install GA  

```
# based on:
# https://www.linuxbabe.com/desktop-linux/how-to-install-virtualbox-guest-additions-on-debian-step-by-step 

# log as root

apt-get update
apt-get upgrade
apt-get install build-essential module-assistant
# prepare for building kernel modules
m-a prepare

cd /media/cdrom0/
sh VBoxLinuxAdditions.run 
```

## mongodb install

```
# as root

apt-get install libcurl4
#caveat: do not install mongo-tools using apt-get


apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 4B7C549A058F8B6B
echo "deb http://repo.mongodb.org/apt/debian "$(lsb_release -sc)"/mongodb-org/4.2 main" | sudo tee /etc/apt/sources.list.d/mongodb.list

apt update
apt install mongodb-org
# check
dpkg --get-selections | grep mongo

# start mongodb
systemctl enable mongod.service 
systemctl start mongod.service

# check that it is running
mongod --version

# optional
reboot now
```

