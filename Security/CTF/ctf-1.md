SITREP:Your team has been deployed for Operation Golden Nugget, in direct support of Gorgas forces amid the Donovian-Gorgas war. You have been tasked to collect, analyze, and process data utilizing various reconnaissance techniques throughout Donovian and Gorgas Cyberspace.

Maintain 'low visibility' on the wire, as security products may be in place, and document your actions and results as you will be expected to provide OpNotes upon request.

Intelligence believes that not all of the 192.168.28.96/27 network has the ability to communicate with the 192.168.150.224/27 network.

Donovian Reconnaissance and Scanning (DR&S)
XX June 2024
Start Time: 1300
Duration: 4 hours

Type of Operation: Cyber Intelligence, Surveillance and Reconnaissance (C-ISR)

Objective:Scan target networks to gather pertinent host information.

Tools/Techniques: All connections will be established through network scans or web browser. Ports in use will be dependent on target location and are subject to change. Network scanning tools/techniques are limited to NSE scripts, python lxml and OSINT.

Scenario Credentials: FLAG = R3C0N5t@rt0F@ct1v1ty

Prior Approvals: OSINT through publicly available resources. Scrape appropriate web content that will provide operational data. Testing of found credentials. NOT approved to change routing, passwords, services, destroy data, upload of tools, create accounts

Scheme of Maneuver:
>Jump Box
->Network scan: 192.168.28.96/27
-->Network scan:192.168.150.224/27

Target Section:

Network scans:
Network: 192.168.28.96/27
Network:192.168.150.224/27
OSs: unknown
Creds: student ::
Known Ports: unknown
Known URL: consulting.site.donovia
Known URL: conference.site.donovia
Action: Reconnaissance to collect intelligence and identify possible avenues of approach in the network.

```
```python
for i in {1..254}; do (ping -c 1 10.10.28.$i | grep "speaker" &); done | awk '{print $4}' | cut -d: -f1 > ips.txt
for i in {1..254}; do (ping -c 1 192.168.28.$i | grep "speaker" &); done | awk '{print $4}' | cut -d: -f1

```
```shell
ssh student@10.50.39.150
ssh student@10.50.39.150 -D 9050 
proxychains nmap -iL ips.txt

#copy over ips file to your ops station ot proxy chains it
proxychains nmap 10.10.28.62 -Pn --script banner.nse -p 2222
/usr/share/namp/scripts$ : nmap 

ssh student@10.50.39.150 -D 9050 -NT
ssh student@10.50.39.150 -D 9050 -L 10300:192.168.28.111:8080 -NT

ProxyChains-2.1 (http://proxychains.sf.net)

Starting Nmap 7.60 ( https://nmap.org ) at 2023-06-20 18:18 UTC
Nmap scan report for 192.168.28.1
Host is up (0.0011s latency).
All 1000 scanned ports on 192.168.28.1 are closed

Nmap scan report for 192.168.28.2
Host is up (0.0012s latency).
Not shown: 999 closed ports
PORT   STATE SERVICE    VERSION
53/tcp open  tcpwrapped

Nmap scan report for 192.168.28.3
Host is up (0.0015s latency).
Not shown: 999 closed ports
PORT   STATE SERVICE    VERSION
53/tcp open  tcpwrapped

Nmap scan report for 192.168.28.97
Host is up (0.0010s latency).
All 1000 scanned ports on 192.168.28.97 are closed

Nmap scan report for 192.168.28.98
Host is up (0.0014s latency).
Not shown: 999 closed ports
PORT   STATE SERVICE    VERSION
53/tcp open  tcpwrapped

Nmap scan report for 192.168.28.99
Host is up (0.0015s latency).
Not shown: 999 closed ports
PORT   STATE SERVICE    VERSION
53/tcp open  tcpwrapped


map scan report for 192.168.28.100
Host is up (0.0015s latency).
Not shown: 998 closed ports
PORT     STATE SERVICE VERSION
80/tcp   open  http    Apache httpd 2.4.29 ((Ubuntu))
|_http-server-header: Apache/2.4.29 (Ubuntu)
2222/tcp open  ssh     OpenSSH 7.6p1 Ubuntu 4ubuntu0.3 (Ubuntu Linux; protocol 2.0)
|_banner: SSH-2.0-OpenSSH_7.6p1 Ubuntu-4ubuntu0.3
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel

Nmap scan report for 192.168.28.105
Host is up (0.0014s latency).
Not shown: 997 closed ports
PORT     STATE SERVICE VERSION
21/tcp   open  ftp     ProFTPD 1.3.5
|_banner: 220 ProFTPD 1.3.5 Server (Debian) [::ffff:192.168.28.105]
23/tcp   open  telnet  Linux telnetd
PassTemporary
loginFirst
logout null bit
houseBeatFliesLOW
YourTempPassword
ssh student@
ssh student@10.50.39.150 -L 10300:192.168.28.120:4242
1234
ssh student@10.50.39.150 -L 10300:192.168.28.120:4242
ssh student@localhost -p 10300 -D 9050
YourTempPassword
|_banner: \xFF\xFD\x18\xFF\xFD \xFF\xFD#\xFF\xFD'
2222/tcp open  ssh     OpenSSH 7.6p1 Ubuntu 4ubuntu0.3 (Ubuntu Linux; protocol 2.0)
|_banner: SSH-2.0-OpenSSH_7.6p1 Ubuntu-4ubuntu0.3
Service Info: OSs: Unix, Linux; CPE: cpe:/o:linux:linux_kernel

Nmap scan report for 192.168.28.111
Host is up (0.0013s latency).
Not shown: 997 closed ports
PORT     STATE SERVICE VERSION
80/tcp   open  http    Apache httpd 2.4.29 ((Ubuntu))
|_http-server-header: Apache/2.4.29 (Ubuntu)
2222/tcp open  ssh     OpenSSH 7.6p1 Ubuntu 4ubuntu0.3 (Ubuntu Linux; protocol 2.0)
|_banner: SSH-2.0-OpenSSH_7.6p1 Ubuntu-4ubuntu0.3
8080/tcp open  http    A111pache httpd 2.4.29 ((Ubuntu))
|_http-server-header: Apache/2.4.29 (Ubuntu)
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel


Nmap scan report for 192.168.28.120
Host is up (0.0014s latency).
Not shown: 999 closed ports
PORT     STATE SERVICE VERSION
4242/tcp open  ssh     OpenSSH 7.6p1 Ubuntu 4ubuntu0.3 (Ubuntu Linux; protocol 2.0)
|_banner: SSH-2.0-OpenSSH_7.6p1 Ubuntu-4ubuntu0.3
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel
t is up (0.0014s latency).
All 1000 scanned ports on 192.168.28.1 are closed

Nmap scan report for 192.168.28.2
Host is up (0.0015s latency).
Not shown: 999 closed ports
PORT   STATE SERVICE
53/tcp open  domain

Nmap scan report for 192.168.28.3
Host is up (0.0019s latency).
Not shown: 999 closed ports2
PORT   STATE SERVICE
53/tcp open  domain

Nmap scan report for 192.168.28.5
Host is up (0.0021s latency).
Not shown: 996 closed ports
PORT     STATE SERVICE
135/tcp  open  msrpcssh student@10.50.39.150 -L 10300:192.168.28.120:4242
ssh student@10.50.39.150 -p 10300 -D 9050 -NT
139/tcp  open  netbios-ssn
445/tcp  open  microsoft-ds
3389/tcp open  ms-wbt-server

Nmap scan report for 192.168.28.9
Host is up (0.0020s latency).
Not shown: 996 closed ports
PORT     STATE SERVICE
135/tcp  open  msrpc
139/tcp  open  netbios-ssn
445/tcp  open  microsoft-ds
3389/tcp open  ms-wbt-server

Nmap scan report for 192.168.28.12
Host is up (0.0019s latency).
Not shown: 999 closed ports
PORT   STATE SERVICE
22/tcp open  ssh

Nmap scan report for 192.168.28.27
Host is up (0.0019s latency).
Not shown: 999 closed ports
PORT   STATE SERVICE
22/tcp open  ssh

Nmap scan report for 192.168.28.97
Host is up (0.0015s latency).
All 1000 scanned ports on 192.168.28.97 are closed

Nmap scan report for 192.168.28.98
Host is up (0.0016s latency).
Not shown: 999 closed ports
PORT   STATE SERVICE
53/tcp open  domain

Nmap scan report for 192.168.28.99
Host is up (0.0016s latency).
Not shown: 999 closed ports
PORT   STATE SERVICE
53/tcp open  domain

Nmap scan report for 192.168.28.120
Host is up (0.0013s latency).
Not shown: 999 closed ports
PORT     STATE SERVICE
4242/tcp open  vrml-multi-use

Nmap scan report for 192.168.28.129
Host is up (0.0013s latency).
All 1000 scanned ports on 192.168.28.129 are closed

Nmap scan report for 192.168.28.130
Host is up (0.0019s latency).
Not shown: 999 closed ports
PORT   STATE SERVICE
53/tcp open  domain

Nmap scan report for 192.168.28.131
Host is up (0.0019s latency).
Not shown: 999 closed ports
PORT   STATE SERVICE
53/tcp open  domain
-------------------------------------------------------

Nmap scan report for 192.168.150.245
Host is up (0.0021s latency).
Not shown: 995 closed ports
PORT     STATE SERVICE
135/tcp  open  msrpc
139/tcp  open  netbios-ssn
445/tcp  open  microsoft-ds
3389/tcp open  ms-wbt-server
9999/tcp open  abyss

Nmap scan report for 192.168.150.253
Host is up (0.0021s latency).
Not shown: 998 closed ports
PORT    STATE SERVICE
80/tcp  open  http
514/tcp open  shell
