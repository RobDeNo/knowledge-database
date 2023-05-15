# Windows Process Validity
1. recon enviormenet and get a baseline
2. hides in the below
   1. processes
   2. files registry
   3. drivers
   4. etc
# OCO Offensive Operations
- protect tools, find other malware
# DOC Defensive Operations
- find malware
# View Processes and DLLs
```powershell
Get-Process 
# view process sort them by PID
Get-Process | Sort -Property Id | More #NPM(Non paged memory) #PM(Paging Memory)#WK(Working Stack)#SI(Session ID)
#Find process by name
Get-Process | Select-object name, id, Description | Sort-object -Property Id | more
#Find specific 
Get-Process SMSS, CSRSS, LSASS | Sort-object -Property Id
#View modules/DLLs used by defined PROCESS and their file location
Get-Process chrome | ForEach {$a} {$_.module} | more
Get-process -Name "*chrome" | Select-object -ExpandProperty Modules | More
    #go through each chrome process that were just grabbed and find the modules associated with it
tasklist
#View only modules/DLLs used by Chrome with "chrome" in the name and their file locations.
Get-Process chrome | foreach {$a} {$_.modules} | Where-Object ModuleName -like '*chrome*' | more
Get-Process -Name "*chrome*" | Select-Object -ExpandProperty Modules | Where-Object ModuleName -like '*chrome*' | more
ft -wrap
#DLL of the process name
 Get-Process -name "winlogon" | Select-Object -ExpandProperty Modules
#Find the parent process id PPID that spawned something via WMI framwork
Get-ciminstance win32_process
Get-ciminstance win32_process | Get-Member
Get-CimInstance win32_process | Select-object name, ProcessID, ParentProcessID | Sort-object ProcessID
```
# Service validation
```powershell
Get-ciminstance
Get-Service
Get-service | Where-object {$_.name -eq "match}
Get-Service ALG | format-list *
Get-Service mpssvc #windows firewall
Get-Service Legit
```
# View Scheduled tasklist
```powershell
#view all properties of first schd task
Get-ScheduledTask | Select-object * | select-object -First -L
```
# Autorun Registry
#Registry Keys Location connected with services
HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run
HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce
HKLM\SYSTEM\CurrentControlSet\Services
#User Individual Hives

#Network Connection validation

# UAC Values
```powershell
HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System
Get-item HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies
```powershell
sigcheck -m schtasks.exe
Get-NetTCPConnection -state Established
```
```cli
netstat
# -a displays all connection and listening ports
# -n disaplys addresses and ports number in numeral format
# -o displays the owning process (PID) associated with each connection
# -b Displays the executable involved in creating each connection (must have admin right)
netstat /? #show netstat help
netstat -anob | more
```
# Abnoraml Thing
1. misspelling
2. System Process run from C:\Windows\System32
3. Third party processes 
4. chrome runs from C:\Program Files
5. no more than one LSASS and SMSS
6. compromised or hijacked DLLs
# Run Execution Level
 level='asInvoker': The application runs at the same permission level as the process that started it. You can elevate the application to a higher permission level by selecting Run as Administrator.

level='highestAvailable': The application runs at the highest permission level that it can. If the user who starts the application is a member of the Administrators group, this option is the same as level='requireAdministrator'. If the highest available permission level is higher than the level of the opening process, the system prompts for credentials.

level='requireAdministrator': The application runs using administrator permissions. The user who starts the application must be a member of the Administrators group. If the opening process isn't running with administrative permissions, the system prompts for credentials.


