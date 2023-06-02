Hosts: student:Passwords
Routers: vyos:Passwords
---------------------------------------------------------
BOX
Hostname:
ip/int name:
OS:
Version:
Patches:
KNown Applications:
Open Ports:
Running Protocols:
Knwon Vuln:
Users/Passwords/home/dir


vyos@RED-SCR:~$ uname -a
Linux RED-SCR 3.13.11-1-amd64-vyos #1 SMP Wed Aug 12 02:08:05 UTC 2015 x86_64 GNU/Linux
vyos@RED-SCR:~$ sh int
Codes: S - State, L - Link, u - Up, D - Down, A - Admin Down
Interface        IP Address                        S/L  Description
---------        ----------                        ---  -----------
eth0             172.16.120.1/30                   u/u  INTERNET 
eth1             172.16.120.6/30                   u/u  REDNET 
eth2             172.16.101.30/27                  u/u  DMZ 
lo               127.0.0.1/8                       u/u  
                 120.0.0.1/32
                 ::1/128

# DMZ net nmap
student@internet-host-student-3:~$ sudo nmap -sV 172.16.101.30/27 -p 21-23,80
Starting Nmap 7.70 ( https://nmap.org ) at 2023-06-02 18:23 UTC
Nmap scan report for 172.16.101.2
Host is up (0.0043s latency).

PORT   STATE  SERVICE VERSION
21/tcp closed ftp
22/tcp open   ssh     OpenSSH 7.9p1 Debian 10+deb10u2 (protocol 2.0)
23/tcp closed telnet
80/tcp closed http
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel
## this is the devices, red-dmz-host-1-student

Nmap scan report for 172.16.101.30
Host is up (0.0031s latency).

PORT   STATE  SERVICE VERSION
21/tcp closed ftp
22/tcp open   ssh     OpenSSH 5.5p1 Debian 6+squeeze8 (protocol 2.0)
23/tcp closed telnet
80/tcp closed http
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel
# Rednet
student@internet-host-student-3:~$ sudo nmap -sV 172.16.120.6/30 -p 21-23,80
Starting Nmap 7.70 ( https://nmap.org ) at 2023-06-02 18:33 UTC
Nmap scan report for 172.16.120.5
Host is up (0.0018s latency).
## This is the REDIPS rrouter connected to the DMZ
PORT   STATE  SERVICE VERSION
21/tcp closed ftp
22/tcp open   ssh     OpenSSH 5.5p1 Debian 6+squeeze8 (protocol 2.0)
23/tcp closed telnet
80/tcp closed http
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel

Nmap scan report for 172.16.120.6
Host is up (0.0015s latency).

PORT   STATE  SERVICE VERSION
21/tcp closed ftp
22/tcp open   ssh     OpenSSH 5.5p1 Debian 6+squeeze8 (protocol 2.0)
23/tcp closed telnet
80/tcp closed http
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel

Service detection performed. Please re

### SSH into the rednet this is the nmap
student@internet-host-student-3:~$ ssh vyos@172.16.120.5
Welcome to VyOS
vyos@172.16.120.5's password: 
Linux vyos 3.13.11-1-amd64-vyos #1 SMP Wed Aug 12 02:08:05 UTC 2015 x86_64
Welcome to VyOS.
This system is open-source software. The exact distribution terms for 
each module comprising the full system are described in the individual 
files in /usr/share/doc/*/copyright.
Last login: Thu Oct 12 20:23:09 2017 from 10.9.64.132
vyos@RED-IPS:~$ hostname
RED-IPS
vyos@RED-IPS:~$ sh int
Codes: S - State, L - Link, u - Up, D - Down, A - Admin Down
Interface        IP Address                        S/L  Description
---------        ----------                        ---  -----------
eth0             172.16.120.5/30                   u/u  INTERNET 
eth1             172.16.120.10/30                  u/u  REDNET 
lo               127.0.0.1/8                       u/u  
                 120.0.0.2/32
                 ::1/128
vyos@RED-IPS:~$ 
## THis is the nmap for the Rednet above
student@internet-host-student-3:~$ sudo nmap -sV 172.16.120.10/30 -p 21-23,80
Starting Nmap 7.70 ( https://nmap.org ) at 2023-06-02 18:39 UTC
Nmap scan report for 172.16.120.9
Host is up (0.0029s latency).

PORT   STATE  SERVICE VERSION
21/tcp closed ftp
22/tcp open   ssh     OpenSSH 5.5p1 Debian 6+squeeze8 (protocol 2.0)
23/tcp closed telnet
80/tcp closed http
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel

Nmap scan report for 172.16.120.10
Host is up (0.0023s latency).

PORT   STATE  SERVICE VERSION
21/tcp closed ftp
22/tcp open   ssh     OpenSSH 5.5p1 Debian 6+squeeze8 (protocol 2.0)
23/tcp closed telnet
80/tcp closed http
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 4 IP addresses (2 hosts up) scanned in 2.19 seconds
##### Scanning the .9 above got the below with an nmap
Welcome to VyOS.
This system is open-source software. The exact distribution terms for 
each module comprising the full system are described in the individual 
files in /usr/share/doc/*/copyright.
Last login: Thu Oct 12 20:23:09 2017 from 10.9.64.132
vyos@RED-POP:~$ hostname
RED-POP
vyos@RED-POP:~$ sh int
Codes: S - State, L - Link, u - Up, D - Down, A - Admin Down
Interface        IP Address                        S/L  Description
---------        ----------                        ---  -----------
eth0             172.16.120.9/30                   u/u  INTERNET 
eth1             172.16.182.126/27                 u/u  REDHOSTS 
eth2             172.16.140.6/30                   u/u  REDINTDMZ 
lo               127.0.0.1/8                       u/u  
                 120.0.0.3/32
                 ::1/128
### now i need to sca the hosst network to find the number of hosts
student@internet-host-student-3:~$ sudo nmap -sV 172.16.182.126/27 -p 21,22,23,80
Starting Nmap 7.70 ( https://nmap.org ) at 2023-06-02 18:43 UTC
Nmap scan report for 172.16.182.106
Host is up (0.0059s latency).

PORT   STATE  SERVICE VERSION
21/tcp closed ftp
22/tcp open   ssh     OpenSSH 7.9p1 Debian 10+deb10u2 (protocol 2.0)
23/tcp closed telnet
80/tcp closed http
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel

Nmap scan report for 172.16.182.110
Host is up (0.0052s latency).

PORT   STATE  SERVICE VERSION
21/tcp closed ftp
22/tcp open   ssh     OpenSSH 7.9p1 Debian 10+deb10u2 (protocol 2.0)
23/tcp closed telnet
80/tcp open   http    nginx 1.14.2
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel

Nmap scan report for 172.16.182.114
Host is up (0.0052s latency).

PORT   STATE  SERVICE VERSION
21/tcp closed ftp
22/tcp open   ssh     OpenSSH 7.9p1 Debian 10+deb10u2 (protocol 2.0)
23/tcp closed telnet
80/tcp closed http
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel

Nmap scan report for 172.16.182.118
Host is up (0.0050s latency).

PORT   STATE  SERVICE VERSION
21/tcp closed ftp
22/tcp open   ssh     OpenSSH 7.9p1 Debian 10+deb10u2 (protocol 2.0)
23/tcp closed telnet
80/tcp closed http
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel

Nmap scan report for 172.16.182.126(does ont count this is the router itself)
Host is up (0.0073s latency).

PORT   STATE  SERVICE VERSION
21/tcp closed ftp
22/tcp open   ssh     OpenSSH 5.5p1 Debian 6+squeeze8 (protocol 2.0)
23/tcp closed telnet
80/tcp closed http
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 32 IP addresses (5 hosts up) scanned in 9.67 seconds

## open ports for the above machines = port 22

# next asking for hosts
172.16.182.106 red-host-1 , this is what it wanted
# next hosts it wanted the web server MAYBE
172.16.182.110





