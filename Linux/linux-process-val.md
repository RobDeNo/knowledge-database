# Parent Processes
- (0)Kernal spawn
- (1)Root
- Each Child Proces has a handle to its ParentProcessID
- Every processor has time
- Process gets access to handle in a context of levels
- Always inherits attributes from parent then context is changed
- -Linux processes use handles to access
## Linux Ring Levels
1. RING -1 (Meltdown)
2. RING 0 kernel
3. RING 1 Device Drivers\
4. RING 2 Device Drivers
5. RING 3 USER MODE
# Process listening
```Shell
#Forking creates new PID
./bin/sh
##once a new child is created it will take all the processtable from orignal and change the pointers

# command uses the same PID
exec /bin/sh

#Listing processes that have bash in the name
ps -elf | grep bash
ps -elf ---forest #this shows more
pstree -p #shows process tree broken down by spawn
pstree -p | grep 'firefox' #show process o f
-p /var/run/ntpd.pid -g -u 105:109
echo $$
#Listing all processes id, this is the process table
ls /proc
ls /proc/20210
ls /proc/20210/cmdline
#info in stat file is used to display the ps -elf to screen
ls /proc/20210/stat
#Top - all processes used by process
Top
#Htop - relationship tree of processes and who spawn them
Htop    f5 , f6, #cpu #memory
f3 to search
f2 for setup
f10 for doesnt
f5 for add (f7 moves up, f10 for doesn) #ham, preferences, uncheck accelerator
CTRL+S will pause the ouput (see clock)
CTRL+Q to start it again
f9 , then ENTER to kill
#getting UserIDs for system and human users
grep UID /etc/login.defs 
 	grep for UID from the shadow password suite configuration file login.defs
	minimum userid assigned to a regular user
	maximum userid assigned to a regular user
	minimum userid assigned to a system user
	maximum userid assigned to a system use
```
# Types of common system calls
Table 1. Common System Calls 	
https://os.cybbh.io/public/os/latest/010_linux_ess_validity/linproc_fg.html#_4_process_ownership_effective_user_id_euid_real_user_id_ruid_user_id_uid
# Types of Signal Calls
https://os.cybbh.io/public/os/latest/010_linux_process_validity/linproc_fg.html#_4_process_ownership_effective_user_id_euid_real_user_id_ruid_user_id_uid
# Foreground & backgrounds
```shell
#Background processes pause execution and are waiting
#Orphan -parent process has finished or terminated and is adopted by sbin/init and will have a PPID of 1.
disown -a && exit #Close a shell/terminal and force all children to be adopted
ps -elf | head -1; ps -elf | awk '{if ($5 == 1) {print $0}}'
##look at orphan and look for its working directory

#Zombie
```
# Daemon 
# process is an intentionally orphaned process in order to have a background process.

# Systemctl
#enable=run on boot
```shell
systemctl status ssh
systemctl restart ssh
systemctl disable ssh
systemctl enable
systemctl list-units #List all unit files that systemd has listed as active
systemctl list-units --all #List all units that systemd has loaded or attempted to load into memory, ALL
```
# Jobs - view jobs running in the background
```shell
CTRL+Z to background jobs
fg $1
jobs
kill %1
```-------------------------------------------
# cron job(contab)
```shell
#System crontab /etc/crontab
#User crontab /var/spool/cron/crontab
min h dom mon dow command
15 11 * * * wall "go to lunch"
30 08 10 06 * cat /helloworld.sh
crontab -l #view crontab
```
# Window Panes
Ctrl + b + % to split the current pane vertically.
Ctrl + b + " to split the current pane horizontally.
Ctrl + b + x to close the current pane.

# List all open files
sudo lsof | tail -30
lsof | grep ping | Less
lsof | grep ping > that.txt
lsof 

# Linux netstat
netstat -anop

https://pberba.github.io/assets/posts/common/20220201-linux-persistence.png











