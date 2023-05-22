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
# Windows_AD_Search_Accounts 10
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
# Windows_AD_Search_Files 10
##The flag is the unprofessionally-named file located somewhere on the Warrior Share.
Connect to the Warrior Share:
net use * "\\file-server\warrior share"

```powershell
Get-childitem -r
Get-ChildItem -recurse -force -ErrorAction SilentlyContinue | Where-Object {$_.Name -match ''}
#do the above command from the root of the drive
#go to admin station, and map the warrior share
#map the sysy SysInternals
#copy over the file
Copy-Item 'Z:\Brigade HQ\CMD GRP\lulz.pdf' 'C:\Users\student\Desktop'
C:\Users\student\Desktop

scp source destination
scp REMOTE_USER@REMOTE_IP:REMOTE_PATH ../../WarriorShare/Brigade HQ/CMD GRP/lulz.pdf

#go into folder location, this will put it in an.dwyer home directory
scp lulz.pdf andy.dwyer@10.10.0.2:
#now you will need to copy the file to where your located
cp ..\..\andy.dwyer\lulz.pdf
#copy to admin station
scp student@10.50.38.169:Desktop/lulz.pdf
```
--------------------------------------------------------------------------------
# Windows_AD_Search_Insider_2 10
The flag is the name of the user who is requesting modified access rights.
Connect to the Warrior Share:
net use * "\\file-server\warrior share"
```PowerShell

Get-ADUser -filter * -Properties * | select Name,OfficePhone | Sort-Object Name | Select-String "336-6754"
@{Name=Karen.Nance; OfficePhone=706-336-6754}

#######################
Angelo,
Bro, I can’t add this printer in my office, and Talia told me that you helped 
her out when she couldn’t print by adding her to the Printer Group or 
something like that, so she could add printers. Hook a Brother up! LOL 
C Ya 2nite Bro!
- K
 336-6754
#######################
```
--------------------------------------------------------------------------------
# Windows_AD_Search_Insider_1 10
## The flag is the name of the file where someone is requesting modified access rights.
Connect to the Warrior Share:
net use * "\\file-server\warrior share"

```Powershell
#while being logged into the warrors share i ran the below command
Get-ChildItem -recurse -force -ErrorAction SilentlyContinue | Where-Object {$_.Name -match ''}
#Find the below folder with the command
Directory: Z:\Brigade HQ\S-6
Mode                LastWriteTime         Length Name
----                -------------         ------ ----
-a----        2/23/2022   9:54 PM          32510 14287.pdf
-a----        2/23/2022   9:54 PM          36491 Domain-CLI-Cheat-Sheet.docx
#now you need to copy it over to your machine
#go into folder location, this will put it in an.dwyer home directory on your admin station
scp ./14287.pdf andy.dwyer@10.10.0.2:
#now you will need to copy the file to where your located OR just RDP and open the file by navigating to your desktop
cp ..\..\andy.dwyer\lulz.pdf
#copy to admin station
scp student@10.50.38.169:Desktop/lulz.pdf
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

Name             Description
----             -----------
Xavier.Ibarra    description
Raegan.Lee       description
Krystal.Jimenez  <------<< Brigade S-1 ACTIONS NCOIC |_|> >>------>
Alice.Brandywine <=========|%%%%> Brigade S-6 Automations NCO <%%%%|=========>
brandywine,Jimenez
```
--------------------------------------------------------------------------------
# Windows_AD_Search_Passwords 10
##Find the following three accounts:
    two accounts with passwords that never expire
    one account that has its password stored using reversible encryption
List the last names in Alphabetical Order, comma-separated, no spaces. Do not list built-in accounts.
Flag format: name,name,name

```powershell
Get-ADUser -filter * -Properties * | select PasswordNeverExpires AllowReversiblePasswordEncryption
#Get the information needed
Get-ADUser -filter * -Properties * | select Name,PasswordNeverExpires,AllowReversiblePasswordEncryption 
#add to remove the False
Get-ADUser -filter * -Properties * | select Name,PasswordNeverExpires,AllowReversiblePasswordEncryption | Where-Object {$_.Description -Match 'false'}# DOES NOT work
PS Z:\> Get-ADUser -filter * -Properties * | select Name,PasswordNeverExpires,AllowReversiblePasswordEncryption | Select-String -pattern True | sort
@{Name=Alice.Brandywine; PasswordNeverExpires=False; AllowReversiblePasswordEncryption=True}
@{Name=Eddie.Sanchez; PasswordNeverExpires=True; AllowReversiblePasswordEncryption=False}
@{Name=Xavier.Ibarra; PasswordNeverExpires=True; AllowReversiblePasswordEncryption=False}
Brandywine,Ibarra,Sanchez
```
--------------------------------------------------------------------------------
# Windows_AD_Search_PII 10
##The flag is the name of the file containing PII on the Warrior Share.
Connect to the Warrior Share:
net use * "\\file-server\warrior share"
```powershell
   Directory: Z:\3rd Battalion\Head Quarters\CMD GRP
Mode                LastWriteTime         Length Name
----                -------------         ------ ----
-a----        2/23/2022   9:54 PM          11067 phone_matrix.xlsx
```
--------------------------------------------------------------------------------
# Windows_Active_Directory_Basics_6 10
## Find the short name of the domain in which this server is a part of.
```powershell
Get-ADDomain
Name                               : army
NetBIOSName                        : ARMY
```
--------------------------------------------------------------------------------
# Windows_Active_Directory_Basics_7 10
## What is the RID of the krbtgt account.
Example: S-1-5-21-1004336348-1177238915-682003330-[501]
```powershell
#Run this command 
PS Z:\> Get-ADUser -Identity 'krbtgt' -Properties Description

Description       : Key Distribution Center Service Account
DistinguishedName : CN=krbtgt,CN=Users,DC=army,DC=warriors
Enabled           : False
GivenName         :
Name              : krbtgt
ObjectClass       : user
ObjectGUID        : 5be4da40-22c3-4b7e-8d5f-1e0174413736
SamAccountName    : krbtgt
SID               : S-1-5-21-427089730-1199744433-1189759946-502
Surname           :
UserPrincipalName :


```
--------------------------------------------------------------------------------
# Windows_Active_Directory_Basics_3 10
## How many users are members of the Domain Admins group?
HINT: No sub-groups.

```powershell
Get-ADGroupMember -Identity 'Domain Admins' | Select-Object Name
Name
----
Administrator
System Admins LV1
```
--------------------------------------------------------------------------------
# Windows_Active_Directory_Basics_4 10
## How many total users are members of the Domain Admins group?
```powershell
Get-ADGroupMember -Identity 'Domain Admins' -recurse | Select-Object Name
```
--------------------------------------------------------------------------------
# Windows_AD_Follow_Insider_Trail_1 15
## Continue to follow the insider trail to find additional insider threats and their compromised mission.
The flag is the full name of the next insider threat identified.
HINT: Search the Active Directory record of the user identified in search_insider_2.
```powershell
#search all properties for idenitifed first insider
Get-ADUser -Identity 'Karen.Nance' -Properties *
#Suspect infoAlonso.BairdAlonso.Baird
StreetAddress                        : rkcrpg zl arkg pbzzhavpngvba ng 06:30 uef gbzbeebj zbeavat. Ybpngvba sbe                                 qrgnvyf vaibyivat n uvtuyl pynffvsvrq
                                       bcrengvba hcybnqrq gb Gvssnal . .
Surname                              : Nance
telephoneNumber                      : 706-336-6754
physicalDeliveryOfficeName           : users pa55w0rd: SchrodingersCat!!

#Translation 
expect my next communication at 06:30 hrs tomorrow morning. Location for details involving a highly classified
                                       operation uploaded to Tiffany . .
#Find Tiffany
Get-ADUser -filter * -Properties * | select Name| Sort-Object Name | Select-String "tiffany"                          
@{Name=Tiffany.Bellacino}
Get-ADUser -Identity 'Tiffany.Bellacino' -Properties *

Get-ADUser -filter * -Properties * | Select Name | Sort-Object Name 
Get-ADUser -filter * -Properties * | select Name,OfficePhone | Sort-Object Name | Select-String "336-6754"

Get-ADUser -filter * -Properties * | select Name,OfficePhone | Sort-Object Name | Select-String "alonso"

@{Name=Alonso.Baird; OfficePhone=706-255-5290}
Get-ADUser -Identity 'Alonso.Baird' -Properties Description
Alonso.Baird
## moving on to checking the phone matrix Windows_AD_Search_Files
    Directory: Z:\3rd Battalion\Head Quarters\CMD GRP


Mode                LastWriteTime         Length Name
----                -------------         ------ ----
-a----        2/23/2022   9:54 PM          11067 phone_matrix.xlsx
##channging gears and looking for a user references as Taliyah.Gomez
Get-ADUser -Identity 'Taliyah.Gomez' -Properties *
# looking back at insider one it specifies a printer gorup, now i am looking at the gorup
Get-ADGroup -Filter * | select Name | Select-String "print"
@{Name=Print Operators}
@{Name=Print Server Group}
### SID FOUND!>!>!>!>!>!>!>
Get-ADUser -filter * -Properties * | select Name,SID | Sort-Object Name | Select-String "0118442457-2268"
#####Nope
Get-ADUser -filter * -Properties * | Select-String "lewis"
damian.lewis
Get-ADUser -Identity 'Damian.Lewis' -Properties Description
##interesting FOUND
info                                 : P0P SECRET - Star Wars Rogue One, opening night tomorrow!  Get em before they sell out! -Isiah

#ISIAH
```
--------------------------------------------------------------------------------
# Windows_AD_Follow_Insider_Trail_3 15
## Continue to follow the insider trail to find additional insider threats and their compromised mission.
Continue to follow the insider trail to find additional insider threats and their compromised mission.
The flag is the full name of the insider threat identified.
HINT: Search the Active Directory record for the user identified in follow_insider_trail_2.
```powershell
Get-ADUser -filter * -Properties * | select Name| Sort-Object Name | Select-String "Isiah" 
#two isiahs FOUND
@{Name=Isiah.Jesus}
@{Name=Isiah.Walter}
Get-ADUser -Identity 'Isiah.Jesus' -Properties * ### this is the answer
StreetAddress                        : aHR0cHM6Ly93d3cueW91dHViZS5jb20vd2F0Y2g/dj1kUXc0dzlXZ1hjUQ==
https://www.youtube.com/watch?v=dQw4w9WgXcQ

Get-ADUser -Identity 'Isiah.Walter' -Properties *
pwdLastSet                           : 133075602242695617
```
--------------------------------------------------------------------------------
#Windows_AD_Follow_Insider_Trail_4 15
## Continue to follow the insider trail to find additional insider threats and their compromised mission. This flag is a video link.
Hint: Search the Active Directory record for the user identified in follow_insider_trail_3.
```Powershell
#drop the below code in cyber Chef
# add the "magic" thingy, its blue at the bottom of the left
aHR0cHM6Ly93d3cueW91dHViZS5jb20vd2F0Y2g/dj1kUXc0dzlXZ1hjUQ==
#video!!
https://www.youtube.com/watch?v=dQw4w9WgXcQ










1. #File, there is a memo " hey girl hey lemme get them access for YA BOYYYYYYYYY" transfer the file
2. 2. 2 pops worth of finding threats