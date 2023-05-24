# how to find code in a binary
Strings - Search for ANSI and UNICODE strings in binaryimages.
-------------------------------------------
# find recent docs of current userr?
View SG 7.1 Locations
HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs
-------------------------------------------
# Find BAM location based on windows version
```Powershell
Get-ComputerInfo | select-object osname,osversion,oshardwareabstractionlayer # This will pull the verison information
OsName                          OsVersion  OsHardwareAbstractionLayer
------                          ---------  --------------------------
Microsoft Windows 10 Enterprise 10.0.17134 10.0.17134.471 
#References version chart
#version is 1803
```
-------------------------------------------
# Last Access time of files
```powershell
Get-ChildItem -Recurse C:\Windows\System32\Drivers\etc\hosts -ErrorAction SilentlyContinue | Select-Object Fullename, LastAccessTime
# Run the command that will get the child item of the hosts file then using select object to pull out the Fullname and the last accesstime
Fullename LastAccessTime
--------- --------------
          5/16/2023 3:34:13 PM
```
-------------------------------------------
# prefetch directory?
```powershell
C:\Windows\Prefetch
#look through SG 
```
-------------------------------------------
# actual contents of the recycled file. 
```powershell
$R 
#the above hold the actual data of the files
```
-------------------------------------------
# in recycle bin original filename, path, file size, and when the file was deleted.
```powershell
$I
#The above hold the metadata for the file
```
-------------------------------------------
#  first 8 characters of the Globally Unique Identifier (GUID) used to list applications found in the UserAssist registry key 
```powershell
#CEBFF5CD: Executable File Execution
Get-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\UserAssist\{CEBFF5CD-ACE2-4F4F-9178-9926F41749EA}\Count"
#The first 8 didgits of this GUID are folow applications wihthing the userassist
```
-------------------------------------------
# cipher method of UserAssist files
```powershell
ROT13
#see user guide
```
-------------------------------------------
#  Windows log would shows invalid login attempts
```powershell
security
```
-------------------------------------------
#  Windows updates were applied log 
```powershell
system
```
-------------------------------------------
# put at end of logs to see all

```powershell
-wrap
```
-------------------------------------------
# how to view suspicious browser history

```powershell
Net user #list out users to see what users are there
dir C:\Users\ #this will see which users have Profiles
strings.exe 'C:\users\andy.dwyer\AppData\Local\Google\Chrome\User Data\Default\History' -accepteula
strings.exe 'C:\users\Public\AppData\Local\Google\Chrome\User Data\Default\History' -accepteula
strings.exe 'C:\users\student\AppData\Local\Google\Chrome\User Data\Default\History' -accepteula
    https://badurl/
#use strings to look for browser history in each profile till its found

```
-------------------------------------------
# check for last recently opened files

```powershell
Get-Childitem -Recurse C:\Users\andy.dwyer\AppData\Roaming\Microsoft\Windows\Recent -ErrorAction SilentlyContinue | select FullName, LastAccessTime |ft -wrap
C:\Users\andy.dwyer\AppData\Roaming\Microsoft\Windows\Recent\AutomaticDestinations
C:\Users\andy.dwyer\AppData\Roaming\Microsoft\Windows\Recent\CustomDestinations
C:\Users\andy.dwyer\AppData\Roaming\Microsoft\Windows\Recent\artif.lnk
C:\Users\andy.dwyer\AppData\Roaming\Microsoft\Windows\Recent\artifacts.lnk
Get-Content C:\Users\andy.dwyer\AppData\Roaming\Microsoft\Windows\Recent\artifacts.lnk
find C:\Suers\student\Documents\piifile.txt # this is where the informaiton is
```
artifacts.ps1
-------------------------------------------
# find application running from abnormal location 
```powershell
Get-Item HKLM:\SYSTEM\CurrentControlSet\Services\bam\UserSettings\* #use this to view SIDS
Get-Item HKLM:\SYSTEM\CurrentControlSet\Services\bam\UserSettings\* WIN 7
C:\Windows\Temp\badfile.exe # this is a file opened by the user
wmic useraccount  get caption,sid | more # get the association of the SIDS to users
WORKSTATION2\andy.dwyer          S-1-5-21-2881336348-3190591231-4063445930-1004
Get-Itemproperty HKLM:\SYSTEM\CurrentControlSet\Services\bam\UserSettings\S-1-5-21-2881336348-3190591231-4063445930-1004
```
-------------------------------------------
# Enter the name of the questionable file in the prefetch folder.
```powershell
Get-Childitem -Path 'C:\Windows\Prefetch' -ErrorAction Continue | select -First 50 #use this command to view the first first pretch files
badfile.EXE-8F2806FC.pf
```
-------------------------------------------
# show file creation time

## 
```powershell
Get-Childitem -Path 'C:\Windows\Prefetch' -ErrorAction Continue | select -First 50 #This will get all the prefech files to find the suspect ones
Get-Childitem -Path 'C:\Windows\Prefetch' -ErrorAction Continue | select-object FullName, CreationTime
```
-------------------------------------------
# find bad file in jump list
```powershell
Get-Content C:\Users\Administrator\AppData\Roaming\Microsoft\Windows\Recent\artifacts.lnk
Get-Content C:\Users\Administrator\AppData\Roaming\Microsoft\Windows\Recent\System32.lnk
Output
:\Users\Administrator\AppData\Roaming\Microsoft\Windows\Recent\AutomaticDestinations
C:\Users\student\AppData\Roaming\Microsoft\Windows\Recent\AutomaticDestinations\5f7b5f1e01b81337.automaticDestinations-ms
    Get-Content C:\Users\student\AppData\Roaming\Microsoft\Windows\Recent\AutomaticDestinations\5f7b5f1e01b81337.automaticDestinations-ms
```
-------------------------------------------
# check windows logs
```powershell
Get-Eventlog -LogName Security | ft -wrap | findstr /i "flag"
Get-Eventlog -LogName System | ft -wrap | findstr /i "flag"
Get-WinEvent Microsoft-Windows-PowerShell/Operational |Where-Object {$_.Message -ilike "*flag*"} | Format-List
.......................the flag is: the Flag
```
-------------------------------------------
# go through recycling bin stuff
```powershell
Get-Content 'C:\$RECYCLE.BIN\S-1-5-21-2881336348-3190591231-4063445930-1003\$R*' #this will get the content for all files in the recyling bin
Get-content 'C:\Users\vanhe\Documents\file.txt

$R1WANPJ.txt,DontTrashMeyo
```
-------------------------------------------
