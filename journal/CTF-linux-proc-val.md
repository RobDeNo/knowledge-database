```shell
------------------------------------------
#finding the parent process ID of the user logged in shell
ps -elf --forest
    #this will show the parent pcoress binaries that ran a program
-------------------------------------------
#Find the arugments given to the ntpd Daemon
ps -elf --forest | grep ntpd
    #this diaplsy the below
    5 S ntp       1435     1  0  80   0 - 23949 -      May04 ?        00:00:47 /usr/sbin/ntpd -p /var/run/ntpd.pid -g -u 105:109
    0 S bombadil  4436  3956  0  80   0 -  3179 -      14:49 pts/0    00:00:00              \_ grep ntpd
    #looking at the end of the ntpd you can see the given argument (-p /var/run/ntpd.pid -g -u 105:109)
-------------------------------------------
#Identify the file mapped to the fourth file descriptor (handle) of the cron process.
##Look for FILE DESCRIPTORS
lsof | grep ping
sudo lsof | Less
sudo lsof | grep cron
    /cron #this will search for the cron string. Then looking for the descriptor column
    OUTPUT cron       1327            root    3u      REG               0,19        5      11513 /run/crond.pid
-------------------------------------------
#Identify the permissions that cron has on the file identified in Processes 5.
sudo lsof | Less
    /cron #this will search for the cron string. Then looking for the descriptor column. answer is 3u
    OUTPUT cron       1327            root    3u      REG               0,19        5      11513 /run/crond.pid
-------------------------------------------
Identify the names of the orphan processes on the SysV system.
NOTE: Remember, orphan processes spawn and die periodically. Try monitoring the processes list with top or htop to find them.
Flag format: in alphabetical order with all non-alphabetic characters removed: Name,Name,Name,Name
HINT: Only character names!
htop #monitored the proocesses to see.
# /home/orphan aragorn,brucewayne,eowyn,tolkien
-------------------------------------------
Locate zombie processes on the SysV system.
Identify the zombie processes' parent process.
NOTE: Remember, zombie processes only live until the parent process kills and removes them from the system’s process table. Try monitoring the processes list with top or htop to find them.
Flag format: /absolute/path
```shell
htop #look for process spawning zombie processes
```
-------------------------------------------
```shell
Locate the strange open port on the SysV system.
Identify the command line executable and its arguments.
Flag format: /executable/path -arguments
htop #used find the netsta command running and listed the port
-------------------------------------------
Examine the process list to find the ssh process. Then, identify the symbolic link to the absolute path for its executable in the /proc directory.
The flag is the absolute path to the symbolic link, and the file it is linked to.
Flag format: /absolute/path,/absolute/path
ps -elf | grep ssh
ps -ls /proc/1750
find /usr/bin -type l -ls | grep ssh
sudo find /proc/1750 -type l -ls | grep ssh #This will look in the proc folder for links grepping sshd
ps -elf | grep 1750
---------------------------------------------
Identify the file that contains udp connection information. Identify the process using port 123.
For the flag, enter:
    Process name
    File descriptor number for the udp socket
    Its permissions as shown in lsof
Flag format: name,#,permission
nestat -lno #find port
sudo lsof -i :123 #this will show command that found it
sudo lsof | grep 1435
    OUTPUT ntpd       1435 1457        ntp   19u     IPv4              11584      0t0        UDP 10.10.0.7:ntp
    #This is how you would see secuirty descriptor and permissions, the PROCESS NAME = ntpd FILE = 19, PERM = u
---------------------------------------------  
Locate the strange open port on the SysV system.
Identify how the process persists between reboots.
The flag is the absolute path for the file that contains the persistence mechanism, and the configuration option.
HINT: Persistence is defined here
Flag format: filepath,configuration_option
#find the inittab folder
ls -l /etc/inittab
cat /etc/inittab #view the initab file for persistance
output line;
            90:2345:respawn:/sauron
            91:2345:respawn:/bin/netcat -lp 9999
 ANSWER===  /etc/inittab,91:2345:respawn:/bin/netcat -lp 9999

####################
---------------------------------------------
Scenario: The Villains group has been chanting offerings to their new leader at regular intervals over a TCP connection.
Task: Identify their method of communication and how it is occurring. Locate the following artifacts: ** The chant/text used by each villain (include spaces) ** The new Lord receiving the offering ** The IP address and port that the offering is received over
Flag format: chant text,new Lord,IP:port
Machine: Minas_Tirith
htop
    f5 #open htop and find the chants string showing it
    cd into the home/witch_king
    ls -l /home/witch_king #cd into the directory
    cat chant #view the chant for each and the ip its going to "offering"
 ANSWER====Mausan ukoul for avhe mubullat goth,witch_king,127.0.0.1:1234
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



