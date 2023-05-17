```Powershell
#Artifcats
Get-LocalUser | select Name,SID 
##Get User SIDS
PS C:\> Get-LocalUser | select Name,SID 
Name               SID
----               ---
Admin              S-1-5-21-1584283910-3275287195-1754958050-1000
Administrator      S-1-5-21-1584283910-3275287195-1754958050-500

Get-WmiObject win32_useraccount | select name,sid 
PS C:\> Get-WmiObject win32_useraccount | select name,sid 
name               sid
----               ---
Admin              S-1-5-21-1584283910-3275287195-1754958050-1000
Administrator      S-1-5-21-1584283910-3275287195-1754958050-500
wmic useraccount  get caption,sid | more 

#USERASSIST#####################
#Located in HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\UserAssist\{GUID}\Count\
#Runs GUIS based programs ran by the user
#CEBFF5CD: Executable File Execution
Get-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\UserAssist\{CEBFF5CD-ACE2-4F4F-9178-9926F41749EA}\Count"
 #F4E57C4B: Shortcut File Execution
Get-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\UserAssist\{F4E57C4B-2036-45F0-A9AB-443BCFE33D9F}\Count"
#Look at all Userassist artifacts
PS C:\> Get-ItemProperty "Registry::Hkey_Users\*\Software\Microsoft\Windows\CurrentVersion\Explorer\UserAssist\{CEBFF5CD-ACE2-4F4F-9178-9926F41749EA}\Count"
#look at SINGLE USERS bam 

#BAM###############
Controls activity of background applications
#Query the registry keys to see any differences in the workstations
#Every User on the System
Get-Item HKLM:\SYSTEM\CurrentControlSet\Services\bam\state\UserSettings\*
Get-Item HKLM:\SYSTEM\CurrentControlSet\Services\bam\UserSettings\*
#Single User on the System
Get-Item HKLM:\SYSTEM\CurrentControlSet\Services\bam\state\UserSettings\<SID>
#show in regedit
HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\bam\State\UserSettings #On 1809 and Newer
HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\bam\UserSettings #On 1803 and below
#Get system information
Get-ComputerInfo | select-object osname,osversion,oshardwareabstractionlayer
S C:\> Get-Itemproperty 'HKLM:\SYSTEM\CurrentControlSet\Services\bam\State\UserSettings\S-1-5-21-1584283910-3275287195-1754958050-1005'

#RECYCLEBIN
#Find the Contents of the Recycle Bin
Get-Childitem 'C:\$RECYCLE.BIN' -Recurse -Verbose -Force | select FullName
C:\$RECYCLE.BIN\S-1-5-21-950816436-4199619115-1663388479-500\desktop.ini
# $I metadata about where file was location $R actual data
PS C:\> Get-Content 'C:\$Recycle.Bin\S-1-5-21-1584283910-3275287195-1754958050-1005\$R8QZ1U8.txt' 
This is the file for Auditing
Get-Content 'C:\$RECYCLE.BIN\S-1-5-21-2881336348-3190591231-4063445930-1003\$RZVLP5M.txt'
Get-Content 'C:\$RECYCLE.BIN\S-1-5-21-2881336348-3190591231-4063445930-1003\$R*'



Gci C:\users\student\AppData\Roaming\Microsoft\Windows\Recent\AutomaticDestinations | % {z:\strings.exe -accepteula $_} >> c:\recentdocs.txt
#PREFETCH
- Files that are downloaded and save from locations you have visited
- Fill on hardrive until overwritten with new data
- viewing the prefetch data to create a timeline of what the user did
Get-Childitem -Path 'C:\Windows\Prefetch' -ErrorAction Continue | select -First 50
get-ItemProperty C:\Window\Prefetch\EXPLORER.EXE
wmic datafile where name="C:\\Windows\\Prefetch\WWAHOST.EXE-543242.pf"
   
#JUMP LISTS
#Programs/Items that were recently used
- First time of execution of application.
- Creation Time = First time item added to the AppID file.
- Last time of execution of application w/file open.
- Modification Time = Last time item added to the AppID file.
Get-Childitem -Recurse C:\Users\*\AppData\Roaming\Microsoft\Windows\Recent -ErrorAction silentlyContinue | select FullName, LastAccessTime | ft -wrap
Get-Childitem -Recurse C:\Users\andy.dwyer\AppData\Roaming\Microsoft\Windows\Recent -ErrorAction SilentlyContinue | select FullName, CreationTime |ft -wrap
Get-Childitem -Recurse C:\Users\andy.dwyer\AppData\Roaming\Microsoft\Windows\Recent -ErrorAction SilentlyContinue | select FullName, LastAccessTime |ft -wrap
Get-Childitem -Recurse $env:USERPROFILE\AppData\Roaming\Microsoft\Windows\Recent -ErrorAction SilentlyContinue | select FullName,LastAccessTime | ft -wrap
FullName 
#OR
Get-Childitem -Recurse $env:USERPROFILE\AppData\Roaming\Microsoft\Windows\Recent -ErrorAction SilentlyContinue | select FullName,LastAccessTime | ft -wrap

#RECENT FILES
- Tracks last 150 files or folders opened.
- Entry and modification time of this key will be the time and location the last file of a specific extension was opened.
Get-childItem 'Registry::\HKEY_USERS\*\Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.txt'
#queries the hex value stored in the key
Get-childItem 'Registry::\HKEY_USERS\*\Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.*'

#Converting a Single Value from Hex to Unicode
[System.Text.Encoding]::Unicode.GetString((gp "REGISTRY::HKEY_USERS\*\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.txt")."1")
#Convert All Files
Get-Item "REGISTRY::HKEY_USERS\*\Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.txt" | select -Expand property | ForEach-Object {
    [System.Text.Encoding]::Default.GetString((Get-ItemProperty -Path "REGISTRY::HKEY_USERS\*\Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\.txt" -Name $_).$_)
}

#BROWSER ARTIFACTS
# Frequency
strings.exe 'C:\users\andy.dwyer\AppData\Local\Google\Chrome\User Data\Default\History' -accepteula
strings.exe 'C:\users\Public\AppData\Local\Google\Chrome\User Data\Default\History' -accepteula
strings.exe 'C:\users\student\AppData\Local\Google\Chrome\User Data\Default\History' -accepteula


# Most Visited
strings.exe 'C:\users\andy.dwyer\AppData\Local\Google\Chrome\User Data\Default\Top Sites'

# User Names
strings.exe  'C:\users\andy.dwyer\AppData\Local\Google\Chrome\User Data\Default\Login Data'
strings.exe  'C:\users\andy.dwyer\AppData\Local\Google\Chrome\User Data\Default\Login Data' | findstr -i "https*"

#Find FQDNs in Sqlite Text files
$History = (Get-Content 'C:\users\andy.dwyer\AppData\Local\Google\Chrome\User Data\Default\History') -replace "[^a-zA-Z0-9\.\:\/]",""

$History | Select-String -Pattern "(https|http):\/\/[a-zA-Z_0-9]+\.\w+[\.]?\w+[\.]?\w+" -AllMatches|foreach {$_.Matches.Groups[0].Value}| ft

#AUDIT Policies
#View All Audit Options
auditpol /get /category:*
#View Subcategory
auditpol /get /category:"Object Access"
#Sets it
auditpol /set /subcategory:"File System"
#Clears It
auditpol /set /subcategory:"File System" /success:disable

#=====Command Prompt=====
#EVENT LOGS
#Show all logs
wevtutil el
#Get security log info
wevtutil gli security
#Get last 3 events from security log and view in human readable format.
wevtutil qe security /c:3 /f:text    

#Last 10 entries in System Log
Get-EventLog -LogName System -Newest 10
Get-EventLog -LogName System -Newest 10 | Format-Table -wrap
Get-EventLog -LogName System | Format-Table -wrap

#Search the event logs and show the entire message
Get-Eventlog -LogName Security | ft -wrap
#Search for a String
Get-Eventlog -LogName Security | ft -wrap | findstr /i $tR1nG
Get-Eventlog -LogName Security | ft -wrap | findstr /i "An attempt was made to access an object."

#Finding Log Type to Query
Get-WinEvent -Listlog *

#Checking If a User Logged on
Get-Winevent -FilterHashtable @{logname='Security';id='4624'} | ft -Wrap
Get-Winevent -FilterHashtable @{logname='Security';id='4624'} | ft -Wrap | findstr /i "generated"

#Checking Powershell Operational Logs
Get-WinEvent Microsoft-Windows-PowerShell/Operational |Where-Object {$_.Message -ilike "*Out-Default*"} | Format-List

Get-WinEvent Microsoft-Windows-PowerShell/Operational |Where-Object {$_.Message -ilike "*Pipeline ID = 4103"} | Format-List
```