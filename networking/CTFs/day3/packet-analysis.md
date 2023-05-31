sudo tcpdump -n 'ip[8]<=64||ip6[7]<=64' -r BPFCheck.pcap | wc -l
Basic Analysis - dont fragment
5
Level I Challenge
What is the Berkeley Packet Filter, using tcpdump, to capture all IPv4 packets with at least the Dont Fragment bit set? There should be 2321 packets.

Enter the Filter syntax with no spacesl
sudo tcpdump -n 'ip[6]&64=64' -r BPFCheck.pcap | wc -l
--------------------------------------------------------------------
What is the Berkeley Packet Filter, using tcpdump, to capture traffic with a Source Port higher than 1024, utilizing the correct Transport Layer Headers? There should be 7805 packets.
Enter the Filter syntax with no spaces
sudo tcpdump -n 'tcp[0:2]>1024||udp[0:2]>1024' -r BPFCheck.pcap | wc -l
--------------------------------------------------------------------
Basic Analysis - udp
Level I Challenge
What is the Berkeley Packet Filter, using tcpdump, to capture all Packets with UDP protocol being set, utilizing the IPv4 or IPv6 Headers? There should be 1277 packets.
Enter the Filter syntax with no spaces
sudo tcpdump -n 'ip[9]=0x11||ip6[6]=0x11' -r BPFCheck.pcap | wc -l
--------------------------------------------------------------------
Basic Analysis - tcp flags 5
Level I Challenge
What is the Berkeley Packet Filter, using tcpdump, to capture only packets with the ACK/RST or ACK/FIN flag set, utilizing the correct Transport Layer Header? There should be 1201 packets.
Enter the Filter syntax with no spaces
sudo tcpdump -n 'tcp[13]=17||tcp[13]=20' -r BPFCheck.pcap | wc -l
--------------------------------------------------------------------
Basic Analysis - id 5
Level I Challenge
What is the Berkeley Packet Filter, using tcpdump, to capture all packets with an IP ID field of 213? There should be 10 packets.
Enter the Filter syntax with no spaces
sudo tcpdump -n 'ip[4:2]=213' -r BPFCheck.pcap | wc -l
--------------------------------------------------------------------
Basic Analysis - vlan 5
Level II Challenge
What is the Berkeley Packet Filter, using tcpdump, to capture all traffic that contains a VLAN tag? There should be 182 packets.
Enter the Filter syntax with no spaces
sudo tcpdump -n 'ether[12:2]=0x8100' -r BPFCheck.pcap | wc -l
--------------------------------------------------------------------
Basic Analysis - dns 5
Prompt
What is the Berkeley Packet Filter, using tcpdump, to capture all IPv4 packets relating to DNS? There should be 63 packets.
Enter the Filter syntax with no spaces
sudo tcpdump -n 'tcp[0:2]=53||udp[0:2]=53||tcp[2:2]=53||udp[2:2]=53' -r BPFCheck.pcap | wc -l
--------------------------------------------------------------------
Basic Analysis - CLIENT CONNECTIONS 5
What is the Berkeley Packet Filter, using tcpdump, to capture the initial packets from a client trying to initiate a TCP connection? There should be 3447 packets
Enter the Filter syntax with no spaces
sudo tcpdump -n 'tcp[13]=2' -r BPFCheck.pcap | wc -l
--------------------------------------------------------------------
Basic Analysis - OPEN PORTS 5
What is the Berkeley Packet Filter, using tcpdump, to capture the response packets from a server listening on an open TCP ports? There should be 277 packets
Enter the Filter syntax with no spaces
sudo tcpdump -n 'tcp[13]=18' -r BPFCheck.pcap | wc -l
--------------------------------------------------------------------
Basic Analysis - CLOSED PORTS 5
What is the Berkeley Packet Filter, using tcpdump, to capture the response packets from a server with closed TCP ports There should be 17 packets
Enter the Filter syntax with no spaces
sudo tcpdump -n 'tcp[13]=18||tcp[13]=4' -r BPFCheck.pcap | wc -l
sudo tcpdump -n 'tcp[13]=4' -r BPFCheck.pcap | wc -l
--------------------------------------------------------------------
Basic Analysis - WELL KNOWN PORTS 5
What is the Berkeley Packet Filter, using tcpdump, to capture all TCP and UDP packets sent to the well known ports? There should be 3678 packets
Enter the Filter syntax with no spaces
sudo tcpdump -n 'tcp[2:2]<1024||udp[2:2]<1024' -r BPFCheck.pcap | wc -l
--------------------------------------------------------------------
Basic Analysis - HTTP 5
What is the Berkeley Packet Filter, using tcpdump, to capture all HTTP traffic? There should be 1404 packets
Enter the Filter syntax with no spaces
sudo tcpdump -n 'tcp[0:2]=80||udp[0:2]=80||tcp[2:2]=80||udp[2:2]=80' -r BPFCheck.pcap | wc -l
sudo tcpdump -n 'tcp[0:2]=80||tcp[2:2]=80' -r BPFCheck.pcap | wc -l
--------------------------------------------------------------------
Basic Analysis - TELNET 5
What is the Berkeley Packet Filter, using tcpdump, to capture all telnet traffic? There should be 62 packets
Enter the Filter syntax with no spaces
sudo tcpdump -n 'tcp[0:2]=23||udp[0:2]=23' -r BPFCheck.pcap | wc -l
sudo tcpdump -n 'udp[0:2]=23' -r BPFCheck.pcap | wc -l
sudo tcpdump -n 'tcp[0:2]=23||udp[0:2]=23||tcp[2:2]=23||udp[2:2]=23' -r BPFCheck.pcap | wc -l
sudo tcpdump -n 'tcp[0:2]=23||tcp[2:2]=23' -r BPFCheck.pcap | wc -l
--------------------------------------------------------------------
Basic Analysis - ARP 5
What is the Berkeley Packet Filter, using tcpdump, to capture all ARP traffic? There should be 40 packets
Enter the Filter syntax with no spaces
sudo tcpdump -n 'ether[12:2]=0x0806' -r BPFCheck.pcap | wc -l
--------------------------------------------------------------------
Basic Analysis - EVIL BIT 5
What is the Berkeley Packet Filter, using tcpdump, to capture if the "Evil bit" is set? There should be 197 packets
Enter the Filter syntax with no spaces
sudo tcpdump -n 'ip[6]&128=128' -r BPFCheck.pcap | wc -l
--------------------------------------------------------------------
Basic Analysis - TOTAL CHAOS
5
What is the Berkeley Packet Filter, using tcpdump, to capture any packets containing the CHAOS protocol within an IPv4 header? There should be 139 packets
Enter the Filter syntax with no spaces
sudo tcpdump -n 'ip[6]&128=128' -r BPFCheck.pcap | wc -l
sudo tcpdump -n 'ether[12]=0x0804' -r BPFCheck.pcap | wc -l
sudo tcpdump -n 'ip[9]=16' -r BPFCheck.pcap | wc -l
--------------------------------------------------------------------
Basic Analysis - traceroute 10
Level I Challenge
What is the Berkeley Packet Filter, using tcpdump, to capture all IPv4 packets targeting just the beginning of potential traceroutes as it's entering your network. This can be from a Windows or Linux machine using their default settings? There should be 83 packets.
Enter the Filter syntax with no spaces
sudo tcpdump -n 'ether[12:2]=0x0800&&icmp||tcp[13]=2' -r BPFCheck.pcap | wc -l
sudo tcpdump -n 'icmp||tcp[13]=2' -r BPFCheck.pcap | wc -l
sudo tcpdump -n 'ip[9]=0x11||icmp[8]' -r BPFCheck.pcap | wc -l
sudo tcpdump -n '(ip[8]=1&&ip[9]=1)||(ip[8]=1&&ip[9]=11)' -r BPFCheck.pcap | wc -l
sudo tcpdump -n '(ip[8]=1&&ip[9]=1)||(ip[8]=1&&ip[9]=17)' -r BPFCheck.pcap | wc -l
--------------------------------------------------------------------
Basic Analysis - URGent EXFIL 10
What is the Berkeley Packet Filter, using tcpdump, to capture all packets where the URG flag is not set and URG pointer has a value? There should be 43 packets
Enter the Filter syntax with no spaces
sudo tcpdump -n 'tcp[13]&32!=32||tcp[18:2]=1' -r BPFCheck.pcap | wc -l
sudo tcpdump -n 'tcp[13]&32!=32&&tcp[18:2]=1' -r BPFCheck.pcap | wc -l
sudo tcpdump -n 'tcp[18:2]>0' -r BPFCheck.pcap | wc -l
sudo tcpdump -n 'tcp[13]&32!=32&&tcp[18:2]>0' -r BPFCheck.pcap | wc -l
    CWR     ECE     URG     ACK     PSH     RST     SYN    FIN
---------------------------------------------------------------
  HEX 8     4       2       1       8       4       2       1
----------------------------------------------------------------
 DEC 128    64      32      16      8       4       2       1
-----------------------------------------------------------------
DSCP 32    16      8       4       2       1        --      --
-----------------------------------------------------------------
Basic Analysis - NULL SCAN 10
What is the Berkeley Packet Filter, using tcpdump, to capture a TCP null scan to the host 10.10.10.10? There should be 19 packets
Enter the Filter syntax with no spaces
sudo tcpdump dst 10.10.10.10 -n 'tcp[13]=0' -r BPFCheck.pcap | wc -l
sudo tcpdump -n 'ip[16:4]=0x0a0a0a0a&&tcp[13]=0' -r BPFCheck.pcap | wc -l
-----------------------------------------------------------------
Basic Analysis - VLAN HOPPING 15
What is the Berkeley Packet Filter, using tcpdump, to capture an attacker using vlan hopping to move from vlan 1 to vlan 10? There should be 15 packets
Enter the Filter syntax with no spaces
sudo tcpdump -n '(ip[8]=1&&ip[9]=1)||(ip[8]=1&&ip[9]=17)' -r BPFCheck.pcap | wc -l
[12:4]&0xFFFF0FFF=0x81000001
[16:4]&0xFFFF0FFF=0x81000064
