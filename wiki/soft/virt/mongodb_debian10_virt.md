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
 1  cd /home/darked/
    2  cd Downloads/
    3  ls -ltr
    4  dpkg -i mongodb-org-server_4.2.1_amd64.deb 
    5  apt-get install libcurl4 
    6  dpkg -i mongodb-org-server_4.2.1_amd64.deb 
    7  service mongodb start 
    8  df


   18  apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 4B7C549A058F8B6B
   19  echo "deb http://repo.mongodb.org/apt/debian "$(lsb_release -sc)"/mongodb-org/4.2 main" | sudo tee /etc/apt/sources.list.d/mongodb.list
   20  apt-update
   21  apt update
   22  apt install mongodb-org
   23  dpkg --get-selections | grep mongo
   24  apt purge mongo-tools 
   25  apt install mongodb-org
   26  apt --fix-broken install 
   27  apt remove mongo-tools 
   28  apt --fix-broken install 
   29  apt remove mongo-tools 
   30  apt --help
   31  apt remove --help
   32  man apt 
   33  man apt-get
   34  dpkg --remove mongo-tools 
   35  apt --fix-broken install 
   36  systemctl start mongod.service
   37  mongod --version
   38  history 

   16  systemctl enable mongod.service 
   17  reboot now
```

