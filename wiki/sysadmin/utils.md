## lsblk        

```
# block devices
lsblk
NAME                      MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sda                         8:0    0   64G  0 disk 
├─sda1                      8:1    0  243M  0 part /boot
├─sda2                      8:2    0    1K  0 part 
└─sda5                      8:5    0 63.8G  0 part 
  ├─debian--10--vg-root   254:0    0 62.8G  0 lvm  /
  └─debian--10--vg-swap_1 254:1    0    1G  0 lvm  [SWAP]
sdb                         8:16   0    1G  0 disk 
sdc                         8:32   0    1G  0 disk 
sdd                         8:48   0    1G  0 disk 
sde                         8:64   0    1G  0 disk 

```
## lscpu        
```
cpu info. Differs between CPU in VM, i.e. Vagrant and bare metal

```
## lsipc        
```
# inter process communication facilities available

RESOURCE DESCRIPTION                                              LIMIT  USED  USE%
MSGMNI   Number of message queues                                 32000     0 0,00%
MSGMAX   Max size of message (bytes)                               8192     -     -
MSGMNB   Default max size of queue (bytes)                        16384     -     -
SHMMNI   Shared memory segments                                    4096    15 0,37%
SHMALL   Shared memory pages                       18446744073692774399 20523 0,00%
SHMMAX   Max size of shared memory segment (bytes) 18446744073692774399     -     -
SHMMIN   Min size of shared memory segment (bytes)                    1     -     -
SEMMNI   Number of semaphore identifiers                          32000     1 0,00%
SEMMNS   Total number of semaphores                          1024000000     1 0,00%
SEMMSL   Max semaphores per semaphore set.                        32000     -     -
SEMOPM   Max number of operations per semop(2)                      500     -     -
SEMVMX   Semaphore max value                                      32767     -     -

```
## lslogins     
```
# lslogins - display information about known users in the system
# username (including demons), number of processes etc. 

```
## lsmod        
```
# display modules available in the kernel

```
## lsof  
```
# list open files

# open ports/connections
lsof -i 
see: https://www.howtoforge.com/linux-lsof-command/
```
      
 

## lsb_release  
```
somehow faulty relase version info(?)
```

## lsinitramfs  

```
lsinitramfs - list content of an initramfs image
```
## lslocks     
```
lslocks lists information about all the currently held file locks in a Linux system.
```

## lsmem        

```
# list memory ranges

lsmem
RANGE                                  SIZE  STATE REMOVABLE BLOCK
0x0000000000000000-0x0000000007ffffff  128M online        no     0
0x0000000008000000-0x000000000fffffff  128M online       yes     1
0x0000000010000000-0x0000000017ffffff  128M online        no     2
0x0000000018000000-0x000000002fffffff  384M online       yes   3-5
0x0000000030000000-0x000000003fffffff  256M online        no   6-7

Memory block size:       128M
Total online memory:       1G
Total offline memory:      0B

```
## lsns         

```
# lsns list namespaces

        NS TYPE   NPROCS   PID USER    COMMAND
4026531835 cgroup      3   578 vagrant /lib/systemd/systemd --user
4026531836 pid         3   578 vagrant /lib/systemd/systemd --user
4026531837 user        3   578 vagrant /lib/systemd/systemd --user
4026531838 uts         3   578 vagrant /lib/systemd/systemd --user
4026531839 ipc         3   578 vagrant /lib/systemd/systemd --user
4026531840 mnt         3   578 vagrant /lib/systemd/systemd --user
4026531992 net         3   578 vagrant /lib/systemd/systemd --user
```
## lspci  

```
# ls the PCI devices, ie

00:00.0 Host bridge: Intel Corporation 440FX - 82441FX PMC [Natoma] (rev 02)
00:01.0 ISA bridge: Intel Corporation 82371SB PIIX3 ISA [Natoma/Triton II]
00:01.1 IDE interface: Intel Corporation 82371AB/EB/MB PIIX4 IDE (rev 01)
00:02.0 VGA compatible controller: InnoTek Systemberatung GmbH VirtualBox Graphics Adapter
00:03.0 Ethernet controller: Intel Corporation 82540EM Gigabit Ethernet Controller (rev 02)
00:04.0 System peripheral: InnoTek Systemberatung GmbH VirtualBox Guest Service
00:07.0 Bridge: Intel Corporation 82371AB/EB/MB PIIX4 ACPI (rev 08)
00:0d.0 SATA controller: Intel Corporation 82801HM/HEM (ICH8M/ICH8M-E) SATA Controller [AHCI mode] (rev 02)

```
