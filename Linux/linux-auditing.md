# Linux Logging Daemons/Types
```Shell
rsyslog #located on a sysV

#sysV log types - bombadil
#config file
/etc/rsyslog.conf
#service
/usr/sbin/rsyslogd
#Information
cat /etc/rsyslog.d/50-default.conf
less /var/log/syslog
cat /etc/logrotate.conf #This log will show how often to log/cut
#Authentication Log
/var/log/auth.log # Authentication related events
/var/run/tmp #Users currently logged in MUST USE "LAST" command
/var/log/wtmp # Histroy for utmp MUST USE LAST
#Application
/var/log/mysql.log # any locg having to do with programs
#System logs
/var/log/messages # Legacy catch all messages
/var/log/syslog #Ubuntu/Debian Catch all
/dmesg #device messenger that quieries /proc/kmsg 1. Kernel Ring buffer 2. First system logs
```
------------------------------
# Combing rsyslog
## Global Directives
```Shell
#
# Use traditional timestamp format.
# To enable high precision timestamps, comment out the following line.
#
$ActionFileDefaultTemplate RSYSLOG_TraditionalFileFormat

# Filter duplicated messages
$RepeatedMsgReduction on

#
# Set the default permissions for all log files.
#
$FileOwner syslog
$FileGroup adm
$FileCreateMode 0640
$DirCreateMode 0755
$Umask 0022 
$PrivDropToUser syslog
$PrivDropToGroup syslog

#
# Where to place spool and state files
#
$WorkDirectory /var/spool/rsyslog

#
# Include all config files in /etc/rsyslog.d/
#
$IncludeConfig /etc/rsyslog.d/*.conf #change this file to add configurations ontop of your default
```
## Rules
```shell
cat /etc/rsyslog.d/50-default.conf 
# First some standard log files.  Log by facility.
#
#Selectors                      #Action                 Code    Emergency        Severity
#Facility, .Severity            #/path/to/log/location  #0 -    Emergency        Kernel Messages
#                                                       #1 -    Alert            user-level messages
auth,authpriv.*                 /var/log/auth.log       #2 -    Critical         mail system
*.*;auth,authpriv.none          -/var/log/syslog        #3 -    Error            system daemons
#cron.*                         /var/log/cron.log       #4 -    Warning          secuirty/authorization messages
#daemon.*                       -/var/log/daemon.log    #5 -    Notice           messages made by syslogd
kern.*                          -/var/log/kern.log      #6 -    Informational    line printer subsystem
#lpr.*                          -/var/log/lpr.log       #7 -    Debug            network news subsystem
mail.*                          -/var/log/mail.log      #8      UUCP
#user.*                         -/findvar/log/user.log      #9      clock           
#                                                       #10     security/authorization 
# Logging for the mail system.  Split it up so that     #11     FTP
# it is easy to write scripts to parse these files.     #12     ntp
#                                                       #13     log Auditing
#mail.info                      -/var/log/mail.info     #14     log alert
#mail.warn                      -/var/log/mail.warn     #15     clock daemon
mail.err                        /var/log/mail.err       #16     local use 0
```                                                     #17     local use 1 #18 local use 
                        https://success.trendmicro.com/dcx/s/solution/TP000086250?language=en_US
------------------------------
# Filtering Syslog Files
journald #located on a systemd
evetrying about systemd, aliases, directory, init6 etc. support obselete system Administrators-replicates all system logs into logs you can cat
journal d wraps around syslog
rsyslog still running under journald
systemd uses journald
systemv uses rsyslog
```Shell
journalctl
journalctl -e #shows last logs it recieved
journalctl --list-boots
journalctl -b "specify boot"
#the graphical.targt is a systemd unit
journal -u graphical.target
journal -u ssh.service
journalctl -u ssh.service --since "2 days ago" #shows only logs since 2 days ago
#goes to /var/logon
file /var/log/*
```
------------------------------
# Log Formats
```Shell
# syslog messages can use grep, findstr, ctrl-f
grep
#Markdup Languages
xml
json
```
------------------------------
#
```Shell

```
------------------------------
#
```Shell

```
------------------------------
#
```Shell

```
------------------------------
#
```Shell

```
------------------------------
# command will read binary file
last -f /var/log/tmp


find / -exec grep -s -i -B 10 -A 10 "SpecialString" {}\
find / -type f -exec grep -H 'text-to-find-here' {} \;
find / -type f -exec grep -H 'windows/x64/meterpreter/reverse_tcp' {} \;


clear logs
cat /dev/null > /var/log/*.log 
history -c

#password brute force over SSH
