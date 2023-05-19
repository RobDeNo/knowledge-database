# Windows_Active_Directory_Basics_85
## What is the domain portion of the following SID:
    S-1-5-21-1004336348-1177238915-682003330-1000

```powershell
S-1-5-21-1004336348-1177238915-682003330-512

The SID for Contoso\Domain Admins has:

    A revision level (1)
    An identifier authority (5, NT Authority)
    A domain identifier (21-1004336348-1177238915-682003330, Contoso)
    A relative identifier (512, Domain Admins)


```
--------------------------------------------------------------------------------
# Windows_Active_Directory_Basics_15
## What PowerShell command will list domain groups?
```powershell
Get-ADGroup
```
--------------------------------------------------------------------------------
# Windows_Active_Directory_Basics_25
## What PowerShell command will list all users and their default properties?
The flag is the full command with arguments.
```powershell
Get-ADuser -filter *

```
--------------------------------------------------------------------------------
#
##
```powershell


```
--------------------------------------------------------------------------------
# Windows_AD_Search_Accounts10
## Find the expired accounts that aren't disabled. List the last names in Alphabetical Order, separated with a comma, and no space between.
Flag format: name,name
Krause,Page
```powershell
Search-ADAccount -AccountExpired
```
--------------------------------------------------------------------------------
# Windows_AD_Search_Emails10
## Find the unprofessional email addresses. List the email's domain.
```powershell
get-aduser -filter {Enabled -eq "FALSE"} -properties name, enabled
CharlieB@ashleymadison.com
Get-ADUser -filter * -Properties EmailAddress | Select EmailAddress 
```
--------------------------------------------------------------------------------
# Windows_AD_Search_Files10
##The flag is the unprofessionally-named file located somewhere on the Warrior Share.
Connect to the Warrior Share:
net use * "\\file-server\warrior share"

```powershell
Get-childitem -r
Get-ChildItem -recurse -force -ErrorAction SilentlyContinue | Where-Object {$_.Name -match ''}
Copy-Item Z:\Brigade HQ\CMD GRP\lulz.pdf C:\Users\andy.dwyer\Desktop # wont work
Copy-Item 'Z:\Brigade HQ\CMD GRP\lulz.pdf' 'C:\Users\andy.dwyer\Desktop' #must be in quoites, worked
#go to admin station, and map the warrior share
#map the sysy SysInternals
#copy over the file
Copy-Item 'Z:\Brigade HQ\CMD GRP\lulz.pdf' 'C:\Users\andy.dwyer\Desktop'
C:\Users\student\Desktop
```
--------------------------------------------------------------------------------
#
##
```powershell


```
--------------------------------------------------------------------------------
#
##
```powershell


```
--------------------------------------------------------------------------------
#
##
```powershell


```
--------------------------------------------------------------------------------
#
##
```powershell


```
--------------------------------------------------------------------------------
#
##
```powershell
What PowerShell command will list all users and their default properties?

The flag is the full command with arguments.


```
--------------------------------------------------------------------------------
#
##
```powershell


```
--------------------------------------------------------------------------------
#
##
```powershell


```
--------------------------------------------------------------------------------
#
##
```powershell


```
--------------------------------------------------------------------------------
#
##
```powershell


```
--------------------------------------------------------------------------------

1. #File, there is a memo " hey girl hey lemme get them access for YA BOYYYYYYYYY" transfer the file
2. 2. 2 pops worth of finding threats