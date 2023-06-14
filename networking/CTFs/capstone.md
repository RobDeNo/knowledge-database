
echo "ANSWER" | base64 - answers regular
echo "C" | base64 - multiple choice
hint - 3a.png

START FLAG: crowning achievement
Floating IP of start pivot is: 10.50.40.226
```shell
#ssh into internet host 
ssh -X student@10.50.21.79
#create a dunamic tunnel to you pivot
ssh net1_student3@10.50.40.226 -D 9050 -NT
##being active recon
netstat -antlp
22,23,80,3389
ip neighbor
proxychains curl http://10.50.40.226 #hint-01a.png
proxychains wget -r http://10.50.40.226
-----------------------------------------------------------------
-----------------------------------------------------------------
-----------------------------------------------------------------
```

# 10.1.1.11 Capstone 02
```shell
######################################################################
#hint-02a.png : there is a webservice running on the port that corresponds with the RFC that governs private IPv4 Addressing
##Below is information found on port 1918, questions 1-5
#QUESTION 1 APIPA uses the IP network range of 169.254.0.0/16. What RFC number governs this? Enter only the BASE64 conversion of the number.
    RFC 3927
    echo '3927' | base64
    MzkyNwo=
#QUESTION 2 IPv6 Uses SLAAC to resolve its Global address from the Router. What multicast destination address does it use to Solicit the router? 
    FF02::1:
    echo 'ff02::2' | base64 #SLAAC is used for router solication client RS==FF02::2/1 ::1 = client ::2 = all nodes
    RkYwMjo6Mgo=
#QUESTION 3 Which type of ARP is sent in order to perform a MitM attack? - Specify the answer in ALL CAPS and convert to BASE64.
    SPOOFING
    echo 'GRATUITOUS ARP' | base64
    R1JBVFVJVE9VUyBBUlAK
#QUESTION 4 : | Destination MAC | Source MAC | 0x8100 | 1 | 0x8100 | 100 | 0x0800 | IPv4 Header | TCP Header | Data | FCS | , What form of attack is being performed? Supply your answer in ALL CAPS and convert to BASE64.
    echo 'VLAN HOPPING' | base64
    VkxBTiBIT1BQSU5HCg==
#QUESTION 5 : A router receives a 5000 byte packet on eth0. The MTU for the outbound interface (eth1) is 1500. What would the fragmentation offset increment be with the conditions below?
Origional packet Size = 5000 bytes
MTU for outboud interface = 1500
Packet IHL = 7
    echo '184' | base64
    MTg0Cg==
######################################################################
#hint-02b.png : there is a pcap saved in the share folder of this machine that you should look at
#open a dynamic to pivot
ssh net1_student3@10.50.40.226
proxychains telnet 10.1.1.11
tcpdump -n -r capstone-bpf.pcap "filter" | wc-1
-------------------------------------------------------------------------------
Question 1:
Using BPF’s, determine how many packets with a DSCP of 26 being sent to the host 10.0.0.103.
tcpdump -n dst 10.0.0.103 "ip[1]>>2=26"  -r capstone-bpf.pcap | wc -l 
tcpdump -n "ip[16:4]=0x0a000067 && ip[1]>>2=26"  -r capstone-bpf.pcap | wc -l
echo '108' | base64
MTA4Cg==
Provide the number of packets converted to BASE64.
------------------------------------------------------------------------------
Question 2:
What is the total number of fragmented packets?
tcpdump -n "ip[6]&32=32"  -r capstone-bpf.pcap | wc -l
tcpdump -n "ip[6]&32=32 || "  -r capstone-bpf.pcap | wc -l
tcpdump -n "ip[6]&32=32 || ip[6:2]&8191!=0"  -r capstone-bpf.pcap | wc -l
echo '2729' | base64
MjcyOQo=
-------------------------------------------------------------------------------
Question 3:
How many packets have the DF flag set and has ONLY the RST and FIN TCP Flags set?
tcpdump -n "ip[6]&64=64 && tcp[13]&5=5"  -r capstone-bpf.pcap | wc -l
MTA5Cg==
Provide the number of packets converted to BASE64.

-------------------------------------------------------------------------------

Question 4:
An attacker is targeting the host 10.0.0.104 with either a TCP full or half open scan. Based off the pcap, how many ports are open?
tcpdump -n "ip[6]&32=32 || ip[6:2]&8191!=0"  -r capstone-bpf.pcap | wc -l

Provide the number of ports converted to BASE64.
-------------------------------------------------------------------------------
-----------------------------------------------------------------
```
# Capstone 3 10.1.1.25
10.1.1.25 
```shell
#hint-03a.png : there is a webservice that corresponds with the RFC that governs IPv4 Structure
proxychains wget -r http://10.1.1.25:791
##QUESTION 1 RAW Sockets are created in ________ space. Specify the one word BASE64 conversion of your answer in ALL CAPS.
    namespace
    echo 'KERNEL' | base64
    S0VSTkVMCg==
##QUESTION 2 Which module would you need to import to convert data into a corresponding 2-digit hex representation?
       echo 'binascii' | base64
    YmluYXNjaWkK
##QUESTION 3 What is the proper format to pro-grammatically pack the IPv4 RAW header?
Specify the answer in the proper case. Include only what is between the single or double quotes and not the quotes themselves or the “!”.
    echo 'BBHHHBBH4s4s' | base64
    QkJISEhCQkg0czRzCg==
##QUESTION 4 What is the default (and most common) encoding used when converting data to be sent over the network. 
    echo 'BASE64' | base64
    echo 'UTF-8' | base64
    VVRGLTgK
##QUESTION 5 What type of header does TCP build to perform the checksum function?
    echo 'PSEUDO' | base64
    UFNFVURPCg==
i.e. [ANSWER] Header
Provide your answer in ALL CAPS and converted to BASE64. 
#hint-03b.png : there is a listening TCP port on this system that is waiting for the connections. Build a Python3 TCP Stream sender and send it thru your tunnel to say Hi. Send your message as a bytes-like object and decode the response to/from UTF-8 to get the double-decoded emssage, use cyber chef

NDIgNjEgN2EgNjkgNmUgNjcgNjE=
Bazinga
echo 'Bazinga' | base64
QmF6aW5nYQo=
-----------------------------------------------------------------
10.1.1.30
#hint-01a.png : this system seems to be pivot for network Fundamentls and Programming sections
ssh net1_student3@10.50.40.226 -L 10300:10.1.1.30:XXXX
ssh net_student@10.50.40.226 -p 10300 -D 9050 -NT
-----------------------------------------------------------------
10.1.1.33
#hint-04a.png : There is another box (Capstone-05) on a different network (that only this sytsem can see) trying to attack this box, on one of the ports associated with W32/Blaster Worm. Use sniffing tool to try to find the message it is trying to send
ssh net1_student3@10.50.40.226 -L 10300:10.1.1.33:23
ssh net1_student3@localhost -p 10300
    1.1.1.2.44434 > 1.1.1.1.tftp: [udp sum ok]  31 tftp-#18720
	0x0000:  4500 003b 3607 4000 4011 00a7 0101 0102  E..;6.@.@.......
	0x0010:  0101 0101 ad92 0045 0027 35e4 4920 6a75  .......E.'5.I.ju
	0x0020:  7374 2077 616e 7420 746f 2073 6179 204c  st.want.to.say.L
	0x0030:  4f56 4520 594f 5520 5341 4e              OVE.YOU.SAN
I just want to say LOVE YOU
```
```shell
SSBqdXN0IHdhbnQgdG8gc2F5IExPVkUgWU9VIFNBTgo=
ssh net1_student@10.50.23.43 -L 10300:10.1.2.200:23
telnet localhost 10300
ssh net1_student@10.1.2.130 -R 10301:localhost:8976
ssh net1_student@10.50.23.43 -L 10302:localhost:10301
ssh net1_student@localhost -p 10302 -D 9050 -NT
#hint-04b.png : RIPv2 seems to be running on the 10.1.1.0/25. Try to sniff out the traffic to find out what network its adversting in its updates. What you find will be the IP address of the next enviorment pivot access from your INTERNET-HOST
 tcpdump -X -vv port 520
 10.1.1.125.route > 224.0.0.9.route: [udp sum ok] 
	RIPv2, Response, length: 44, routes: 2 or less
	  AFI IPv4,         0.0.0.0/0 , tag 0x0000, metric: 1, next-hop: 10.1.1.126
	  AFI IPv4,     10.50.39.13/32, tag 0x0000, metric: 1, next-hop: 10.1.1.126
------------------------------------------------------------------------------
10.50.39.13
ssh is running on a higher port althgouh it only seems to accept cpnnection when it loks like its coming from a cisco Devices TTL Try using iptables to adjust your sending TTL. flag - SSH port number
7777
echo 7777|base64
nmap --ttl 255 10.50.39.13 -p7000-8000
sudo iptables -t mangle -A OUTPUT -d 10.50.39.13 -j TTL --ttl-set 255
ssh -p 7777 net1_student3@10.50.39.13

```
# 10.2.2.7
#hint
net1_comrade3
Netflix and Chill
echo Netflix and Chill|base64
TmV0ZmxpeCBhbmQgQ2hpbGwK
```shell
ssh -p 7777 net1_student3@10.50.39.13 -L 10301:10.2.2.7:23 -NT
telnet localhost 10301
ssh net1_student3@10.2.2.6 -p 7777 -R 10302:localhost:2222
ssh net1_student3@10.50.39.13 -p 7777 -L 10303:localhost:10302
ssh net1_comrade3@localhost -p 10303 -L 10304:10.10.10.182:504
ssh net1_student3@localhost -p 10304 -D 9050 -NT
  ssh-keygen -f "/home/student/.ssh/known_hosts" -R "[localhost]:10304"

10.10.10.167 dev eth1 lladdr fa:16:3e:8c:f6:35 REACHABLE
10.10.10.182 dev eth1 lladdr fa:16:3e:48:eb:55 REACHABLE
10.10.10.140 dev eth1 lladdr fa:16:3e:eb:22:26 REACHABLE
```
# 10.10.10.140
```shell
proxychains wget -r ftp://10.10.10.140
#hint-08a.png : http status code for Moved permaanantly
301
echo 301|baseproxyc
#hint-08b.png : pivot for next box
10.10.10.129 dev eth0 lladdr fa:16:3e:ac:c8:d2 REACHABLE
192.168.10.62 dev eth1 lladdr fa:16:3e:0a:7b:74 REACHABLE
192.168.10.39
#hint /hint-09a.png : same port that metasploit uses for web services
3790
# QUESTION 1 What type of recon is being performed if you are performing ARP scans and sending Gratuitous ARPs to perform a MitM attack?
Provide the 2 word process in ALL CAPS and converted to Base64.
echo 'INTERNAL ACTIVE'|base64
SU5URVJOQUwgQUNUSVZFCg==
#QUESTION 2 What is the typical flag response (if any) would a Linux host perform when receiving a Stealth scan on an CLOSED port?
Provide the 3 letter abbreviated name of the FLAG(s) in ALL CAPS, separated by / (use “NONE” if no response) and converted to Base64.
echo RST|base64
UlNUCg==
#QUESTION 3 What command line tool can be used to pull DNS information from the server using TCP port 43?
echo WHOIS|base64
V0hPSVMK
#QUESTION 4 Which NMAP scan is able to determine open ports on a target by spoofing packets to make them looks as if they came from a zombie machine?
echo 'IDLE SCAN'|base64
SURMRSBTQ0FOCg==
#QUESTION 5 A cyber analyst wants to us Netcat to perform a banner grab on a target IP of 10.1.0.1 port 1111.
nc 172.16.82.106 22
echo 'nc 10.1.0.1 1111'|base64
192.168.10.44
```
# 10.10.10.167
```shell
proxychains wget -r http://10.10.10.167
ssh is running on HTTP status code Not found
#QUESTION 1 
echo D|base64
#QUESTION 2
echo A|base64
#QUESTION 3
echo ASYMMETRIC|base64
#QUESTION 4
echo
#Question 4
What exact SCP command would you use to copy a file called “secret.txt” from the 'tgt' home directory, to your current working directory, using the Dynamic tunnel you have established.

      -----------     ------       ----------    -------
      | outside |     | FW |       | inside |    | tgt |
      -----------     ------       ----------    -------
      147.25.99.1                 192.168.1.27  192.168.1.10
outside$: ssh inside@192.168.1.27 -D 9050 -NT
Provide the command exactly as you would run in from the command line (including any appropriate spaces and all lower case) using proxychains and converted to Base64.
proxychains scp {username}@{ip}:{path}/{filename} {target location}
proxychains scp tgt@192.168.1.10:secret.txt .
echo 'proxychains scp tgt@192.168.1.10:/home/tgt/secret.txt .'|base64
echo 'proxychains scp tgt@192.168.1.10:secret.txt .'|base64
cHJveHljaGFpbnMgc2NwIHRndEAxOTIuMTY4LjEuMTA6c2VjcmV0LnR4dCAuCg==
#QUESTION 5
Home Q.1 Q.2 Q.3 Q.4 Q.5
Question 5
Which tool adds “FTP Like” services to SSH?
Provide the exact tool acronym in ALL CAPS and converted to Base64.
echo SFTP|base64
```
# 10.10.10.182 capstone 12
```shell
proxychains wget -r ftp://10.10.10.182
http 504
echo 504|base64
```
## 192.168.10.101
```shell
#QUESTION 1 : Which option in Wireshark could you use if you wanted to identify which IP address are communicating with each other?
echo 'IP.ADDR=='|base64
echo 'IP.ADDR'|base64
echo 'CONVERSATIONS'|base64
#QUESTION 2 :1What is the name of the data type that is a Cisco proprietary protocol used for collecting IP traffic information and monitoring network flow? 
echo 'NETFLOW'|base64
TkVURkxPVwo=
#QUESTION 3 : A method of data collection where this device can be placed in line on the wire to capture traffic
echo 'TAP'|base64
VEFQCg==
#QUESTION 4  : A network admin starts to notice an increase in requests for certain files, changes to the registry and unusual tasks being run.
echo 'COMPROMISE'|base64
#QUESTION 5 : What type of malware doesn't use an encryption key but is capable of rewriting its code and signature patterns with each iteration?
echo 'METAMORPHIC'|base64
ssh net1_student3@192.168.10.101


proxychains ftp -p 192.168.10.101
proxychains scp net1_student3@192.168.10.101:/usr/share/cctc/capstone-analysis.pcap
ls
get capstone-analysis_HEX-ENCODED.pcap
-------------------------------------------------------------------------------
Question 1:
Which ip address initiated the attack against the FTP server?
Provide the ip address in the x.x.x.x format and converted to Base64.
echo '10.1.0.108'|base64
MTAuMS4wLjEwOAo=
-------------------------------------------------------------------------------
Question 2:
How many failed attempts to guess the FTP password?
Provide number and converted to Base64.
echo '4'|base64
NAo=
-------------------------------------------------------------------------------
Question 3:
What is the correct FTP password?
Provide the exact password and converted to Base64.
echo 'w'|base64
dwo=
-------------------------------------------------------------------------------
Question 4:
What is the system IP that was compromised?
Provide the ip address in the x.x.x.x format and converted to Base64.
echo '10.2.0.2'|base64
MTAuMi4wLjIK
-------------------------------------------------------------------------------
Question 5:
What is the FTP version?
Provide the version number only and converted to Base64.
echo '3.0.2'|base64
My4wLjIK
-------------------------------------------------------------------------------
Question 6:
What is the name of the file taken by the attacker?
Provide the filename exactly as shown and converted to Base64.
echo 'test.txt'|base64
dGVzdC50eHQK
-------------------------------------------------------------------------------
Question 7:
What was the message contained within the extracted file?
Provide the message exactly as shown and converted to Base64.
echo 'hi'|base64
aGkK
------------------------------------------------------------------------------
Question 8:
What is the name of the file uploaded by the attacker?
Provide the filename exactly as shown and converted to Base64.
echo 'company_payroll_2019'|base64
-------------------------------------------------------------------------------
```
# 192.168.10.111
```shell
#QUESTION 1 : In NAT, which Hook would I place a rule to change the source IP for all traffic thru this host?
echo 'PRE_ROUTING'|base64
echo 'POSTROUTING'|base64
UE9TVFJPVVRJTkcK
#QUESTION 2 : Which Hook would I apply rules that are destined for the ‘localhost’?
echo 'INPUT'|base64
SU5QVVQK
#QUESTION 3 : What recognition method do IDS/IPS primarily use to detect malicious traffic?
echo 'SIGNATURE'|base64
U0lHTkFUVVJFCg==
#QUESTION 4 : In iptables, which Table would I use if I wanted to preform packet alterations?
echo 'MANGLE'|base64
TUFOR0xFCg==
#QUESTION 5 : What is the default family for NFTables?
echo 'IP'|base64
---------------------------------------------------------
#Question 1 : How many rule files are on the system?
#Provide the number converted to Base64 as your answer.
echo '24'|base64
MjQK
-------------------------------------------------------------------------------
#Question 2 : How many of the rules are currently in use to match on traffic?
#Provide the number converted to Base64 as your answer.
echo '7'|base64
Nwo=
------------------------------------------------------------------------------
#Question 3 : Which rule will look for someone doing a null scan ?
#Provide only the filename as your answer (i.e. ‘file.rules’) and converted to Base64.
echo 'tftp.rules'|base64
find / -type f -exec grep -H 'text-to-find-here' {} \;
echo 'alien-abductions.rules'|base64
YWxpZW4tYWJkdWN0aW9ucy5ydWxlcwo=
-------------------------------------------------------------------------------
#Question 4 : What is the exact Alert Message that is being triggered on the system?
#Convert the exact message as you see it and convert it to Base64 for your answer.
echo 'Who got that kinda monies to pay that!'|base64
V2hvIGdvdCB0aGF0IGtpbmRhIG1vbmllcyB0byBwYXkgdGhhdCEK
---------------------------------------------------------------
#Question 5 : From what IP is the attack coming from?
#Provide your answer in the x.x.x.x format and converted to Base64.
echo '192.168.10.99'|base64
MTkyLjE2OC4xMC45OQo=
-------------------------------------------------------------------------------










telnet 10.50.22.42
ssh net1_student@10.50.20.51 -R 10300:localhost:8462
ssh net1_student@localhost -p 10300 -D 9050

ssh net1_student@localhost -p 10300 -L 10301:192.168.100.60:22 -NT
ssh net1_student@localhost -p 10301 -D 9050 -NT

ssh net1_student@localhost -p 10301 -L 10302:10.90.50.140:6481 -NT
ssh net1_student@localhost -p 10302 -D 9050 -NT

ssh net1_student@localhost -p 10302 -L 10303:172.20.21.5:23 -NT
telnet localhost 10303
ssh net1_student@172.20.21.4 -p 6481 -R 10304:localhost:22 -NT
ssh net1_student@localhost -p 10302 -L 10305:localhost:10304 -NT
ssh net1_student@localhost -p 10305 -D 9050 -NT

