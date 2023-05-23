# AD SID Breakdown
    S-1-5-21-1004336348-1177238915-682003330-1000

```powershell
S-1-5-21-1004336348-1177238915-682003330-512

The SID for Contoso\group has:

    A revision level (1)
    An identifier authority (5, NT Authority)
    A domain identifier (21-1004336348-1177238915-682003330, Contoso)
    A relative identifier (512, group)
```
--------------------------------------------------------------------------------
# Expired Accounts
```powershell
Search-ADAccount -AccountExpired
```
--------------------------------------------------------------------------------
# Find emails in AD
```powershell
get-aduser -filter {Enabled -eq "FALSE"} -properties name, enabled
Get-ADUser -filter * -Properties EmailAddress | Select EmailAddress 
```
--------------------------------------------------------------------------------
# find file
net use * "\\file-server\share name"

```powershell
Get-childitem -r
Get-ChildItem -recurse -force -ErrorAction SilentlyContinue | Where-Object {$_.Name -match ''}
#do the above command from the root of the drive
#go to admin station, and map the share name
#map the sysy SysInternals
#copy over the file
Copy-Item 'Z:\filelocation\location\xxx.pdf' 'C:\Users\student\Desktop'
C:\Users\student\Desktop

scp source destination
scp REMOTE_USER@REMOTE_IP:REMOTE_PATH ../../WarriorShare/filelocation/location/filename.pdf

#go into folder location, this will put it in an.dwyer home directory
scp filename.pdf user.name@10.10.0.2:
#now you will need to copy the file to where your located
cp ..\..\user.name\filename.pdf
#copy to admin station
scp student@10.50.38.169:Desktop/filename.pdf
```
--------------------------------------------------------------------------------
# Windows_AD_Search_Insider_2 10
The flag is the name of the user who is requesting modified access rights.
Connect to the share name:
net use * "\\file-server\share name"
```PowerShell

Get-ADUser -filter * -Properties * | select Name,OfficePhone | Sort-Object Name | Select-String "string"
@{Name=user.name; OfficePhone=706-string}
```
--------------------------------------------------------------------------------
# Windows_AD_Search_Insider_1 10
## The flag is the name of the file where someone is requesting modified access rights.
Connect to the share name:
net use * "\\file-server\share name"

```Powershell
#while being logged into the warrors share i ran the below command
Get-ChildItem -recurse -force -ErrorAction SilentlyContinue | Where-Object {$_.Name -match ''}
#Find the below folder with the command
Directory: Z:\filelocation\S-6
Mode                LastWriteTime         Length Name
----                -------------         ------ ----
-a----        2/23/2022   9:54 PM          32510 file.pdf
-a----        2/23/2022   9:54 PM          36491 file.docx
#now you need to copy it over to your machine
#go into folder location, this will put it in an.dwyer home directory on your admin station
scp ./file.pdf user.name@10.10.0.2:
#now you will need to copy the file to where your located OR just RDP and open the file by navigating to your desktop
cp ..\..\user.name\filename.pdf
#copy to admin station
scp student@10.50.38.169:Desktop/filename.pdf
```


--------------------------------------------------------------------------------
# Windows_AD_Search_Naming 10
##Find the accounts that contain unprofessional information in the description.
List the last names in Alphabetical Order, separated by a comma, with no space.
Flag format: name,name
```powershell
Get-ADUser -filter * -Properties * | select Name,Description | Where-Object {$_.Description -NotMatch 'Soldier'}
Get-ADUser -filter * -Properties * | select Name,Description | Where-Object {$_.Description -Match 'description' -or $_.Description -Match '<'} 
Get-ADUser -filter * -Properties * | select Name,Description | Where-Object {$_.Description -Match 'description' -or $_.Description -Match '<'} | sort 
```
--------------------------------------------------------------------------------
# get accounts with no expire and yes

```powershell
Get-ADUser -filter * -Properties * | select PasswordNeverExpires AllowReversiblePasswordEncryption
#Get the information needed
Get-ADUser -filter * -Properties * | select Name,PasswordNeverExpires,AllowReversiblePasswordEncryption 
#add to remove the False
Get-ADUser -filter * -Properties * | select Name,PasswordNeverExpires,AllowReversiblePasswordEncryption | Where-Object {$_.Description -Match 'false'}# DOES NOT work
PS Z:\> Get-ADUser -filter * -Properties * | select Name,PasswordNeverExpires,AllowReversiblePasswordEncryption | Select-String -pattern True | sort
@{Name=user.name; PasswordNeverExpires=False; AllowReversiblePasswordEncryption=True}

```
--------------------------------------------------------------------------------
# find imp file
net use * "\\file-server\share name"
```powershell
   Directory: Z:\local\location\location
Mode                LastWriteTime         Length Name
----                -------------         ------ ----
-a----        2/23/2022   9:54 PM          11067 yuh.xlsx
```
--------------------------------------------------------------------------------
# find domain name
```powershell
Get-ADDomain
Name                               : name
NetBIOSName                        : NAME
```
--------------------------------------------------------------------------------
# show RID
Example: S-1-5-21-1004336348-1177238915-682003330-[501]
```powershell
#Run this command 
PS Z:\> Get-ADUser -Identity 'NAME' -Properties Description

Enabled           : False
GivenName         :
Name              : NAME
ObjectClass       : user
ObjectGUID        : 5be4da40-22c3-4b7e-8d5f-1e0174413736
SamAccountName    : NAME
SID               : S-1-5-21-427089730-1199744433-1189759946-502
Surname           :
UserPrincipalName :


```
--------------------------------------------------------------------------------
# show members of AD
```powershell
Get-ADGroupMember -Identity 'group' | Select-Object Name
Name
----
Administrator
System Admins LV1
```
--------------------------------------------------------------------------------
# show members in group
```powershell
Get-ADGroupMember -Identity 'group' -recurse | Select-Object Name
```
--------------------------------------------------------------------------------
# find more stuff
```powershell
Get-ADUser -filter * -Properties * | select Name,OfficePhone | Sort-Object Name | Select-String "string"
```
