# Active Directory
The Active Directory structure includes three main tiers: domains, trees, and forests. Each level of AD has specific access rights that Domain Controllers manage.
1.) Domains
    Active Directory objects (users or devices) that all use the same database or ar typically in the same location.
2.) Trees
    Several Domains grouped together. Typically, has a primary domain controller for the entire tree.
3.) Forests
    Forests are groups of trees connected together via trust relationships.

# Initial Recon
```powershell
#Get a list of AD Commands Available
Get-Command -Module activedirectory

CommandType     Name                                               Version    Source
-----------     ----                                               -------    ------
Cmdlet          Add-ADCentralAccessPolicyMember                    1.0.1.0    ActiveDirectory
Cmdlet          Add-ADComputerServiceAccount                       1.0.1.0    ActiveDirectory
Cmdlet          Add-ADDomainControllerPasswordReplicationPolicy    1.0.1.0    ActiveDirectory
Cmdlet          Add-ADFineGrainedPasswordPolicySubject             1.0.1.0    ActiveDirectory

__________CUT____________

#Get the Default Domain Password Policy
PS> Get-ADDefaultDomainPasswordPolicy

ComplexityEnabled           : True
DistinguishedName           : DC=army,DC=warriors
LockoutDuration             : 00:30:00
LockoutObservationWindow    : 00:30:00
LockoutThreshold            : 0
MaxPasswordAge              : 42.00:00:00
__________CUT____________

#Check for any Fine-Grained Password Policies
PS> Get-ADFineGrainedPasswordPolicy -Filter {name -like "*"}

   -No returns means it is not set-

#Get the forest details
Get-ADForest
ApplicationPartitions : {DC=DomainDnsZones,DC=army,DC=warriors, DC=ForestDnsZones,DC=army,DC=warriors}
CrossForestReferences : {}
DomainNamingMaster    : domain-controll.army.warriors
Domains               : {army.warriors}
__________CUT____________
#Get Domain details
Get-ADDomain

AllowedDNSSuffixes                 : {}
ChildDomains                       : {}
ComputersContainer                 : CN=Computers,DC=army,DC=warriors
DeletedObjectsContainer            : CN=Deleted Objects,DC=army,DC=warriors
DistinguishedName                  : DC=army,DC=warriors

#Get AD groups
Get-ADGroup -Filter *

DistinguishedName : CN=System Admins,CN=Users,DC=army,DC=warriors
GroupCategory     : Security
GroupScope        : Global
Name              : System Admins

#Get a group details
PS> Get-ADGroup -Identity 'IA Analysts Team'

DistinguishedName : CN=IA Analysts Team,CN=Users,DC=army,DC=warriors
GroupCategory     : Security
GroupScope        : Global
Name              : IA Analysts Team

#Get a list of a groups members
PS> Get-ADGroupMember -Identity 'IA Analysts Team' -Recursive
   -No return means there are no assigned members-

#Get AD users
Get-ADUser -Filter 'Name -like "*"'

DistinguishedName : CN=Willie.Liu,OU=3RD PLT,OU=CCO,OU=3RDBN,OU=WARRIORS,DC=army,DC=warriors
Enabled           : True
GivenName         : Willie
Name              : Willie.Liu
ObjectClass       : user
__________CUT____________

# To see additional properties, not just the default set
Get-ADUser -Identity 'Nina.Webster' -Properties Description

Description       : 3rd PLT Soldier
DistinguishedName : CN=Nina.Webster,OU=3RD PLT,OU=CCO,OU=3RDBN,OU=WARRIORS,DC=army,DC=warriors
Enabled           : True
GivenName         : Nina
Name              : Nina.Webster
ObjectClass       : user
ObjectGUID        : b35ba844-5b40-4eb4-96fd-ffafef36269a
Office            :
SamAccountName    : Nina.Webster
SID               : S-1-5-21-1181003830-945744892-2632747169-1820
Surname           : Webster
UserPrincipalName :

S-1-5-32-544

This SID has four components:

    A revision level (1)
    An identifier authority value (5, NT Authority)
    A domain identifier (32, Builtin)
    A relative identifier (544, Administrators)

```
# Enumerate Users
```powershell
#FInd disabled Users
PS> get-aduser -filter {Enabled -eq "FALSE"} -properties name, enabled

DistinguishedName : CN=Guest,CN=Users,DC=army,DC=warriors
Enabled           : False
GivenName         :
Name              : Guest
ObjectClass       : user
__________CUT____________

#Enable that user
Enable-ADAccount -Identity "guest"
   -Nothing returned if successful execution-

#Change Password
PS> Set-AdAccountPassword -Identity guest -NewPassword (ConvertTo-SecureString -AsPlaintext -String "PassWord12345!!" -Force)
   -Nothing returned if successful execution-
#Add user to an admin group
Add-ADGroupMember -Identity "Domain Admins" -Members guest
-Nothing returned if successful execution-

#Get DistinguishedName to match AD Format
Get-ADuser -filter * | select distinguishedname, name

CN=Amelie.Benjamin,OU=3RD PLT,OU=CCO,OU=3RDBN,OU=WARRIORS,DC=army,DC=warriors     Amelie.Benjamin
CN=Ramon.Gibbs,OU=3RD PLT,OU=CCO,OU=3RDBN,OU=WARRIORS,DC=army,DC=warriors         Ramon.Gibbs
CN=Willie.Liu,OU=3RD PLT,OU=CCO,OU=3RDBN,OU=WARRIORS,DC=army,DC=warriors          Willie.Liu
CN=Yair.Roth,OU=3RD PLT,OU=CCO,OU=3RDBN,OU=WARRIORS,DC=army,DC=warriors           Yair.Roth
CN=Elisha.Coleman,OU=3RD PLT,OU=CCO,OU=3RDBN,OU=WARRIORS,DC=army,DC=warriors      Elisha.Coleman

#create a new user
New-ADUser -Name "Bad.Guy" -AccountPassword (ConvertTo-SecureString -AsPlaintext -String "PassWord12345!!" -Force) -path "OU=3RD PLT,OU=CCO,OU=3RDBN,OU=WARRIORS,DC=army,DC=warriors"
   -Nothing returned if successful execution-

#remove user
Remove-ADUser -Identity "Bad.Guy"

Confirm
Are you sure you want to perform this action?
Performing the operation "Remove" on target "CN=Bad.Guy,OU=3RD PLT,OU=CCO,OU=3RDBN,OU=WARRIORS,DC=army,DC=warriors".
[Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "Y"): Y

#Remove from group
Remove-ADGroupMember -Identity "Domain Admins" -Members guest

Confirm
Are you sure you want to perform this action?
Performing the operation "Remove" on target "CN=Bad.Guy,OU=3RD PLT,OU=CCO,OU=3RDBN,OU=WARRIORS,DC=army,DC=warriors".
[Y] Yes  [A] Yes to All  [N] No  [L] No to All  [S] Suspend  [?] Help (default is "Y"): Y

#Get all Domain Admin Account
PS> Get-AdGroupMember -identity "Domain Admins" -Recursive | %{Get-ADUser -identity $_.DistinguishedName}
PS> Get-AdGroupMember -identity "Domain Admins" -Recursive | %{Get-ADUser -identity $_.DistinguishedName} | select name, Enabled

name            Enabled
----            -------
Administrator      True
andy.dwyer         True
Giada.Barrett      True
Garrett.Lowery     True
Trevon.Wolfe       True
Angelo.Berry       True
__________CUT____________

#Get all Enterprise Admin Accounts
Get-AdGroupMember -identity "Enterprise Admins" -Recursive | %{Get-ADUser -identity $_.DistinguishedName} | select name, Enabled

name          Enabled
----          -------
Administrator    True
__________CUT____________
```
# Display Resultant Set of Policy(RSoP) Information
Run gpresult from the Domain Controller.
```powershell
#Output the computer and user node settings of a user
C:> gpresult /user Webster /v
C:> gpresult /user Administrator /v
RSOP data for ARMY\Administrator on DOMAIN-CONTROLL : Logging Mode

OS Configuration:            Primary Domain Controller
OS Version:                  10.0.17763
Site Name:                   Default-First-Site-Name
Roaming Profile:             N/A
Local Profile:               C:\Users\Administrator
__________CUT____________

#Displays data about the machine and logged on user
C:> gpresult /r

COMPUTER SETTINGS

    CN=DOMAIN-CONTROLL,OU=Domain Controllers,DC=army,DC=warriors
    Last time Group Policy was applied: 2/25/2021 at 6:21:44 PM
    Group Policy was applied from:      domain-controll.army.warriors
    Group Policy slow link threshold:   500 kbps
    Domain Name:                        ARMY
    Domain Type:                        Windows 2008 or later
__________CUT____________

#. Force any group policy setting to take affect immediately versus rebooting the computer
C:> gpupdate /force

Updating policy...

Computer Policy update has completed successfully.
User Policy update has completed successfully.
```
# Administrators Best Practices
```powershell
#Get Name Property from the Active Directory Group named "Domain Admins"
(Get-AdGroupMember -Identity 'domain admins').Name
Administrator
System Admins LV1

Get-AdGroupMember -Identity 'domain admins' | select name

name
--------
Administrator
System Admins LV1
```powershell
#Get Active Directory Group 'System' Admin Names 'LvL 1'
(Get-AdGroupMember -Identity "System Admins LV1").Name
System Admins

#Get Active Directory Group 'System Admin' Names
(Get-AdGroupMember -Identity "System Admins").Name
andy.dwyer
System Admins
Print Server Group
System Admins LV2
Giada.Barrett
Garrett.Lowery
Trevon.Wolfe
Angelo.Berry