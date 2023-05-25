

10.50.10.10 -> Openstack -> 10.50.X.X ->(10.10.0.30)Network 
                            10.50.X.X ->(10.10.0.40)Network 
fugitive port = ephemeral
# SSH Connection
1. 3-way handshake
2. Established Connection
3. Now key exchange
   1. client -> public (user key)
   2. public -> client (host key)
4. -X negotiate x11 x40(similar to RDP capabilities)
 ```shell
 tcp        0      0 127.0.0.1:6010          0.0.0.0:*               LISTEN      -   
```
5. the CLIENT creates the symmetric key
   1. pulls key from hosts file and encrypts the connection
# Get them GUIs
1. terminator
2. 
# Situation Awareness
1. ip addr - shows ipconfig
2. ip neighbor(future) = replaces ARP -a
3. ip route = shows routing table
   1. shows loopback
4. netstat -antlp
   1. -n = no inverse lookup(no name)
   2. -t = TCP
   3. -l = Listening ports only
   4. -p(optional) = process ID for the 
5. cat /etc/hosts -> dns
6. cat /etc/services
# Ip Classes
Class A addresses are in the range of 1-126.xxx.xxx.xxx
Class B addresses are in the range of 128-191.xxx.xxx.xxx
Class C addresses are in the range of 192-223.xxx.xxx.xxx
# RDP
XFREERDP Syntax: xfreerdp /v:10.50.x.x /u:student /p:password /size:1920x1000 +clipboard
# Data Link Sublayers
- A
- P
- S
- T
- N
- D
  - LLC ^ 802.2
  - MAC v IEEE
# Types of ARP
Gratutious ARP 
Proxy ARP - multiple arps but same mac address
# sudo tcpdump arp -x
