# Determine Boot Partion of a drive/target
```powershell
bcdedit 
bcdedit /set 
bcdedit /deletevalue {current} safeboot

#more information
tasklist /v 
#Display information for each process
tasklist /svc
#Display modules/DLLS ass. w each process
tasklist /m | more
#This will show the image name for a process
tasklist /m /fi "IMAGENAME eq chrome.exe"
#formating options
tasklist /fo:{table|list|csv}
tasklist /fo:csv
```
# Viewing Service 
```powershell
#show current running services
net start 
#MS Reference
#view your services
sc query
#view extneded information for all services
sc queryex type=service
#view extned for all not running services
sc queryex type=service state=inactive
sc queryex type=service state=all
sc /? #basic service enumeration
sc qc #configuration information for a service
sc qdescription #query eventlog service Description
sc enumdepend #query service that cannot run wih oout specific service running
 sc <server> [command] [service name] <option1> <option2>...

```
# schtasks
```cli
schtasks /query /tn /"IchBinBosh" /v /fo list
schtasks /create /tn "IchBinBosh" /tr "C:\Users\Andy.dwyer\Downloads\IchBinBash.exe" /sc "HOURLY" /st 10:30
schtasks 

```
#reg query HKLM\System\CurrentControlSet\Control\lsa\Kerberos
# Registry location for DLLs
- Parameters
