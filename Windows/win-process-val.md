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
```
# View Scheduled tasklist
```powershell
#view all properties of first schd task
Get-ScheduledTask | Select-object * | select-object -First -L
```
# Autorun Registry


