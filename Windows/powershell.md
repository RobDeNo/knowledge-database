#Powershell 

# USE PowerShell Integrated Scripting Environment (ISE) 

# 1. Basic Powershell Concepts


## 1.1 Commands and Arguments
```powershell
Verb-Nown
get-process (singular)
NOT 
get-processes

Get-ChildItem
New-Item C:\Users\student\Desktop\content.txt
Set-Content C:\Users\student\Desktop\content.txt "This is the way" #create file with the content

Get-Content -Path "C:\Users\student\Desktop\content.txt"  ## Display the contents of the file
Get-Variable  #Display current Variables
Get-Verb  #List the PowerShell verbs
Start-Process Notepad.exe  # Use the Method Start to open notepad.exe
Stop-Process notepad ## Use the Method Stop to close notepad.exe 
Get-Command ## List the PowerShell cmdlets
```
# 1.6 Pipelining
- Objects in Powershell are passed along in pipes (|) based off their input cmdlets
Display Properties and Methods of Get-LocalUser cmdlet
```powershell
Get-LocalUser | Get-Member #Display Properties and Methods of Get-LocalUser cmdlet
- Properties = what we know
- Methods    = what we can do
Get-ChildItem C:\Users\student\Desktop\content.txt | Get-Member # previous example with creating content.txt
```
# 1.3 Powershell Object Properties
## Return the single property of 'name' of every process      
```powershell              
(get-process).name
#####this is the method way of getting the process
(Get-Process).Name                             
# Display the Get-Process Properties of 'Name, ID, Path' for every process                           
Get-Process | Select-Object Name, ID, path                                                                     
# Get cmdlets and display them in order
Get-Command -Type Cmdlet | Sort-Object -Property Noun | Format-Table    

# Check out how to format
Get-Help Format-Table
Get-Help Format-List

Get-Command -Module Microsoft.PowerShell.Security, Microsoft.PowerShell.Utility -GroupBy Noun # Get commands in a module     
###################################
###################################
```
# 1.2 Powershell Help
```powershell
# Display help about a PowerShell cmdlet
Get-Help <cmdlet>  
                                               
# Display help for Get-Process cmdlet
Get-Help get-process  
                                            
# Open a web browser and display help for the Get-Process cmdlet on the Microsoft website
Get-Help get-process -online                                      
man get-process
man get-process -detailed
man get-process -full

# Display history of commands in current window
Get-History 
# Display present working directory 
Get-Location
     # similar to PWD on Linux, gl is the alias         
get-alias gl
get-alias dir
get-alias ls
```
# 1.4 Using the Methods of Objects
```PowerShell
# Display all objects with Method in their name from the results from Get-Member of the Get-Process cmdlet
Get-Process | Get-Member | Where-Object {$_.Membertype -match "Method"}  
# Open an instance of calculator     
Start-Process calc 
# Stop a named process using a method                             
(Get-Process calculator*).kill()                
# Same as above
Stop-Process -name calculator*                  

```
# 1.5 Pipelined Variables
```powershell
# List all the processes with a PID lower than 1000
Get-Process | Select-Object Name, ID, path | Where-object {$_.ID -lt '1000'}            
# Count the list of all the processes with a PID lower than 1000
(Get-Process | Select-Object Name, ID, path | Where-object {$_.ID -lt '1000'}).count    
```
# 2.7 PowerShell Comparison Operators
```powershell
get-help about_comparison_operators
# Take the output from Get-Service and looks for Status property of Stopped and list those Services
Get-Service | Where-Object {$_.Status -eq "Stopped"}            
# Same as above
Get-Service | where Status -eq "Stopped"   
# Lists Processes that have Greater Than 1000 Handles                     
Get-Process | Where-Object -Property Handles -GE -Value 1000    
# Same as above
Get-Process | where Handles -GE 1000                            
```
# 2.8 Commenting in PowerShell
 ```powershell
Get-Process | select -first 10 # This is how to do head in PS
<# I could
also write a book
IF I really wanted
to #>
```
# 1.7 CIM Classes
- Common Information Model 
- Think of CIM class as place holder and CIM instance as an actual event.
- Windows Managemenet Information is deprecated WMI
```powershell
# List all CIM Classes
Get-Cimclass *                                                                  
# List the antispywareproduct class from the root/security instance
Get-CimInstance –Namespace root\securitycenter2 –ClassName antispywareproduct 
# Show properties and methods for this Instance  
Get-CimInstance -ClassName Win32_LogicalDisk -Filter “DriveType=3” | gm    
# Use the Windows Management Instrumentation method     
get
# Query Win32_Bios
Get-CimInstance -class Win32_BIOS                      
# same output but deprecated command
Get-WmiObject -Class Win32_BIOS                        
```
# 2.3 PowerShell Variables
 - unit of memory to store all types of values
 - Display names without the preceding <$>
```powershell
Get-Variable                
      
# Create the MyVariable with 1,2,3
$MyVariable = 1, 2, 3, "dingo"    

# Delete the value of a Variable
Clear-Variable -Name MyVariable   

# Delete the Variable
Remove-Variable -Name MyVariable  

#Variable with command results
# Create a Variable with the results of Get-Process
$Processes = Get-Process  
 
# Create a combined Date/Time variable from the results of Get-Date       
$Today = (Get-Date).DateTime      

#To view a variable’s object type, use Get-Member
$PSHome | Get-Member              # Displays System.String with it's objects and properties
$A=12                             # Creating A with an integer
$A | Get-Member                   # Displays System.Int32
```
# 2.3.2 Automatic Variables
```powershell
Get-Help about_automatic_variables
```
# 2.1 PowerShell Loops
```powershell
Get-Help about_For
Get-Help about_Foreach
Get-Help about_While
Get-Help about_Do
```
# 2.1.2 For Loop
```powershell
# for this (as long as it's true)...

 #Initial placeholder 
    # Example:  $num = 1
 #Condition Placeholder
    #Example: $num -lt 10
 #Statement List Placeholder
    #Example: "I count $num "
 #Repeat Placeholder
    #Example: $num++

for ($num = 1 ; $num -le 10 ; $num++){"I count $num"}
##################################
$array = ("apples", "dingos", "bananana", "ananas")
for($i = 0; $i -lt $array.length; $i++){ $array[$i] }
##################################
##################################
#2.1.3 Foreach Loop  
# (iterating) a series of values in a collection of items.
##################################
$letteroftheDayArray = "a","b","c","d"
foreach ($letter in $letteroftheDayArray)
{
  Write-Host $letter
}
##################################

foreach ($file in Get-ChildItem)
{
  Write-Host $file, "|", $file.CreationTime
}
#2.1.4 While Loop
$val=0
while($val -ne 3)
{
    $val++
    Write-Host $val
}
```
# 2.1.1 Do Loop
- two primary types -- while and until
```powershell
#---while---
$x = 1,2,78,0
$count=0
$a=0

do { $count++; $a++ ; $x[$a]} while ($x[$a] -ne 0)

#---until--- (always runs at least once)
$x = 1,2,78,0
do { $count++; $a++; } until ($x[$a] -eq 0)
$count
```
# 2.1.5 Loops Combined
```powershell
for ($i = 1; $i -le 5; $i++) { Write-Host $i }

foreach ($i in Get-Alias) { Write-Host $i.name }
$i = 14

while ($i -gt 7) {
     Write-Host $i
     $i-=1
}
$i = 1
do
{
     Write-Host $i
     $i+=1
} while ($i -lt 7)
```
# 2.2 PowerShell Conditions  (if--elseif--else)
```powershell
if ($a -gt 2) {
    Write-Host "The value $a is greater than 2."
}
elseif ($a -eq 2) {
    Write-Host "The value $a is equal to 2."
}
else {
    Write-Host ("The value $a is less than 2 or" +
        " was not created or initialized..."+
        "or you didn't count for something")
}
```
# 2.4 PowerShell Arrays
```powershell 
$A = 22,5,10,8,12,9,80
echo $A
##################################
$b= 1..9
echo $b
##################################
foreach ($element in $b) {
  $element
}
##################################
# Print every other
for ($i = 0; $i -le ($b.length - 1); $i += 2) {
  $b[$i]
}
##################################
# Print until a condition is met
$i=0
while($i -lt 4) {
  $b[$i];
  $i++
}
```
# 2.1.6 Error Messaging
```powershell
# Display errors in red
Remove-Item does_not_exist.txt                                         
# Hide any errors
Remove-Item does_not_exist.txt -ErrorAction SilentlyContinue           

# Create a new file called 'it_exists.txt'
New-Item -Type File it_exists.txt   
# Return a message notifying that it was deleted                                   
Remove-Item it_exists.txt -Verbose                                     
```
# 2.5 PowerShell Functions
```powershell
Get-Help about_Functions                                      # Displays the help about Functions
Get-Help about_Functions_Advanced                             # Displays some more in-depth help about Functions
Function Do-Stuff { Get-Date; Get-Process; Get-Service }      # Creates a Function with 'Get-Date, Get-Process, Get-Service' inside of it
Do-Stuff |where Status -eq "Running"                          # Runs the Function
```
# 2.6 PowerShell Execution Policy
- Security concern, scripts can contain a host of malicious information
- PS uses .ps1 files to save and run PS cmds as a script
- By default policy is RESTRICTED not allowing scripts not created locally to run
- HENCE, we require specific permissions and validation prior to execution.
```powershell
# List all of the Scopes and ExecutionPolicies on the system
Get-ExecutionPolicy -list                                             
# Get the current user's ExecutionPolicy
Get-ExecutionPolicy    
# Sets the ExecutionPolicy for the CurrentUser to Unrestricted                                               
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope CurrentUser  
```
# 3. PowerShell Profiles
- Convenient way to store PowerShell configuration information 
 - as well as personalized aliases and functions to persistent use in every PowerShell session.
 ```powershell
$Profile
```
# 3.1 PowerShell Profile Paths
```powershell
$PsHome         # Stores the installation directory for PowerShell
$Home           # Stores the current user’s home directory
```
# Display the profile values of Names, MemberType, and Paths.
```powershell
$profile | Get-Member -Type NoteProperty 
# Display the same results but completed in case it was cut off '...'                       
$Profile | get-member -type noteproperty | ft -wrap 

# Narrowed results to display only Names            
$PROFILE | Get-Member -MemberType noteproperty | select name    
# ^^ all not case sensitive
```
# 3.2 Creating A PowerShell Profile
```powershell
# Create a $Profile for the CurrentUser. Force is used to ignore any errors.
New-Item -ItemType File -Path $profile -Force    
# Open your newly created $Profile, which is empty             
ISE $profile                                                  

# Test if inidvidual profiles were created
Test-Path -Path $profile.currentUsercurrentHost
Test-Path -Path $profile.currentUserAllHosts
Test-Path -Path $profile.AllUsersAllHosts
Test-Path -Path $profile.AllUserscurrentHost

#close the PowerShell window and you will be required to recreate the same PowerShell aliases.
New-Alias -Name DemUsers -Value Get-LocalUser

#################################################
# you can create functions  ***********
function Color-Console {
  $Host.ui.rawui.backgroundcolor = "black"
  $Host.ui.rawui.foregroundcolor = "green"
  $hosttime = (Get-ChildItem -Path $PSHOME\PowerShell.exe).CreationTime
  $hostversion="$($Host.Version.Major)`.$($Host.Version.Minor)"
  $Host.UI.RawUI.WindowTitle = "PowerShell $hostversion ($hosttime)"
  Clear-Host
}
Color-Console
##################################################
#you can start a transcript of all your commands that have been run
start-transcript
# Pipe to out-null so users don't see that commands are being recorded
start-transcript | out-null                       
# Starts to log commands into the c:\mywork.txt file
Start-Transcript C:\MyWork.txt                    
# Run get-service command and inputs that and the results into the transcript.
Get-Service                                       
# End the transcript
Stop-Transcript   
# View the contents of the created transcript                                
notepad c:\MyWork.txt                             
```
# 4. Windows Remoting
- Uses the Window Remote Management Protocol (WinRM) and 
- Web Services Management (WS-Man) to manage these communications.
- When the sessions have 2 different versions of PowerShell, the session will default to the lower version. 
- This can limit the cmdlets you have available.
- - be aware of this
```powershell
# Displays permissions
Get-PSSessionConfiguration                        
# query current network profiles
Get-ChildItem 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\NetworkList\Profiles'   
```
# 4.1 PowerShell Remoting Security
## WinRM uses Kerberos for authentication by default.
## encrypts all comms with AES-256 symmetric keys
## Uses ports 5985 for HTTP by default or 5986 for HTTPS.
```powershell
# Displays the WinRM configuration
winrm get winrm/config  
        # notice HTTPS Port 5986 and blank trusted hosts
# If you are outside of a Active Directory Domain then you have two options: 
# HTTPS or adding the host to the Trusted Hosts file
# Query trusted hosts
Get-Item WSMan:\localhost\client\TrustedHosts  
# Adding a single item to TrustedHosts
Set-Item WSMan:\localhost\Client\TrustedHosts -Value "File-Server"
# Adding multiple items                              
Set-Item WSMan:\localhost\Client\TrustedHosts -Value "File-Server,Domain-Controll,Workstation2" 
# Appends the Value instead of changing it
Set-Item WSMan:\localhost\Client\TrustedHosts -Value "workstation2" -Concatenate                    
```
# 5. Remoting commands
## PSRemoting consists of two separate concepts: Temporary and Persistent Sessions.
## Concentrating on Temporary sessions
# 5.1 Temporary Sessions
## Invoke-Command can be used to automate command execution across a domain 
## using both temporary and new-sessions.
```powershell
# Creates 1-to-1 Temporary Session
Invoke-Command -ComputerName File-Server {Get-Service | where Status -eq "Running"} 
# Running a Temporary Session as a Job        
Invoke-Command -ComputerName File-Server,Domain-Controll,Workstation2 {Get-Service} -asjob  
# Displays the job's Results
Receive-Job 2                                                                               
```

# Quick Reference Guide
This is the script pane
```powershell
update-help -force #updates Powershell Help files
verb-noun #PowerShell syntax
get-command #List all PS commands
get-verb #Lists all PowerShell verbs
get-command -noun process #Search for a specific command
get-help Get-Process -Full #List full help menu
get-help Get-Process -ShowWindow #Opens help in its own resizable and searchable windows
get-help Get-Process -examples #Shows only help file examples
get-help Get-Process -online #Opens the hlpe file on the web
get-process -name smss #lists on process
get-process -Com WinOpsStation -Na smss #Another way of listing one process
get-process get-process 
get-alias *get #List alaises that end with get
get-process | Get-Member | where MemberType -eq property #Lists PowerShell object properties
get-process | select name,id, path #Lists process names, ids, and where they run from
(get-process).Name #Lists a single column for get-proces
get-process | select name,id,path | sort -property id #sorts
get-process | select name,id,path | sort -property id | where id -LT "1000" #shows process less than 1000
get-process | select name,id,path | sort -property id | where {$_.id -LT "1000"} #2nd Where statement syntax
get-process svchost | select name,id,path #Lists all svchost processes
(get-process).count #Counts Processes
measure-object | gm #shows measure-0bject command where count is a property
start-process calc #Starts calculator process
get-process calc*
(get-process calculator).kill() #Kills caslulator process by invoking a kill method
Get-cimclass *BIOS*
Get-CimInstance Win32_BIOS
Get-WmiObject # (Depricated Command) 
Get-WmiObject Win32_BIOS
gwmi win32_useraccount
get-ciminstance win32_useraccount
get-cimclass *
Get-CimInstance –Namespace root\securitycenter2 –ClassName antispywareproduct
Get-CimInstance -ClassName Win32_LogicalDisk -Filter “DriveType=3” | gm
Get-ciminstance -Class Win32_LogicalDisk -Filter “DriveType=3”
PowerShell Functions 
====================
Function get-enum { 
    hostname
    date
    get-localuser | select name, enabled | ft
    get-process | select name, id, path | ft
    }
get-enum
Basic Looping
==============
# for (conditions){commands}
for ($i=1; $i -lt 10; $i++) {
    Write-Output "The loop number is $i"
    }

#while loop (conditions){commands} incriment at the end
$i = 10
while ($i -ge 0) {
Write-Output "The loop number is $i";
$i --
}

ForEach ($line in (get-process).name) {"Write-output The Process name is $line"}
get-help about_logical_operators

PowerShell Execution Policy
=========================
Get-ExecutionPolicy 
Set-ExecutionPolicy unRestricted -force
new-item -Name new_file.txt
Remove-Item .\new_file.txt -ErrorAction SilentlyContinue # supress errors
get-childitem -path c:\ -recurse -force # list files in directory recursively and show hidden files
Remove-Item .\new_file.txt -Verbose

ISE is different and has diff profiles
 Current user, Current Host $Home\[My ]Documents\WindowsPowerShell\Microsoft.PowerShellISE_profile.ps1
 All users, Current Host    $PsHome\Microsoft.PowerShellISE_profile.ps1
 $Profile.CurrentUserCurrentHost    
To determione if a profile is applied
test-path $profile.AllUsersAllHosts #set background =black
test-path $Profile.CurrentUserCurrentHost   #set background =white
test-path $Profile.CurrentUserAllHosts            #set background =blue
test-path $Profile.AllUsersCurrentHost        #set background =red

Sample Profile 
Write-output "======================================================"
Write-output "The user $env:USERNAME is being monitoired on $env:COMPUTERNAME"
Get-date
Start-Transcript | out-null
Write-output "======================================================"
Function get-enum { 
    hostname
    date
    get-localuser | select name, enabled | ft
    get-process | select name, id, path | ft
    }
    
Hostname
PowerShell Remoting
===================
Must be on the Admin-Station
Interactive Session
enter-pssession file-server #Most Important
get-process
get-help about_remote -ShowWindow
Running a remote command
invoke-command -computername file-server { get-process }
Run remote command multiple machines
invoke-command -computername file-server, workstation2, Domain-controll { get-process }
invoke-command -computername file-server, workstation2, Domain-controll { get-process } -asjob
Receive-Job job4
Semi-Persistent Session
========================
$s1= New-PSSession -ComputerName file-server 
Invoke-Command -session $s1 {hostname}
```
---

# Manipulating Registry Keys
```powershell
#When computer boots
HKLM\SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION\RUN
Get-Item HKLM:\SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION\RUN 

#User logs in		
HKCU\SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION\RUN
Get-Item HKCU:\SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION\RUN
		
#Single Run when computer boots
HKLM\SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION\RUNONCE
Get-Item HKLM:\SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION\RUNONCE

#Creates a new sub key in Trusted Documents for document.doc 		
New-Item "HKLM:\Software\Microsoft\Office\14.0\Security\Trusted Documents\TrustRecords" -Force

#creates a new
New-ItemProperty "HKLM:\Software\Microsoft\Office\14.0\Security\Trusted Documents\TrustRecords" -Name "%USERPROFILE%Downloads test-document.doc" -PropertyType Binary -Value ([byte[]](0x30,0x31,0xFF)) 

#creates new prop   
New-ItemProperty HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run -Name Test -PropertyType String -Value C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe 

#rename property    
Rename-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run -Name SecurityHealth -NewName Test

#set new item property value       
Set-ItemProperty HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run -Name Test -Value Bacon.exe

#remove value associated with the subkey
Remove-ItemProperty -Path "HKLM:\Software\Microsoft\Office\14.0\Security\Trusted Documents\TrustRecords" -Name "%USERPROFILE%Downloads/test-document.doc"
```
# SEARCHING BASED ON ACCOUNT
```powershell
# Define drive HKU: This will allow you to access the keys
New-PSDrive -PSProvider Registry -Name HKU -Root HKEY_USERS
Remove-PSDrive HKU # Now you can use HKU:\... path

#Shorcut to the HKLM run key
New-PSDrive -Name HKLM-Run -PSProvider Registry -Root HKEY_Local_Machine\SOFTWARE\Microsoft\Windows\CurrentVersion\Run

#maps a drive to the system internal tools with the variable
[String]$WebDAVShare = '\\live.sysinternals.com\Tools'
New-PSDrive -Name S -PSProvider FileSystem -Root $WebDAVShare
cd S:

#shows all users and associated sids
cd HKLM-Run:
Get-LocalUser | Select-Object name,sid

#how to query the value for a specific User
Get-Item HKU:\S-1-5-21-2881336348-3190591231-4063445930-1003\Software\Microsoft\Windows\CurrentVersion\Run
Get-Item HKU:\S-1-5-21-2881336348-3190591231-4063445930-1003\Software\Microsoft\Windows\CurrentVersion\RunOnce
```
---
# OTHER/FORENSICS
```powershell
#USB
Get-Item 'HKLM:\SYSTEM\CurrentControlSet\Enum\USBSTOR\'
#PROFILES suspicious
Get-ChildItem 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList'

#Networks
Get-ChildItem 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\NetworkList\Profiles'	

#MRU	
Get-ChildItem 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\OpenSavePidlMRU'

#index of search by sid		
Get-ChildItem 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList'
Get-ChildItem 'HKCU:\Software\Microsoft\Windows Search\ProcessedSearchRoots'

#recent file search	
Get-ChildItem 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Search'
```
---

