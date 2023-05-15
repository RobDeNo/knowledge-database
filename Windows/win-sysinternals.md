# Adding sysinternals to drive
```cli
net use * http://live.sysinternals.com
```
```powershell
New-PSDrive -name "SysInt" -PSProvider Filesystem -Root "\\live.sysinternals.com\Tool"
Get-PSDrive
echo $env:path #this will view the path
$env:path="C:\.....;Z:\"
$env:path="(env:path);z:\"
```
# Tools in sys in
PROCMON
- Interitive look with detailed

start0864
start4597
# sysinternals
1. AUTORUNS - Autoruns shows applications automatically started on during system boot or login as well as the Registry and file system locations for auto-start configurations. Examples: AppInit, Winlogon, Scheduled Tasks, Services, Logon, etc.
2. 
    1. Sysinternals Introduction
    2. Procmon
    3. Autoruns -check registry locations
    4. Procexp -investigate processes
    5. TCPView -investigate netowkr stuff
    6. PsExec
    7. PsLoggedon
    8. LogonSessiosn
    9. PsList
    10. PsInfo
    11. Strings
    12. Handle
   handle -p process_name
    13. AccessChk spoolsv.exe
- This is how you see the read and write permissions
```powershell
  RW NT SERVICE\TrustedInstaller
  R  BUILTIN\Administrators
  R  NT AUTHORITY\SYSTEM
  R  BUILTIN\Users
  R  APPLICATION PACKAGE AUTHORITY\ALL APPLICATION PACKAGES
  R  APPLICATION PACKAGE AUTHORITY\ALL RESTRICTED APPLICATION PACKAGES
  ```
    1.  LoadOrder - shows service load order LoadOrd.exe
    2.   ListDLLs -reports .dlls loaded into processes?
    3.   sigcheck - view files manifest, invoker level
    References
# RDP via powershell
    ```powershell
    mstsc /v:10.10.0.5
    ```
#Windows Firewall Profiles
```powershell
Get-NetFirewallProfile
```
# Determining MEchanism for parent programs
- using proc explorer, hovver over the process to see hidden attributes
- 


