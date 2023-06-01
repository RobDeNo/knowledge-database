```Shell
sudo tcpdump -n 'ip[8]<=64||ip6[7]<=64' -r BPFCheck.pcap | wc -l
#Capture all IPv4 packets with at least the Dont Fragment bit set? There should be 2321 packets.
sudo tcpdump -n 'ip[6]&64=64' -r BPFCheck.pcap | wc -l
#looking at the 6th byte of the ip field
#match the 64 bit and have it equal to the value of 64
--------------------------------------------------------------------
#Traffic with a Source Port higher than 1024, utilizing the correct Transport Layer Headers
sudo tcpdump -n 'tcp[0:2]>1024||udp[0:2]>1024' -r BPFCheck.pcap | wc -l
#using the TCP header to select the first byte(0)
#select the second space within the first byte and select it to be greater than 1024
------------------------------------------------------
#Capture all Packets with UDP protocol being set, utilizing the IPv4 or IPv6 Headers
sudo tcpdump -n 'ip[9]=0x11||ip6[6]=0x11' -r BPFCheck.pcap | wc -l
#specify UDP by selecting the IP header byte 9 and require the value equalt to hex 0x11(UDP)
#set the same value for the ipv6 header
--------------------------------------------------------------------
#Capture only packets with the ACK/RST or ACK/FIN flag set
sudo tcpdump -n 'tcp[13]=17||tcp[13]=20' -r BPFCheck.pcap | wc -l
-------------------------------------------------------------
#Capture all packets with an IP ID field of 213?
sudo tcpdump -n 'ip[4:2]=213' -r BPFCheck.pcap | wc -l
--------------------------------------------------------------------
#Capture all traffic that contains a VLAN tag?
sudo tcpdump -n 'ether[12:2]=0x8100' -r BPFCheck.pcap | wc -l
--------------------------------------------------------------------
#Capture all IPv4 packets relating to DNS?
sudo tcpdump -n 'tcp[0:2]=53||udp[0:2]=53||tcp[2:2]=53||udp[2:2]=53' -r BPFCheck.pcap | wc -l
--------------------------------------------------------------------
#Capture the initial packets from a client trying to initiate a TCP connection?
sudo tcpdump -n 'tcp[13]=2' -r BPFCheck.pcap | wc -l
--------------------------------------------------------------------
#Capture the response packets from a server listening on an open TCP ports?
sudo tcpdump -n 'tcp[13]=18' -r BPFCheck.pcap | wc -l
--------------------------------------------------------------------
#Capture the response packets from a server with closed TCP ports.
sudo tcpdump -n 'tcp[13]=4' -r BPFCheck.pcap | wc -l
--------------------------------------------------------------------
#Capture all TCP and UDP packets sent to the well known ports?
sudo tcpdump -n 'tcp[2:2]<1024||udp[2:2]<1024' -r BPFCheck.pcap | wc -l
--------------------------------------------------------------------
#Capture all HTTP traffic?
sudo tcpdump -n 'tcp[0:2]=80||tcp[2:2]=80' -r BPFCheck.pcap | wc -l
--------------------------------------------------------------------
#capture all telnet traffic?
sudo tcpdump -n 'tcp[0:2]=23||tcp[2:2]=23' -r BPFCheck.pcap | wc -l
--------------------------------------------------------------------
#Capture all ARP traffic?
sudo tcpdump -n 'ether[12:2]=0x0806' -r BPFCheck.pcap | wc -l
--------------------------------------------------------------------
#Capture if the "Evil bit" is set?
sudo tcpdump -n 'ip[6]&128=128' -r BPFCheck.pcap | wc -l
--------------------------------------------------------------------
#Capture any packets containing the CHAOS protocol within an IPv4 header?
sudo tcpdump -n 'ip[9]=16' -r BPFCheck.pcap | wc -l
--------------------------------------------------------------------
 #capture all IPv4 packets targeting just the beginning of potential traceroutes as it's entering your network from a windows or linux box.
sudo tcpdump -n '(ip[8]=1&&ip[9]=1)||(ip[8]=1&&ip[9]=17)' -r BPFCheck.pcap | wc -l
--------------------------------------------------------------------
#Capture all packets where the URG flag is not set and URG pointer has a value?
sudo tcpdump -n 'tcp[13]&32!=32&&tcp[18:2]>0' -r BPFCheck.pcap | wc -l
-----------------------------------------------------------------
#Capture a TCP null scan to the host 10.10.10.10? 
sudo tcpdump -n 'ip[16:4]=0x0a0a0a0a&&tcp[13]=0' -r BPFCheck.pcap | wc -l
-----------------------------------------------------------------
#Capture an attacker using vlan hopping to move from vlan 1 to vlan 10? There should be 15 packets
sudo tcpdump -n '(ip[8]=1&&ip[9]=1)||(ip[8]=1&&ip[9]=17)' -r BPFCheck.pcap | wc -l
[12:4]&0xFFFF0FFF=0x81000001
[16:4]&0xFFFF0FFF=0x81000064
