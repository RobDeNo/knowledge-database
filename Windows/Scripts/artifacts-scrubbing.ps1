#Dependant thing to consider

#add the HKU Drive
#New-PSDrive -PSProvider Registry -Name HKU -Root HKEY_USERS
$sid = Get-LocalUser | Select-Object -ExpandProperty sid #This store the variable for obtaining the user's SIDs
$artifacts ="HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\UserAssist\{CEBFF5CD-ACE2-4F4F-9178-9926F41749EA}\Count",
"HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\UserAssist\{F4E57C4B-2036-45F0-A9AB-443BCFE33D9F}\Count"

Write-Host "`n"
Write-Host "UserAssist Settings per FILE TYPE
==================================================================" -F green 
foreach ($artpath in $artifacts)
    {Get-ChildItem -path $artpath
    Get-Item -path $artpath 
        foreach($artkey in $artpath){
            Get-ItemProperty -path $artkey
            }             
    }
Write-Host " CEBFF5CD: Executable File Execution`n "-F green 
Write-Host " #F4E57C4B: Shortcut File Execution`n "-F green 

Write-Host "UserAssist Settings per FILE TYPE
==================================================================" -F green 
Write-Host "`n `n `n `n `n "
Write-Host "UserAssist Settings PER SID/USER
==================================================================" -F green  
foreach ($usersid in $sid)
{
    Get-Item -ErrorAction SilentlyContinue "HKU:\${usersid}\Software\Microsoft\Windows\CurrentVersion\Explorer\UserAssist\{CEBFF5CD-ACE2-4F4F-9178-9926F41749EA}\Count"
    Get-ChildItem -ErrorAction SilentlyContinue "HKU:\${usersid}\Software\Microsoft\Windows\CurrentVersion\Explorer\UserAssist\{CEBFF5CD-ACE2-4F4F-9178-9926F41749EA}\Count"
    Get-ItemProperty -ErrorAction SilentlyContinue "HKU:\${usersid}\Software\Microsoft\Windows\CurrentVersion\Explorer\UserAssist\{CEBFF5CD-ACE2-4F4F-9178-9926F41749EA}\Count"
}
Write-Host "UserAssist Settings PER SID/USER 
==================================================================" -F green 
Write-Host "`n `n `n `n `n "
Write-Host "BAM settings, control background applications (1809 or newer)
==================================================================" -F green  
foreach ($usersid in $sid)
{
    Get-Item -ErrorAction SilentlyContinue "HKLM:\SYSTEM\CurrentControlSet\Services\bam\state\UserSettings\${usersid}"
    Get-ChildItem -ErrorAction SilentlyContinue "HKLM:\SYSTEM\CurrentControlSet\Services\bam\state\UserSettings\${usersid}"
    Get-ItemProperty -ErrorAction SilentlyContinue "HKLM:\SYSTEM\CurrentControlSet\Services\bam\state\UserSettings\${usersid}"
}
Write-Host "BAM settings, control background applications (1809 or newer)
==================================================================" -F green  
Write-Host "`n `n `n `n `n "
Write-Host "BAM settings, control background applications (1803 and below or newer)
==================================================================" -F green  
foreach ($usersid in $sid)
{
    Get-Item -ErrorAction SilentlyContinue "HKLM:\SYSTEM\CurrentControlSet\Services\bam\UserSettings\${usersid}"
    Get-ChildItem -ErrorAction SilentlyContinue "HKLM:\SYSTEM\CurrentControlSet\Services\bam\UserSettings\${usersid}"
    Get-ItemProperty -ErrorAction SilentlyContinue "HKLM:\SYSTEM\CurrentControlSet\Services\bam\UserSettings\${usersid}"
}
Write-Host "BAM settings, control background applications (1803 and below or newer)
==================================================================" -F green  
Write-Host "`n `n `n `n `n "
Write-Host "Recyling Bin Artifacts
==================================================================" -F green  
Get-Childitem 'C:\$RECYCLE.BIN' -Recurse -Verbose -Force | select FullName
foreach ($usersid in $sid)
{
    Get-Content -ErrorAction SilentlyContinue "C:\$RECYCLE.BIN\${usersid}\$R*"
}
Write-Host "Recyling Bin Artifacts
==================================================================" -F green  
