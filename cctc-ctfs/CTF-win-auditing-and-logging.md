## What Sysinternals tool will allow you to read the SQLite3 database containing the web history of chrome?
Strings - Search for ANSI and UNICODE strings in binaryimages.
-------------------------------------------
## What is the registry location of recent docs for the current user?
View SG 7.1 Locations
HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs
-------------------------------------------
## BAM settings are stored in different registry locations based on the version of Windows 10. What version of Windows 10 is workstation2 running? The answer is the 4 digit Windows 10 release (version) number.
```Powershell
Get-ComputerInfo | select-object osname,osversion,oshardwareabstractionlayer # This will pull the verison information
OsName                          OsVersion  OsHardwareAbstractionLayer
------                          ---------  --------------------------
Microsoft Windows 10 Enterprise 10.0.17134 10.0.17134.471 
#References version chart
#version is 1803
```
-------------------------------------------
## Figure out the last access time of the hosts file. Flag format: mm/dd/yyyy
```powershell
Get-ChildItem -Recurse C:\Windows\System32\Drivers\etc\hosts -ErrorAction SilentlyContinue | Select-Object Fullename, LastAccessTime
# Run the command that will get the child item of the hosts file then using select object to pull out the Fullname and the last accesstime
Fullename LastAccessTime
--------- --------------
          5/16/2023 3:34:13 PM
```
-------------------------------------------
## What is the literal path of the prefetch directory?
```powershell
C:\Windows\Prefetch
#look through SG 
```
-------------------------------------------
## In the Recycle Bin, there is a file that contains the actual contents of the recycled file. What are the first two characters of this filename?
```powershell
$R 
#the above hold the actual data of the files
```
-------------------------------------------
## In the Recycle Bin, there is a file that contains the original filename, path, file size, and when the file was deleted. What are the first two characters of this filename?
```powershell
$I
#The above hold the metadata for the file
```
-------------------------------------------
## What are the first 8 characters of the Globally Unique Identifier (GUID) used to list applications found in the UserAssist registry key (Windows 7 and later)?
```powershell
#CEBFF5CD: Executable File Execution
Get-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\UserAssist\{CEBFF5CD-ACE2-4F4F-9178-9926F41749EA}\Count"
#The first 8 didgits of this GUID are folow applications wihthing the userassist
```
-------------------------------------------
## What cipher method are UserAssist files encoded in?
```powershell
ROT13
#see user guide
```
-------------------------------------------
## What main Windows log would show invalid login attempts?
```powershell
security
```
-------------------------------------------
## What main Windows log will show whether Windows updates were applied recently?
```powershell
system
```
-------------------------------------------
## When reading logs, you may notice ... at the end of the line where the message is truncated. What format-table switch/argument will display the entire output? Flag format: -argument

```powershell
-wrap
```
-------------------------------------------
## Find the questionable website that a user browsed to (using Chrome), that appears to be malicious. *Note: There are more than one users on the box. Machine: Workstation2 (ssh from Admin_Station)

```powershell
Net user #list out users to see what users are there
dir C:\Users\ #this will see which users have Profiles
strings.exe 'C:\users\andy.dwyer\AppData\Local\Google\Chrome\User Data\Default\History' -accepteula
strings.exe 'C:\users\Public\AppData\Local\Google\Chrome\User Data\Default\History' -accepteula
strings.exe 'C:\users\student\AppData\Local\Google\Chrome\User Data\Default\History' -accepteula
    https://www.exploit-db.com/
#use strings to look for browser history in each profile till its found

```
-------------------------------------------
## There is a file that was recently opened that may contain PII. Get the flag from the contents of the file. Hint: We're not interested in numbers.

```powershell
Get-Childitem -Recurse C:\Users\andy.dwyer\AppData\Roaming\Microsoft\Windows\Recent -ErrorAction SilentlyContinue | select FullName, LastAccessTime |ft -wrap
C:\Users\andy.dwyer\AppData\Roaming\Microsoft\Windows\Recent\AutomaticDestinations
C:\Users\andy.dwyer\AppData\Roaming\Microsoft\Windows\Recent\CustomDestinations
C:\Users\andy.dwyer\AppData\Roaming\Microsoft\Windows\Recent\artif.lnk
C:\Users\andy.dwyer\AppData\Roaming\Microsoft\Windows\Recent\artifacts.lnk
Get-Content C:\Users\andy.dwyer\AppData\Roaming\Microsoft\Windows\Recent\artifacts.lnk
find C:\Suers\student\Documents\3-14-24.txt # this is where the informaiton is
```
artifacts.ps1
-------------------------------------------
# Windows_Bam_210
## Enter the full path of the program that was run on this computer from an abnormal location.
```powershell
Get-Item HKLM:\SYSTEM\CurrentControlSet\Services\bam\UserSettings\* #use this to view SIDS
Get-Item HKLM:\SYSTEM\CurrentControlSet\Services\bam\UserSettings\*
C:\Windows\Temp\bad_intentions.exe # this is a file opened by the user
wmic useraccount  get caption,sid | more # get the association of the SIDS to users
WORKSTATION2\andy.dwyer          S-1-5-21-2881336348-3190591231-4063445930-1004
Get-Itemproperty HKLM:\SYSTEM\CurrentControlSet\Services\bam\UserSettings\S-1-5-21-2881336348-3190591231-4063445930-1004
```
-------------------------------------------
# Enter the name of the questionable file in the prefetch folder.
```powershell
Get-Childitem -Path 'C:\Windows\Prefetch' -ErrorAction Continue | select -First 50 #use this command to view the first first pretch files
BAD_INTENTIONS.EXE-8F2806FC.pf
```
-------------------------------------------
# What is the creation time of the questionable file in the prefetch folder?
Flag format: mm/dd/yyyy
## 
```powershell
Get-Childitem -Path 'C:\Windows\Prefetch' -ErrorAction Continue | select -First 50 #This will get all the prefech files to find the suspect ones
Get-Childitem -Path 'C:\Windows\Prefetch' -ErrorAction Continue | select-object FullName, CreationTime
```
-------------------------------------------
# Windows_Jump_Lists10
## Find the file in the jump list location that might allow privilege escalation.
```powershell
Get-Content C:\Users\Administrator\AppData\Roaming\Microsoft\Windows\Recent\artifacts.lnk
Get-Content C:\Users\Administrator\AppData\Roaming\Microsoft\Windows\Recent\System32.lnk
Output
:\Users\Administrator\AppData\Roaming\Microsoft\Windows\Recent\AutomaticDestinations
C:\Users\student\AppData\Roaming\Microsoft\Windows\Recent\AutomaticDestinations\5f7b5f1e01b81337.automaticDestinations-ms
    Get-Content C:\Users\student\AppData\Roaming\Microsoft\Windows\Recent\AutomaticDestinations\5f7b5f1e01b81337.automaticDestinations-ms
```
-------------------------------------------
# Windows_Logs_4
## Check event logs for a flag string.
Machine: file-server

```powershell
Get-Eventlog -LogName Security | ft -wrap | findstr /i "flag"
Get-Eventlog -LogName System | ft -wrap | findstr /i "flag"
Get-WinEvent Microsoft-Windows-PowerShell/Operational |Where-Object {$_.Message -ilike "*flag*"} | Format-List
.......................the flag is: the Flag
```
-------------------------------------------
# Windows_Recycle_Bin_310
## Recover the flag from the Recycle Bin. Enter the name of the recycle bin file that contained the contents of the flag, and the contents of the deleted file. Flag format: filename,contents
```powershell
Get-Content 'C:\$RECYCLE.BIN\S-1-5-21-2881336348-3190591231-4063445930-1003\$R*' #this will get the content for all files in the recyling bin
Get-content 'C:\Users\vanhe\Documents\file.txt

$R1WANPJ.txt,DontTrashMeyo
```
-------------------------------------------
# Windows_Logs_415
## Check event logs for a flag string.

