# Adding sysinternals to drive
```cli
net use * http://live.sysinternals.com
```
```powershell
New-PSDrive -name "SysInt" -PSProvider Filesystem -Root "\\live.sysinternals.com\Tool"
Get-PSDrive
echo $env:path #this will view the path
$env:path+="Z:\"
$env:path="(env:path);z:\"

net use * http://live.sysinternals.com; Get-PSDrive; New-PSDrive -name "SysInt" -PSProvider Filesystem -Root "\\live.sysinternals.com\Tool"; $env:path+=";Z:\"
```
# Tools in sys in
PROCMON
- Interitive look with detailed

# RDP via powershell
    ```powershell
    mstsc /v:10.10.0.5
    ```
# Windows Firewall Profiles
```powershell
Get-NetFirewallProfile
```
# Determining MEchanism for parent programs
- using proc explorer, hovver over the process to see hidden attributes
# SysInternals Tools
```powershell
#AccessChk - AccessChk is a command-line tool for viewing the effective permissions on files, registry keys, services, processes, kernel objects, and more.
accesschk spoolsv.exe
output
  RW NT SERVICE\TrustedInstaller
  R  BUILTIN\Administrators
  R  NT AUTHORITY\SYSTEM
  R  BUILTIN\Users
  R  APPLICATION PACKAGE AUTHORITY\ALL APPLICATION PACKAGES
  R  APPLICATION PACKAGE AUTHORITY\ALL RESTRICTED APPLICATION PACKAGES
#AccessEnum - This simple yet powerful security tool shows you who has what access to directories, files and Registry keys on your systems. Use it to find holes in your permissions.

#AdExplorer - Active Directory Explorer is an advanced Active Directory (AD) viewer and editor.

#AdInsight - An LDAP (Light-weight Directory Access Protocol) real-time monitoring tool aimed at troubleshooting Active Directory client applications.

#AdRestore - Undelete Server 2003 Active Directory objects.

#Autologon - Bypass password screen during logon.

#Autoruns - See what programs are configured to startup automatically when your system boots and you login. Autoruns also shows you the full list of Registry and file locations where applications can configure auto-start settings.

#BgInfo - This fully-configurable program automatically generates desktop backgrounds that include important information about the system including IP addresses, computer name, network adapters, and more.

#CacheSet - CacheSet is a program that allows you to control the Cache Manager's working set size using functions provided by NT. It's compatible with all versions of NT.

#ClockRes - View the resolution of the system clock, which is also the maximum timer resolution.

#Contig - Wish you could quickly defragment your frequently used files? Use Contig to optimize individual files, or to create new files that are contiguous.

#Coreinfo - Coreinfo is a new command-line utility that shows you the mapping between logical processors and the physical processor, NUMA node, and socket on which they reside, as well as the cache’s assigned to each logical processor.

#Ctrl2cap - This is a kernel-mode driver that demonstrates keyboard input filtering just above the keyboard class driver in order to turn caps-locks into control keys. Filtering at this level allows conversion and hiding of keys before NT even "sees" them. Ctrl2cap also shows how to use NtDisplayString() to print messages to the initialization blue-screen.

#DebugView - Another first from Sysinternals: This program intercepts calls made to DbgPrint by device drivers and OutputDebugString made by Win32 programs. It allows for viewing and recording of debug session output on your local machine or across the Internet without an active debugger.

#Desktops - This new utility enables you to create up to four virtual desktops and to use a tray interface or hotkeys to preview what’s on each desktop and easily switch between them.

#Disk2vhd - Disk2vhd simplifies the migration of physical systems into virtual machines (p2v).

#DiskExt - Display volume disk-mappings.

#Diskmon - This utility captures all hard disk activity or acts like a software disk activity light in your system tray.

#DiskView - Graphical disk sector utility.

#Disk Usage (DU) - View disk usage by directory.

#EFSDump - View information for encrypted files.

#Handle - This handy command-line utility will show you what files are open by which processes, and much more.
handle -p process_name

#Hex2dec - Convert hex numbers to decimal and vice versa.

#Junction - Create Win2K NTFS symbolic links.

#LDMDump - Dump the contents of the Logical Disk Manager's on-disk database, which describes the partitioning of Windows 2000 Dynamic disks.

#ListDLLs - List all the DLLs that are currently loaded, including where they are loaded and their version numbers. Version 2.0 prints the full path names of loaded modules.

#LiveKd - Use Microsoft kernel debuggers to examine a live system.

#LoadOrder - See the order in which devices are loaded on your WinNT/2K system.
LoadOrd.exe example.txt

#LogonSessions - List the active logon sessions on a system.

#MoveFile - Allows you to schedule move and delete commands for the next reboot.

#NTFSInfo - Use NTFSInfo to see detailed information about NTFS volumes, including the size and location of the Master File Table (MFT) and MFT-zone, as well as the sizes of the NTFS meta-data files.

#PageDefrag - Defragment your paging files and Registry hives.

#PendMoves - Enumerate the list of file rename and delete commands that will be executed the next boot.

#PipeList - Displays the named pipes on your system, including the number of maximum instances and active instances for each pipe.

#PortMon- Monitor serial and parallel port activity with this advanced monitoring tool. It knows about all standard serial and parallel IOCTLs and even shows you a portion of the data being sent and received. Version 3.x has powerful new UI enhancements and advanced filtering capabilities.

#ProcDump - This new command-line utility is aimed at capturing process dumps of otherwise difficult to isolate and reproduce CPU spikes. It also serves as a general process dump creation utility and can also monitor and generate process dumps when a process has a hung window or unhandled exception.

#Process Explorer - Find out what files, registry keys and other objects processes have open, which DLLs they have loaded, and more. This uniquely powerful utility will even show you who owns each process.

#Process Monitor - Monitor file system, Registry, process, thread and DLL activity in real-time.

#ProcFeatures - This applet reports processor and Windows support for Physical Address Extensions and No Execute buffer overflow protection.

#PsExec - Execute processes on remote systems.

#PsFile - See what files are opened remotely.

#PsGetSid - Displays the SID of a computer or a user.

#PsInfo - Obtain information about a system.

#PsKill - Terminate local or remote processes.

#PsList - Show information about processes and threads.

#PsLoggedOn - Show users logged on to a system.

#PsLogList - Dump event log records.

#PsPasswd - Changes account passwords.

#PsService - View and control services.

#PsShutdown - Shuts down and optionally reboots a computer.

#PsSuspend - Suspend and resume processes.

#RAMMap - An advanced physical memory usage analysis utility that presents usage information in different ways on its several different tabs.

#RegDelNull - Scan for and delete Registry keys that contain embedded null-characters that are otherwise undeleteable by standard Registry-editing tools.

#RegJump - Jump to the registry path you specify in Regedit.

#RootkitRevealer - Scan your system for rootkit-based malware.

#SDelete - Securely overwrite your sensitive files and cleanse your free space of previously deleted files using this DoD-compliant secure delete program.

#ShareEnum - Scan file shares on your network and view their security settings to close security holes.

#ShellRunas - Launch programs as a different user via a convenient shell context-menu entry.

#Sigcheck - Dump file version information and verify that images on your system are digitally signed.

#Streams - Reveal NTFS alternate streams.

#Strings - Search for ANSI and UNICODE strings in binaryimages.Can also read databse files found in software such as chrome

#Sync - Flush cached data to disk.

#TCPView - Active socket command-line viewer.

#VMMap - VMMap is a process virtual and physical memory analysis utility.

#VolumeId - Set Volume ID of FAT or NTFS drives.

#Whois - See who owns an Internet address.

#WinObj - The ultimate Object Manager namespace viewer is here.

#ZoomIt - Presentation utility for zooming and drawing on the screen.
```

