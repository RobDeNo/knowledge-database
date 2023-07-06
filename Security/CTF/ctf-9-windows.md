Donovian Windows Privilege Escalation (DWP)
XX Jan 2027
Start Time: 1300
Duration: 4 hours

Type of Operation: Cyberspace Exploitation (C-E)

Objective: Maneuver into the Donovian internal network, gain privileged access to discovered Windows host.

Tools/Techniques: SSH and RDP masquerade into internal network with provided credentials. Ports in use will be dependent on target location and are subject to change. Windows techniques to gain privileged access such as DLL hijack, UAC bypass through weak paths, permissions, and tasks. Network scanning tools/technique usage is at the discretion of student.

Scenario Credentials: FLAG = 3@SYw1nd0w55t@rt0F@ct1v1ty

Prior Approvals: DLL hijack and UAC bypass, restarting of services through host reboot. Host survey utilizing native command shells, which shell is at discretion of student.

Scheme of Maneuver:
>Jump Box
->Pivot: 192.168.28.105
-->T1: 192.168.28.5

Target Section:

Pivot
Hostname: ftp.site.donovia
IP: 192.168.28.105
OS: Ubuntu 18.04
Creds: comrade :: StudentReconPassword
Last Known SSH Port: 2222
Malware: none
Action: Perform SSH masquerade and redirect to the next target. No survey required, cohabitation with known PSP approved.

T1
Hostname: donovian-windows-private
IP: 192.168.28.5
OS: Windows ver: Unknown
Creds: comrade :: StudentPrivPassword
Last Known Ports: 3389
PSP: unknown
Malware: unknown
Action: Test supplied credentials, if possible gain access to host. Conduct host survey and gain privileged access.

https://www.the-art-of-web.com/system/rsyslog-config/
```shell

ssh student@10.50.39.150 -L 10300:192.168.28.105:2222
ssh -p 10300 comrade@localhost -L 10301:192.168.28.5:3389
xfreerdp /u:comrade /v:localhost:10301 /dyanmic-resolution +clipboard
