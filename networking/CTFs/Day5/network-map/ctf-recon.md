BOXES TOUCHED
Nmap scan report for 172.16.82.106
Host is up (0.0044s latency).

PORT   STATE SERVICE
21/tcp open  ftp
22/tcp open  ssh
23/tcp open  telnet
80/tcp open  http

Nmap scan report for 172.16.82.110
Host is up (0.0029s latency).

PORT   STATE  SERVICE
21/tcp closed ftp
22/tcp closed ssh
23/tcp closed telnet
80/tcp closed http

Nmap scan report for 172.16.82.112
Host is up (0.0033s latency).

PORT   STATE SERVICE
21/tcp open  ftp
22/tcp open  ssh
23/tcp open  telnet
80/tcp open  http

Nmap scan report for 172.16.82.113
Host is up (0.0026s latency).

PORT   STATE  SERVICE
21/tcp open   ftp
22/tcp open   ssh
23/tcp closed telnet
80/tcp open   http

Nmap scan report for 172.16.82.114
Host is up (0.0022s latency).

PORT   STATE  SERVICE
21/tcp open   ftp
22/tcp open   ssh
23/tcp closed telnet
80/tcp open   http

Nmap scan report for 172.16.82.115
Host is up (0.0033s latency).

PORT   STATE  SERVICE
21/tcp open   ftp
22/tcp open   ssh
23/tcp closed telnet
80/tcp open   http

Nmap scan report for 172.16.82.126
Host is up (0.0014s latency).
PORT   STATE  SERVICE
21/tcp closed ftp
22/tcp open   ssh
23/tcp closed telnet
80/tcp closed http
-----------------------------------------------------------------------------------------------------------
student@internet-host-student-3:~$ ssh vyos@172.16.20.1
The authenticity of host '172.16.20.1 (172.16.20.1)' can't be established.
RSA key fingerprint is SHA256:3s1WIhcFS40AjkpQz1mswJmpzL/0Gz0pUkc4dEt4cJM.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added '172.16.20.1' (RSA) to the list of known hosts.
Welcome to VyOS
vyos@172.16.20.1's password: 
Linux vyos 3.13.11-1-amd64-vyos #1 SMP Wed Aug 12 02:08:05 UTC 2015 x86_64
Welcome to VyOS.
This system is open-source software. The exact distribution terms for 
each module comprising the full system are described in the individual 
files in /usr/share/doc/*/copyright.
Last login: Thu Oct 12 20:23:09 2017 from 10.9.64.132
vyos@BLUE-SCR:~$ hostname
BLUE-SCR
vyos@BLUE-SCR:~$ sh int
Codes: S - State, L - Link, u - Up, D - Down, A - Admin Down
Interface        IP Address                        S/L  Description
---------        ----------                        ---  -----------
eth0             172.16.20.1/30                    u/u  INTERNET 
eth1             172.16.20.6/30                    u/u  BLUENET 
eth2             172.16.1.30/27                    u/u  BLUE_DMZ 
eth3             172.16.20.22/29                   u/u  BLUE_EXT_SNSR 
lo               127.0.0.1/8                       u/u  
                 20.0.0.1/32
                 ::1/128
vyos@BLUE-SCR:~$ 
-----------------------------------------------------------------------------------------------------------
udo nmap -sV 172.16.20.22/29 -p 21-23,80
Starting Nmap 7.70 ( https://nmap.org ) at 2023-06-02 18:05 UTC
Nmap scan report for 172.16.20.20
Host is up (0.0027s latency).

PORT   STATE  SERVICE VERSION
21/tcp open   ftp
22/tcp open   ssh     OpenSSH 7.9p1 Debian 10+deb10u2 (protocol 2.0)
23/tcp closed telnet
80/tcp open   http    nginx 1.14.2
1 service unrecognized despite returning data. If you know the service/version, please submit the following fingerprint at https://nmap.org/cgi-bin/submit.cgi?new-service :
SF-Port21-TCP:V=7.70%I=7%D=6/2%Time=647A2F84%P=x86_64-pc-linux-gnu%r(NULL,
SF:33,"220\x20ProFTPD\x20Server\x20\(Debian\)\x20\[::ffff:172\.16\.20\.20\
SF:]\r\n")%r(GenericLines,8F,"220\x20ProFTPD\x20Server\x20\(Debian\)\x20\[
SF:::ffff:172\.16\.20\.20\]\r\n500\x20Invalid\x20command:\x20try\x20being\
SF:x20more\x20creative\r\n500\x20Invalid\x20command:\x20try\x20being\x20mo
SF:re\x20creative\r\n")%r(SSLSessionReq,33,"220\x20ProFTPD\x20Server\x20\(
SF:Debian\)\x20\[::ffff:172\.16\.20\.20\]\r\n")%r(SMBProgNeg,33,"220\x20Pr
SF:oFTPD\x20Server\x20\(Debian\)\x20\[::ffff:172\.16\.20\.20\]\r\n");
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel

Nmap scan report for 172.16.20.21
Host is up (0.0028s latency).

PORT   STATE  SERVICE VERSION
21/tcp open   ftp     ProFTPD
22/tcp open   ssh     OpenSSH 7.9p1 Debian 10+deb10u2 (protocol 2.0)
23/tcp closed telnet
80/tcp open   http    nginx 1.14.2
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel

Nmap scan report for 172.16.20.22
Host is up (0.0016s latency).

PORT   STATE  SERVICE VERSION
21/tcp closed ftp
22/tcp open   ssh     OpenSSH 5.5p1 Debian 6+squeeze8 (protocol 2.0)
23/tcp closed telnet
80/tcp closed http
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel
-----------------------------------------------------------------------------------------------------------------------------
student@internet-host-student-3:~$ nmap -sV 172.16.1.30/27 -p 21-23,80
Starting Nmap 7.70 ( https://nmap.org ) at 2023-06-02 18:09 UTC
Nmap scan report for 172.16.1.15
Host is up (0.0038s latency).

PORT   STATE  SERVICE VERSION
21/tcp open   ftp     ProFTPD
22/tcp open   ssh     OpenSSH 7.9p1 Debian 10+deb10u2 (protocol 2.0)
23/tcp closed telnet
80/tcp open   http    nginx 1.14.2
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel

Nmap scan report for 172.16.1.30
Host is up (0.0011s latency).

PORT   STATE  SERVICE VERSION
21/tcp closed ftp
22/tcp open   ssh     OpenSSH 5.5p1 Debian 6+squeeze8 (protocol 2.0)
23/tcp closed telnet
80/tcp closed http
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 32 IP addresses (2 hosts up) scanned in 14.08 seconds



