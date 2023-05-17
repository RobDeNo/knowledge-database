PS C:\Windows\System32> Get-Content .\artifacts.ps1
###
#---- 1. Initial machine setup enables SHH, Kills Windows Updates and Windows De
fender
###
$ErrorActionPreference = 'SilentlyContinue'

#---- 1.1 Turn off Firewall
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False
Set-NetFirewallRule -DisplayGroup "Network Discovery" -Enabled True
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Force

#---- 1.2 Enable SSH
Write-Host "Open SSH"
[Net.ServicePointManager]::SecurityProtocol = "Tls12"
Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0
Add-WindowsCapability -Online -Name OpenSSH.Client~~~~0.0.1.0
Start-Service sshd
Set-Service -Name sshd -StartupType 'Automatic'

#----1.3 Renames Computer
Rename-computer -newname "Workstation2"

#---- 1.4 Disable RDP
set-itemproperty 'HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\' -Name
 fDenyTSConnections -Value

#---- 1.5 Disable Windows Updates
(Get-WmiObject Win32_Service -Filter 'Name="wuauserv"').ChangeStartMode("Disable
d")
(Get-WmiObject Win32_Service -Filter 'Name="wuauserv"').StopService()
New-Item "HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" -Force
New-Itemproperty "HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" -N
ame "NoAutoUpdate" -PropertyType DWORD -Value "1"

#---- 1.6 Turn off Windows Defender
New-Item -path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Pro
tection'
New-ItemProperty -path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Real-
Time Protection'-Name 'DisableRealtimeMonitoring' -Type Dword -Value 1
#set-ItemProperty -Path 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Policie
s\System' -name "dontdisplaylastusername" -Value 1
Set-MpPreference -DisableRealtimeMonitoring $true
New-Itemproperty "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender" -Name "Dis
ableAntiSpyware" -PropertyType DWORD -Value "1"

#---- 1.7 Copy Downloaded files downloaded from git to where they need to go.
Copy-Item -Path 'C:\windows\system32\Ps1_To_Exe.exe'  -Destination 'C:\windows\t
emp\Ps1_To_Exe.exe'
Copy-Item -Path 'C:\windows\system32\bad.ps1'  -Destination 'C:\windows\temp\bad
.ps1'
Copy-Item -Path 'C:\windows\system32\I2J5144.txt'  -Destination 'C:\windows\temp
\$I2J5144.txt'
Copy-Item -Path 'C:\windows\system32\R2J5144.txt'  -Destination 'C:\windows\temp
\$R2J5144.txt'

###
#---- 2. CTF Flag Generation
###

#============================
#---- 2.1  Disable Win Defender So all the stuff works
#===========================
Set-MpPreference -DisableScriptScanning $True
Set-MpPreference -DisableRealtimeMonitoring $True
Set-MpPreference -DisableIOAVProtection $True
Set-MpPreference -ExclusionExtension .ps1,.exe

#=================================
#---- 2.2  recent_files
#=================================
New-Item HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\ -N
ame ".txt" -ItemType Directory -ErrorAction SilentlyContinue -Force
New-ItemProperty HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Recent
Docs\.txt -Name "6"-PropertyType Binary -Value ([System.Text.Encoding]::Unicode.
GetBytes("C:\Users\$env:username\Documents\3-14-24.txt")) -Force -ErrorAction Si
lentlyContinue
New-Item -Path C:\Users\$env:username\Documents\3-14-24.txt -ItemType "file" -Va
lue "Name    SSNPhone Number
Smith, Bob G.   6 6 7 - 2 7 - 3 7 6 7          1 8 6 - 5 2 3 - 9 4 3 7
Washington, Jermaine K.     2 2 7 - 4 4 - 6 6 2 9          8 4 6 - 2 9 7 - 7 4 5
 6
Wolf, Winston W.3 8 8 - 6 6 - 3 8 5 6          2 9 5 - 7 6 1 - 1 5 6 8
Prescott, Kelly A.          4 6 5 - 4 9 - 1 3 6 5          4 9 4 - 1 9 7 - 3 4 9
 4
Flag, Found A.  1 1 4 - 3 4 - 2 5 4 7          4 8 3 - 5 1 4 - 9 4 3 1
Scott, Latoya P.1 8 5 - 1 7 - 6 8 7 7          4 3 5 - 4 5 5 - 3 8 3 6
Baker, Falicity M.          6 1 6 - 9 7 - 5 9 6 3          8 2 5 - 9 8 9 - 5 9 6
 4
Townes, Brian H.6 8 4 - 3 3 - 8 5 8 7          5 8 3 - 4 4 7 - 1 4 4 2
Young, James T. 9 5 9 - 5 1 - 3 8 7 9          1 9 6 - 8 3 7 - 8 4 2 6
Wallace, William W.         1 8 3 - 1 5 - 4 3 4 1          1 7 8 - 3 5 6 - 5 3 3
 3
Fitzgerald, Benton T.       4 6 1 - 5 3 - 6 2 7 7          5 3 3 - 4 4 7 - 6 6 5
 4" -ErrorAction SilentlyContinue


# ===============================================
#---- 2.3  bam
# ================================================
# To complete this challenge, enter the full path of the program that was run on
 this computer from an abnormal location. +
# New-Item -ItemType Directory -Path "C:\Windows\system32\" -Name "is-IS"
##Invoke-WebRequest -uri "10.50.0.1:8080/class/workstation2/Ps1_To_Exe.exe" -out
file "C:\windows\temp\Ps1_To_Exe.exe"
##Invoke-WebRequest -uri "10.50.0.1:8080/class/workstation2/bad.ps1" -outfile "C
:\windows\temp\bad.ps1"
## Fucking Janky, doesn't work 100% of the time.
<#
C:\windows\temp\Ps1_To_Exe.exe /ps1 C:\windows\temp\bad.ps1 /exe C:\windows\temp
\bad_intentions.exe
start-sleep 5
Start-Process C:\windows\temp\bad_intentions.exe
start-sleep 5
(get-process bad_intentions).kill()
#>
#New Trail Code
$sid = (get-localuser | select name, sid | where {$_.name -eq "student"}).sid.va
lue
New-ItemProperty -Path HKLM:\SYSTEM\CurrentControlSet\Services\bam\UserSettings\
$sid\ -Name "C:\Windows\Temp\bad_intentions.exe" -Value Stuff
New-ItemProperty -Path HKLM:\SYSTEM\CurrentControlSet\Services\bam\UserSettings\
$sid\ -Name "\Device\HarddiskVolume1\Windows\Temp\bad_intentions.exe" -Value Sto
of

# This directory gets created successfully
# To complete this challenge, enter the full name of the questionable file in th
e prefetch folder. +
New-Item -ItemType Directory -Path "C:\" -Name "gyao" -ErrorAction SilentlyConti
nue | out-null


# ================================================
#---- 2.4  prefetch_1
# ================================================
#Legacy Code. Doesn't work consistently
<#
copy-item C:\windows\temp\bad_intentions.exe "C:\gyao\IMIGHTBEQUESTIONABLE.exe"
-ErrorAction SilentlyContinue
start-process C:\gyao\IMIGHTBEQUESTIONABLE.exe
start-sleep 2
#(get-process IMIGHTBEQUESTIONABLE*).kill()
#>
New-Item -ItemType File -Path "C:\Windows\Prefetch\BAD_INTENTIONS.EXE-8F2806FC.p
f"
New-Item -ItemType File -Path "C:\Windows\Prefetch\DARK_FORCES-8F2869FC.pf"

# ==============
#---- 2.5  recycle_bin_1,2,3
# ==============
#Legacy Code. Doesn't work consistently
<#
$user = $env:username
$sid = (get-localuser | select name, sid | where {$_.name -eq "student"}).sid.va
lue
$path1 = '$Recycle.Bin'
$path2 = "$sid"
$pathI = '$I2J5144.txt'
$pathR = '$R2J5144.txt'
#This moves the saved files from a default location of system32 to andy.dwyers r
ecycle bin
move-item 'C:\Windows\system32\$R2J5144.txt' "C:\$path1\$path2\$pathR" -ErrorAct
ion SilentlyContinue | out-null
move-item 'C:\Windows\system32\$I2J5144.txt' "C:\$path1\$path2\$pathI" -ErrorAct
ion SilentlyContinue | out-null
#>
#Test Recycle Bin
New-Item -ItemType File -Path C:\Users\student\Documents\file.txt
Add-Content -Value "DontTrashMeyo" -Path C:\Users\student\Documents\file.txt
$sh = new-object -comobject "Shell.Application"
$ns = $sh.Namespace(0).ParseName('C:\Users\student\Documents\file.txt')
$ns.InvokeVerb("delete")

$sh = new-object -comobject "Shell.Application"
$ns = $sh.Namespace(0).ParseName('C:\windows\temp\$I2J5144.txt')
$ns.InvokeVerb("delete")

$sh = new-object -comobject "Shell.Application"
$ns = $sh.Namespace(0).ParseName('C:\windows\temp\$R2J5144.txt')
$ns.InvokeVerb("delete")

$deletedfiles=@("Sugar.txt","Spice.txt","Everything_Nice.txt","Blood_for_the_Blo
od_God.txt","Skulls_For_The_SkullThrone.exe","Mo_bamba.mp3","False_Testimony.doc
x","Pinkguy.gif","Trap_Dumplings.aac","Introspective_Voice")
$deletedfiles | ForEach-Object -Process {
    New-Item -ItemType File -Path C:\Users\student\Documents\$_
    Add-Content -Value "I'm trash bro" -Path C:\Users\student\Documents\$_
    $sh = new-object -comobject "Shell.Application"
    $ns = $sh.Namespace(0).ParseName("C:\Users\student\Documents\$_")
    $ns.InvokeVerb("delete")
}

# ====================
#---- 2.6    jump_lists
# ====================
#Legacy Code. Doesn't work consistently
<#
Start-Process notepad.exe
Start-Sleep -Milliseconds 500
[System.Windows.Forms.SendKeys]::SendWait({%fo})
Start-Sleep -Milliseconds 500
[System.Windows.Forms.SendKeys]::SendWait("C:\users\$env:username\Documents\UIDP
WD.txt")
Start-Sleep -Milliseconds 500
[System.Windows.Forms.SendKeys]::SendWait({~})
Start-Sleep -Milliseconds 500
[System.Windows.Forms.SendKeys]::SendWait({%fs})
Start-Sleep -Milliseconds 500
[System.Windows.Forms.SendKeys]::SendWait({%fx})
start-sleep 10
#>

Write-Output "Use my file name, I allow privilege escalation." > "C:\users\stude
nt\Documents\UIDPWD.txt" -ErrorAction SilentlyContinue -Force
# Creates a Here Document and populates the current user's prefetch directory wi
th a simulated prefetch file
$jump=@"
7Â¼ÂÅ¾"Ã‘Â«ÃˆWjÃ«ÂªvÃ·Ã»Â
0Â
                     U s e r s    h 1
  student L      Ã¯Â¾        .                             student    \ 1
      Documents D
          Ã¯Â¾        .                             D o c u3
                                            
 Ã¿Ã¿Ã¿Ã¿Ã¿Ã¿Ã¿Ã¿Ã¿Ã¿Ã¿Ã¿                                    "   #

            Ã¿Ã¿Ã¿Ã¿Ã¿Ã¿Ã¿Ã¿Ã¿Ã¿Ã¿Ã¿

                      Ã¿Ã¿Ã¿Ã¿Ã¿Ã¿Ã¿Ã¿Ã¿Ã¿Ã¿Ã¿

                                Ã¿Ã¿Ã¿Ã¿Ã¿Ã¿Ã¿Ã¿Ã¿Ã¿Ã¿Ã¿
                         m e n t s    ` 2 d   LR

  UIDPWD.txt  F          Ã¯Â¾LRÃ—LR
                                   .LR ÃšÃ‚                 Â¥â€¦Ã¶ U I D
                                      .   ÃšÃ‚                 Â¥â€¦Ã¶ U I D 
P W D . t x t   �   \            /       [   
    gÂ¢   OS C:\users\student\Documents\UIDPWD.txt  `     Â X       Worksta
tion_2   F|Â´QzÃ‘QMâ€¢
"@

$path="C:\Users\student\AppData\Roaming\Microsoft\Windows\Recent\AutomaticDestin
ations"
$file="5f7b5f1e01b81337.automaticDestinations-ms"
New-item -ItemType File -Path $path\$file -Force
for ($num = 1 ; $num -le 6 ; $num++){
    Add-Content -Path $path\$file -Value $jump
}

#===============================================================================
==================
# There is a file that was recently opened that may contain PII. Get the content
s of the file.  +
# Flag, Found A. +
# ** *Get 3-14-24.txt. Make the file hidden and place in the root of the C drive
. Open and save using the GUI.* +
#===============================================================================
==================

# Find the questionable website that the user browsed to that appears to be mali
cious. (Using the Chrome Browser) +
# 10.50.0.1:8080/class/workstation2/Malicious-Flag/ +
# *** *Create a scheduled task to browse to http://10.50.22.9/windows/Malicious-
Flag/ using Chrome.  Delete the task*

#===================
#---- 2.7  browser_artifacts
#===================
#Download and Install Chrome Silently in the background
Invoke-WebRequest -Uri "http://dl.google.com/chrome/install/375.126/chrome_insta
ller.exe" -Outfile "C:\chrome_installer.exe"
Start-Process 'C:\chrome_installer.exe' -ArgumentList "/silent /install"

#While the chrome installer is visible in the tasklist, pause execution of scrip
t.
#Stops race condition when generating flags
$time=0
Get-Process chrome_installer | out-null

while($? -eq $true)
{
    Write-Host "Waited $time seconds for Chrome to Install" | Out-File C:\Instal
l_log.txt
    Start-Sleep 10
    $time=$time + 10
    Get-Process chrome_installer | out-null
}
#Run Chrome.exe and navigate to a website, then wait 60 seconds, finally kill ch
rome to save history.
Start-Process chrome -ArgumentList https://www.exploit-db.com
Start-Sleep 60
(Get-Process chrome).kill()


#======================================================
#---- 2.8 Scheduled Task to create registry keys after reboot (Redundant)
#======================================================
if ((Get-ScheduledTask DzNtz -ErrorAction SilentlyContinue) -eq $null){
    ##Invoke-Webrequest -Uri "10.50.0.1:8080/class/workstation2/regkeys.ps1" -ou
tfile "c:\Windows\System32\regkeys.ps1"
    $A = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-windowsty
le hidden -sta -File C:\Windows\System32\regkeys.ps1"
    $T = New-ScheduledTaskTrigger -AtLogon
    $P = New-ScheduledTaskPrincipal "$env:username" -RunLevel Highest
    $S = New-ScheduledTaskSettingsSet -Hidden
    $D = New-ScheduledTask -Action $A -Principal $P -Trigger $T -Settings $S
    Register-ScheduledTask DzNtz -InputObject $D | out-null
}

#======================================================
#---- 2.9 Initially Create Registry Keys
#======================================================

# wireless_networks
function netprofile
 {$loc= $(gci "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\NetworkList\Pr
ofiles" | Select-Object Name)
  $loc= $loc[0]-replace("HKEY_LOCAL_MACHINE","HKLM:") | % {$_-replace("@{name=",
"")} | % {$_-replace("}}","}")}
  cd $loc
  $loc= $(pwd)
  set-ItemProperty -path $loc -name "ProfileName" -value "Terror_cafe_network" -
Force
}


#user_accounts
function newuser {$userkey= $(get-childitem -path "HKLM:\SOFTWARE\Microsoft\Wind
owsNT\CurrentVersion\ProfileList").name | findstr "1001"
    if (!$userkey)
        {$userkey= $(get-childitem -path "HKLM:\SOFTWARE\Microsoft\Windows NT\Cu
rrentVersion\ProfileList").name | findstr "1000"
        $userkey= $userkey | % {$_-replace("HKEY_LOCAL_MACHINE","HKLM:")}
        $destkey= $userkey | % {$_-replace("1000","1002")}}
    else
        {$userkey= $userkey | % {$_-replace("HKEY_LOCAL_MACHINE","HKLM:")}
        $destkey= $userkey | % {$_-replace("1001","1002")}}
  copy-item -Path $userkey -Destination $destkey -ErrorAction SilentlyContinue
  Set-ItemProperty -Path $destkey -Name ProfileImagePath -Value "Hacker_McHacker
son"
}

#usb
function usbkey {
    new-item -path "HKLM:\SYSTEM\CurrentControlSet\Enum\USBSTOR\"
    new-itemproperty -path "HKLM:\SYSTEM\CurrentControlSet\Enum\USBSTOR\" -Name
"SanDisk9834" -Value "bad" -Force
}

#persistence_1
function runkey1 {
    new-itemproperty -path "HKLM:\Software\Microsoft\Windows\CurrentVersion\Run"
 -name "Kaspersky" -PropertyType string -value "C:\malware.exe" -Force -ErrorAct
ion SilentlyContinue
}

#persistence_2
function runkey2 {
    new-itemproperty -path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run"
 -name "Symantec" -PropertyType string -value "C:\botnet.exe" -Force -ErrorActio
n SilentlyContinue
}

#persistence_3
function runkey3 {
    new-itemproperty -path "HKLM:\Software\Microsoft\Windows\CurrentVersion\RunO
nce" -name "McAfee" -PropertyType string -value "C:\virus.exe" -Force -ErrorActi
on SilentlyContinue
}

#persistence_4
function runkey4 {
    new-itemproperty -path "HKCU:\Software\Microsoft\Windows\CurrentVersion\RunO
nce" -name "Norton" -PropertyType string -value "C:\worm.exe" -Force -ErrorActio
n SilentlyContinue
}

#Run Registry Functions above in a try / catch block to locate errors$?


try {
    netprofile
    newuser
    usbkey
    runkey1
    runkey2
    runkey3
    runkey4
}
catch {
    $_.ScriptStackTrace | Out-File -FilePath C:\Install_log.txt
    $_.Exception | Out-File -FilePath C:\Install_log.txt
}

New-Variable -name x -Scope global -ErrorAction Stop
$loc= "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\NetworkList\Profiles"
$success1= get-childitem -path $loc | findstr /i "terror"
    if ($success1)
        {$x++; echo "1"}
$success2= get-childitem -path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersi
on\ProfileList" | findstr /i "hack"
    if($success2)
        {$x++; echo "2"}
$success3= get-itemproperty -Path "HKLM:\SYSTEM\CurrentControlSet\Enum\USBSTOR\"
 | findstr /i "sandisk"
    if($success3)
        {$x++; echo "3"}
$success4= get-itemproperty -path "HKLM:\Software\Microsoft\Windows\CurrentVersi
on\Run" | findstr /i "kaspersky"
    if ($success4)
        {$x++; echo "4"}
$success5= get-itemproperty -path "HKCU:\Software\Microsoft\Windows\CurrentVersi
on\Run" | findstr /i "botnet"
    if ($success5)
        {$x++; echo "5"}
$success6= get-itemproperty -path "HKLM:\Software\Microsoft\Windows\CurrentVersi
on\RunOnce" | findstr /i "McAfee"
     if ($success6)
        {$x++; echo "6"}
$success7= get-itemproperty -path "HKCU:\Software\Microsoft\Windows\CurrentVersi
on\RunOnce" | findstr /i "Norton"
    if ($success7)
        {$x++; echo "7"} write-host "$x out of 7 registry changes successful"


clear-history
