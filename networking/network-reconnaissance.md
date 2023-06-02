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
