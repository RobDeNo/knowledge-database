# Intro to Memory Forensics
1. two types of Memory  
   1. Volatile - persistant
   2. Non- Volatile -non-persistant
# Order of Volatility
1. CPU registers, cache
2. Routing table, ARP cache, process table, kernel stats, memory - mapping of all ip addresses to mac address
3. Temporary file systems
4. Disk
5. Remote logging and monitoring data
6. Physical configuration, network topology
7. Archival media - backups
5ghz = 5 Billion Cycle
Raid 0 - Stripping
Raid 1 - Mirror across multiple drives
Raid 5 - (3 disks) A DISK B DISK A^B DISK   
    - either disk loss can be recovered
    - perity bot moves around between drives for recovery of all
Raid 6 -
Raid 10 - A, B, A, B
Raid 50 - A B, AxB, C, D, CxD
Raid 60 - A B, AxB, C, D, CxD
Best = Software Raid

```shell 
arp -a
vol --help
Set-Alias -Name vol -Value C:\Users\andy.dwyer\Desktop\Memory_Analysis\volatility_2.6_win64_standalone.exe
vol -f .\cridex.vmem imageinfo
PS C:\Users\andy.dwyer\Desktop\Memory_Analysis> vol -f .\cridex.vmem imageinfo
Volatility Foundation Volatility Framework 2.6
INFO    : volatility.debug    : Determining profile based on KDBG search...
          Suggestedhatischao Profile(s) : WinXPSP2x86, WinXPSP3x86 (Instantiated with WinXPSP2x86)
                     AS Layer1 : IA32PagedMemoryPae (Kernel AS)
                     AS Layer2 : FileAddressSpace (C:\Users\andy.dwyer\Desktop\Memory_Analysis\cridex.vmem)
                      PAE type : PAE
                           DTB : 0x2fe000L
                          KDBG : 0x80545ae0L
          Number of Processors : 1
     Image Type (Service Pack) : 3
                KPCR for CPU 0 : 0xffdff000L
             KUSER_SHARED_DATA : 0xffdf0000L
           Image date and time : 2012-07-22 02:45:08 UTC+0000
     Image local date and time : 2012-07-21 22:45:08 -0400

#Scan the memory architechture, to detect which operating system it is coming from
#All OS's store memory in a different way

vol -f ".\cridex.vmem" --profile=WinXPSP2x86 -h 

```
- PS table 
- Sections of memory allocated to processes
- hidden process doesn't show in ps table. RootKit
- RAM not in process table
- Terminated process not in process table
----------------------------------------------------------------------------------------------------------
# Using Volatility/Plugins
```shell
#download notepadd++
invoke-webrequest -uri "https://github.com/notepad-plus-plus/notepad-plus-plus/releases/download/v7.8.8/npp.7.8.8.Installer.x64.exe" -outfile "C:\npp.7.8.8.Installer.x64.exe" 
cd C:\ 
start-process npp.7.8.8.Installer.x64.exe -ArgumentList '/S' 

#PSLIST

vol -f ".\cridex.vmem" --profile=WinXPSP2x86 pslist 
Offset(V)  Name                    PID   PPID   Thds     Hnds   Sess  Wow64 Start                          Exit
---------- -------------------- ------ ------ ------ -------- ------ ------ ------------------------------ ------------------------------
0x823c89c8 System                    4      0     53      240 ------      0
0x822f1020 smss.exe                368      4      3       19 ------      0 2012-07-22 02:42:31 UTC+0000
0x822a0598 csrss.exe               584    368      9      326      0      0 2012-07-22 02:42:32 UTC+0000
0x82298700 winlogon.exe            608    368     23      519      0      0 2012-07-22 02:42:32 UTC+0000
---trunct-----

# PSTREE Plugins

PS C:\Users\andy.dwyer\Desktop\Memory Analysis> .\volatility_2.6_win64_standalone.exe -f ".\cridex.vmem" --profile=WinXPSP2x86 pstree 
Name                                                  Pid   PPid   Thds   Hnds Time
-------------------------------------------------- ------ ------ ------ ------ ----
 0x823c89c8:System                                      4      0     53    240 1970-01-01 00:00:00 UTC+0000
. 0x822f1020:smss.exe                                 368      4      3     19 2012-07-22 02:42:31 UTC+0000
.. 0x82298700:winlogon.exe                            608    368     23    519 2012-07-22 02:42:32 UTC+0000
... 0x81e2ab28:services.exe                           652    608     16    243 2012-07-22 02:42:32 UTC+0000
.... 0x821dfda0:svchost.exe                          1056    652      5     60 2012-07-22 02:42:33 UTC+0000
.... 0x81eb17b8:spoolsv.exe                          1512    652     14    113 2012-07-22 02:42:36 UTC+0000
.... 0x81e29ab8:svchost.exe                           908    652      9    226 2012-07-22 02:42:33 UTC+0000

#PSSCAN Plugins

vol -f ".\cridex.vmem" --profile=WinXPSP2x86 psscan 
Offset(P)          Name                PID   PPID PDB        Time created                   Time exited
------------------ ---------------- ------ ------ ---------- ------------------------------ ------------------------------
0x0000000002029ab8 svchost.exe         908    652 0x079400e0 2012-07-22 02:42:33 UTC+0000
0x000000000202a3b8 lsass.exe           664    608 0x079400a0 2012-07-22 02:42:32 UTC+0000
0x000000000202ab28 services.exe        652    608 0x07940080 2012-07-22 02:42:32 UTC+0000
0x000000000207bda0 reader_sl.exe      1640   1484 0x079401e0 2012-07-22 02:42:36 UTC+0000
0x00000000020b17b8 spoolsv.exe        1512    652 0x079401c0 2012-07-22 02:42:36 UTC+0000
0x000000000225bda0 wuauclt.exe        1588   1004 0x07940200 2012-07-22 02:44:01 UTC+0000

#PROCDUMP

#Disable Detection
Set-MpPreference -ExclusionPath 'C:\Users\andy.dwyer\Desktop\Memory_Analysis\' 
#pull out data from memory location for further analysis. you can use sysinternals or notepadd++
vol -f .\cridex.vmem --profile=WinXPSP2x86 procdump -p 1640 -d .
```
IP Address or Domain Name
Does it have an IP address or domain name in the binary!?!?!?!
Use Strings
```powershell
strings -accepteula .\executable.1640.exe >> strings1.exe
# this didn't work, now look at the connections Plugins
vol -f .\cridex.vmem --profile=WinXPSP2x86 procdump -p 1640 -d .
vol -f .\cridex.vmem --profile=WinXPSP2x86 pslist
vol -f .\cridex.vmem --profile=WinXPSP2x86 conscan

```