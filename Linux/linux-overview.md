# File Systems
1. Ext4 
2. Contains an INODE table full of slots these store meta data about a file
   1. Literally just a chart located in `etc/shadow`, owned by this, owned by this group
# File Structure
```Shell
/boot    #Boot Loader Files
/etc     #Configuration File
/home    #User Home Directories
/opt     #Third Party Application
/dev     #Device Files
/var     #Variable Files
/bin     #User Binaries
/sbin    #System Binaries
/usr     #System Binaries
/proc    #Process Information
/mnt     #Mount DIrectory
/sys     #Virtual File System
/media   #Removeable Devices
/run     #Temporary File Systems
/tmp     #Temporary Files
/lost+found #Recover broken Files
/lib     #System Libraries
/srv     #Service Data Directory

```
# Run Levels
0 – System halt i.e the system can be safely powered off with no activity.
1 – Single user mode.
2 – Multiple user mode with no NFS(network file system).
3 – Multiple user mode under the command line interface and not under the graphical user interface.
4 – User-definable.
5 – Multiple user mode under GUI (graphical user interface) and this is the standard runlevel for most of the LINUX based systems.
6 – Reboot which is used to restart the system.

    


