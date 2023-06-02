# Phase 1:
1. External Passive
   1. OSINT
# Phase 2
1. External Active
   1. Traceroute
   2. ping
   3. nmap external ips and port scan
   4. banner grabbing
# Phase 3
1. Internal Passive 
   1. ip address / ifconfig / ipconfig
   2. ip neighbor / arp -a
   3. ss /netstat
   4. ps -ef /top
   5. find
   6. tcpdump / wireshark / p0f
# Phase 4
1. Internal Active
   1. ping scan
   2. Traceroute
   3. arp
   4. port scan
   5. banner grabbing


## OSINT Stuff
[sitereport.com](https://sitereport.netcraft.com/)

```shell
nc 172.16.82.106 22
nc 172.16.82.106 21

dig facebook.com a #ip
dig facebook.com ns #name server
dig a.ns.facebook.com axfr facebook.com
#dig gets information from dns server, port 53
dig zonetransferme.com
dig axfr @nsztml.digi.ninja zonetransferme.com
#zone transfer uses TCP

nma -D 11.1.1.1,  12.1.1.1, 13.1.1.1, 192.168.2.1, 14.1.1.1
```
# PASSIVE RECON
```shell
whois ccboe.net

#dig
dig ccboe.net
dig ccboe.net A
dig ccboe.net AAAA
dig ccboe.net MX
dig ccboe.net NS
dig ccboe.net SOA
dig ccboe.net TXT

dig zonetransfer.me
dig zonetransfer.me A
dig zonetransfer.me AAAA
dig zonetransfer.me MX
dig zonetransfer.me NS
dig zonetransfer.me SOA
dig zonetransfer.me TXT
dig axfr @nsztm1.digi.ninja zonetransfer.me

#Determine the IP address, CIDR, MAC address of the local system:
ip addr
ip address

#View the contents of the local ARP cache:
ip nei
ip neighbo

#Determine open listening TCP/UDP port:
TCP:
netstat -antlp
ss -antlp

UDP:
netstat -anulp
ss -anulp

#Search for files on the local system:
find / -name hint* 2 > /dev/null
find / -iname flag* 2 > /dev/null

#Determine if a program is install on the local system:
whereis {program}
which {program}

#Look at all running processes/daemons:
ps -elf | grep {program}
top

#Identify OS information:
uname -A

#Passive sniffing:
sudo tcpdump -i eth0 "{filters}"
```
# ACTIVE RECON
```shell
#CURL: https://www.gnu.org/software/wget/manual/wget.html
#Display webage (text only)
curl http://172.16.82.106
curl http://172.16.82.106/file.txt
curl http://172.16.82.106:8080
#Displays FTP (text only)
curl ftp://172.16.82.106
curl ftp://172.16.82.106/file.txt

#WGET: https://curl.haxx.se/docs/manpage.html
#Download Webpage recursively ( -r will make a folder with url as name)
wget -r http://172.16.82.106
wget -r http://172.16.82.106:8080

#Download FTP recursively  ( -r will make a folder with url as name)
wget -r ftp://172.16.82.106

#Banner Grab a TCP or UDP port:
nc {ip address} {port}
nc 172.16.82.106 22
nc -u 172.16.82.106 53

#Vertical Scan of TCP ports on one IP using Netcat:
nc -nzvw1 172.16.82.106 21-23 80 2>&1 | grep -E 'succ|open'

#Vertical Scan of UDP ports on one IP using Netcat:
nc -nuzvw1 172.16.82.106 1000-2000 2>&1 | grep -E 'succ|open'
nc -nuzvw1 172.16.82.110 1980-1989 2>&1 | grep -E 'succ|open'

#Horizontal Scan a range of IPs for specific TCP ports using Netcat:
for i in {1..254}; do nc -nvzw1 172.16.82.$i 20-23 80 2>&1 & done | grep -E 'succ|open'
    
#Horizontal Scan a range of IPs for specific UDP ports using Netcat:
for i in {1..254}; do nc -nuvzw1 172.16.82.$i 1000-2000 2>&1 & done | grep -E 'succ|open'
    
#Using NMAP:
nmap 172.16.82.106
nmap 172.16.82.96/27
nmap 172.16.82.106 -p 21-23,80
nmap 172.16.82.96/27 -p 21-23,80
nmap -sT 172.16.82.106 -p 21-23,80
nmap -sT 172.16.82.96/27 -p 21-23,80
nmap -Pn -sT 1172.16.82.96/27 -p 21-23,80
nmap -sT 172.16.82.106 -p 1-1023
nmap -sT 172.16.82.106 -p 1024-65535
nmap -sT 172.16.82.106 -p-

    #Identify what type of scan you want to perform:
        -sT - TCP Full Connect (default)
        -sS - SYN (half open) scan (need sudo)
        -sF - FIN scan (need sudo)
        -sX - Christmas (XMAS) scan (need sudo)
        -sN - Null (no TCP flags) scan (need sudo)
    When scanning a CIDR it will first PING to find active systems. (ping will not be performed when scanning 1 system)
        If ICMP is being blocked then you will need to disable the ping sweep to get reliable results.
            -Pn - disable the ping sweep
    -p to specify specific ports to scan (will scan the 1000 most common ports by default)
        -p 21-23,80
            hyphen (-) to specify a range
            comma (,) to specify discontinuous ports
        -p- (will scan all 65535 ports)
            Same as (-p 1-65535)
    172.16.82.106 - will scan only the 1 ip
    172.16.82.96/27 - will scan the entire /27 ip range.

#Using /dev/tcp:
#Vertical Scan 1 system for a range of ports using /DEV/TCP:
for p in {1..1023}; do(echo >/dev/tcp/172.16.82.106/$p) >/dev/null 2>&1 && echo "$p open"; done

#Using ping:
#Ping scan a range of IPs:
for i in {1..254}; do (ping -c 1 172.16.82.$i | grep "bytes from" &) ; done













```