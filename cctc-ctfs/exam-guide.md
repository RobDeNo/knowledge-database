# Win powershell
Get obecjts, sort things out
Windows remoting
Windows Poershell Profiles
# Windows registry
Powershell to query
Regedit
CLI 
Add HKU Drive
critical registry locations
# Alternate Data Streams
read/write data stream in CLI
read/write data stream in powershell
# Linux Essentials
how to use bash
how permissions work in Linux
sudo -l
# Windows Boot Process
Run keys
# Linux Boot Process
User Profiles
powershell Profiles
persistant places
# in process validity
1. processes
2. look at parent ID of process
3. keep looking at parent includes
4. netstat -ano, find PID for process, get ps list, get pid, process explorer, hover over. Get-ciminstance win32_process can help
5. Get the scheduled tasks
6. map your sys internals
7.  add accept Eula for system internals tool
# linux process validity
netstat -anop suspicious, htop to show the trees
ps -elf, show all Services or systemctl
- System crontab /etc/crontab
- User crontab /var/spool/cron/crontab
- lsof
# win auditing and Logging
3 applications
# linux Logging
journald
rsyslogd
USE Less and grep
/var/log
# AD
get-AD user, Search AD Account
# sysinternals
AUTORUNS, processes explorer, strings, handles, 