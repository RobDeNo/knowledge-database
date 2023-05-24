#Dependant thing to consider

#add the HKU Drive
#New-PSDrive -PSProvider Registry -Name HKU -Root HKEY_USERS
$forensic ="HKLM:\SYSTEM\CurrentControlSet\Enum\USBSTOR\",
"HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList", 
"HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\NetworkList\Profiles",
"HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\OpenSavePidlMRU",
"HKCU:\Software\Microsoft\Windows Search\ProcessedSearchRoots",
"HKCU:\Software\Microsoft\Windows\CurrentVersion\Search"
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