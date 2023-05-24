#Dependant thing to consider

#add the HKU Drive
#New-PSDrive -PSProvider Registry -Name HKU -Root HKEY_USERS
$forensic ="HKLM:\SYSTEM\CurrentControlSet\Enum\USBSTOR\",
"HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList", 
"HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\NetworkList\Profiles",
"HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\OpenSavePidlMRU",
"HKCU:\Software\Microsoft\Windows Search\ProcessedSearchRoots",
"HKCU:\Software\Microsoft\Windows\CurrentVersion\Search"
$sid = Get-LocalUser | Select-Object -ExpandProperty sid #This store the variable for obtaining the user's SIDs
$check = "HKLM:\SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION\RUN",
"HKLM:\SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION\RunOnce"

Write-Host "`n"
Write-Host "Now Checking Forensic Keys`n
==================================================================" -F GREEN
foreach ($forpath in $forensic)
    {Get-ChildItem -path $forpath
    Get-Item -path $forpath 
        foreach($forkey in $forpath){
            Get-ItemProperty -path $forkey
            }
Write-Host "
==================================================================" -F green                
    }
Write-Host " USBTOR = Looking for strange USB devices connected to the computer`n "-F green 
Write-Host " PROFILELIST = Looking for suspicious profiles on the computer`n "-F green 
Write-Host " NETWORKLIST\PROFILES = strange network names last connected too`n"-F green 
Write-Host " ProcessedSearchRoots = Index search queries by each sids`n"-F green 
Write-Host " SEARCH = Recent file search on the computer`n"-F green 
##############################################################################################
#RUN and RUNONCE Registry check
Write-Host "`n"
Write-Host "Now checking Registry Keys `n
==================================================================" -F green
foreach ($path in $check)
    {Get-ChildItem -path $path
    Get-Item -path $path 
        foreach($key in $path){
            Get-ItemProperty -path $key
            }
Write-Host "
==================================================================" -F Red                
    }


Write-Host "`n" #this creates a new line to seperate commands
Write-Host "Now Getting SIDS and User Profiles `n
==================================================================" -F green #this creates another line just stating what the below commands are for in the output
Get-ChildItem 'HKLM:\Software\Microsoft\Windows NT\CurrentVersion\ProfileList' | ForEach-Object { $_.GetValue('ProfileImagePath') }
#this is going to print the current profile lists of the users on the system
foreach ($usersid in $sid)
{
    Get-LocalUser | Select-Object Name,sid |Select-String $usersid
    Get-Item -ErrorAction SilentlyContinue "HKU:\${usersid}\Software\Microsoft\Windows\CurrentVersion\Run"
    Get-ChildItem -ErrorAction SilentlyContinue "HKU:\${usersid}\Software\Microsoft\Windows\CurrentVersion\Run"
    Get-ItemProperty -ErrorAction SilentlyContinue "HKU:\${usersid}\Software\Microsoft\Windows\CurrentVersion\Run"
    Write-Host "
==================================================================" -F Red  
}
foreach ($usersid in $sid)
    Get-Item -ErrorAction SilentlyContinue "HKU:\${usersid}\Software\Microsoft\Windows\CurrentVersion\RunOnce"
    Get-ChildItem -ErrorAction SilentlyContinue "HKU:\${usersid}\Software\Microsoft\Windows\CurrentVersion\Run"
    Get-ItemProperty -ErrorAction SilentlyContinue "HKU:\${usersid}\Software\Microsoft\Windows\CurrentVersion\RunOnce"
Get-LocalUser | Select-Object Name,sid






