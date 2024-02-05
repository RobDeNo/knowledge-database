ls -il
# fdisk main tool for disk management
sudo fdisk -l
### mounted file systems at boot
cat /etc/fstab
### listing mounted drives
mount
### mounting a ub drive
robby2992@htb[/htb]$ sudo mount /dev/sdb1 /mnt/usb
robby2992@htb[/htb]$ cd /mnt/usb && ls -l
## to unount use the uount command and the mount point
sudo umount /mnt/usb

## make sure no process are suing the filesystem you are tyring to mount/unmount
lsof | grep cry0l1t3
# unounting on system shutdown can be configured in the /etc/fstab file
# /etc/fstab contains information about all mounted filesystems
noauto # added will unount at shutdown
### EXAMPLE Fstab file
/dev/sda1 / ext4 defaults 0 0
/dev/sda2 /home ext4 defaults 0 0
/dev/sdb1 /mnt/usb ext4 rw,noauto,user 0 0
192.168.1.100:/nfs /mnt/nfs nfs defaults 0 0