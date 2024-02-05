edit the /etc/ssh/sshd_config
### network File System ##############################
Network File System (NFS) is a network protocol that allows us to store and manage files on remote systems as if they were stored on the local system
# to install
sudo apt install nfs-kernel-server -y
# NFS can be ocnfgured vvia the /etc/exports/
rw	Gives users and systems read and write permissions to the shared directory.
ro	Gives users and systems read-only access to the shared directory.
no_root_squash	Prevents the root user on the client from being restricted to the rights of a normal user.
root_squash	Restricts the rights of the root user on the client to the rights of a normal user.
sync	Synchronizes the transfer of data to ensure that changes are only transferred after they have been saved on the file system.
async	Transfers data asynchronously, which makes the transfer faster, but may cause inconsistencies in the file system if changes have not been fully committed.
## createing an NFS
cry0l1t3@htb:~$ mkdir nfs_sharing
cry0l1t3@htb:~$ echo '/home/htb-ac-956853/nfs_sharing hostname(rw,sync,no_root_squash)' >> /etc/exports
cry0l1t3@htb:~$ cat /etc/exports | grep -v "#" # this will print out the line
## now mount the NFS share drive
cry0l1t3@htb:~$ mkdir ~/target_nfs
cry0l1t3@htb:~$ mount 10.129.12.17:/home/john/dev_scripts ~/target_nfs
cry0l1t3@htb:~$ tree ~/target_nfs
So we have mounted the NFS share (dev_scripts) from our target (10.129.12.17) locally to our system in the mount point target_nfs over the network and can view the contents just as if we were on the target system.

#### APACHE WEB SERVER#########
sudo apt install apache2 -y
#within the apache global file you can edit the folders to access /etc/apache2/apache2.conf
