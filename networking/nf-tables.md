
Quick reference-nftables in 10 minutes
Jump to navigation
Jump to search

Find below some basic concepts to know before using nftables.

table refers to a container of chains with no specific semantics.

chain within a table refers to a container of rules.

rule refers to an action to be configured within a chain.


Contents

    1 nft command line
        1.1 Tables
        1.2 Chains
        1.3 Rules
            1.3.1 Matches
                1.3.1.1 Ip
                1.3.1.2 Ip6
                1.3.1.3 Tcp
                1.3.1.4 Udp
                1.3.1.5 Udplite
                1.3.1.6 Sctp
                1.3.1.7 Dccp
                1.3.1.8 Ah
                1.3.1.9 Esp
                1.3.1.10 Comp
                1.3.1.11 Icmp
                1.3.1.12 Icmpv6
                1.3.1.13 Ether
                1.3.1.14 Dst
                1.3.1.15 Frag
                1.3.1.16 Hbh
                1.3.1.17 Mh
                1.3.1.18 Rt
                1.3.1.19 Vlan
                1.3.1.20 Arp
                1.3.1.21 Ct
                1.3.1.22 Meta
            1.3.2 Statements
                1.3.2.1 Verdict statements
                1.3.2.2 Log
                1.3.2.3 Reject
                1.3.2.4 Counter
                1.3.2.5 Limit
                1.3.2.6 Nat
                1.3.2.7 Queue
        1.4 Extras
            1.4.1 Export Configuration
            1.4.2 Monitor Events
    2 Nft scripting
        2.1 List ruleset
        2.2 Flush ruleset
        2.3 Load ruleset
    3 Examples
        3.1 Simple IP/IPv6 Firewall
```shell
nft command line

nft is the command line tool in order to interact with nftables at userspace.
Tables

family refers to a one of the following table types: ip, arp, ip6, bridge, inet, netdev.

% nft list tables [<family>]
% nft list table [<family>] <name> [-n] [-a]
% nft (add | delete | flush) table [<family>] <name>

The argument -n shows the addresses and other information that uses names in numeric format. The -a argument is used to display the handle.
Chains

type refers to the kind of chain to be created. Possible types are:

    filter: Supported by arp, bridge, ip, ip6 and inet table families.
    route: Mark packets (like mangle for the output hook, for other hooks use the type filter instead), supported by ip and ip6.
    nat: In order to perform Network Address Translation, supported by ip and ip6.

hook refers to an specific stage of the packet while it's being processed through the kernel. More info in Netfilter hooks.

    The hooks for ip, ip6 and inet families are: prerouting, input, forward, output, postrouting.
    The hooks for arp family are: input, output.
    The bridge family handles ethernet packets traversing bridge devices.
    The hook for netdev is: ingress.

priority refers to a number used to order the chains or to set them between some Netfilter operations. Possible values are: NF_IP_PRI_CONNTRACK_DEFRAG (-400), NF_IP_PRI_RAW (-300), NF_IP_PRI_SELINUX_FIRST (-225), NF_IP_PRI_CONNTRACK (-200), NF_IP_PRI_MANGLE (-150), NF_IP_PRI_NAT_DST (-100), NF_IP_PRI_FILTER (0), NF_IP_PRI_SECURITY (50), NF_IP_PRI_NAT_SRC (100), NF_IP_PRI_SELINUX_LAST (225), NF_IP_PRI_CONNTRACK_HELPER (300).

policy is the default verdict statement to control the flow in the base chain. Possible values are: accept (default) and drop. Warning: Setting the policy to drop discards all packets that have not been accepted by the ruleset.

% nft (add | create) chain [<family>] <table> <name> [ { type <type> hook <hook> [device <device>] priority <priority> \; [policy <policy> \;] } ]
% nft (delete | list | flush) chain [<family>] <table> <name>
% nft rename chain [<family>] <table> <name> <newname>

Rules

handle is an internal number that identifies a certain rule.

position is an internal number that is used to insert a rule before a certain handle.

% nft add rule [<family>] <table> <chain> <matches> <statements>
% nft insert rule [<family>] <table> <chain> [position <position>] <matches> <statements>
% nft replace rule [<family>] <table> <chain> [handle <handle>] <matches> <statements>
% nft delete rule [<family>] <table> <chain> [handle <handle>]
```
```shell
Matches

matches are clues used to access to certain packet information and create filters according to them.
Ip
ip match
dscp <value> 		

ip dscp cs1
ip dscp != cs1
ip dscp 0x38
ip dscp != 0x20
ip dscp {cs0, cs1, cs2, cs3, cs4, cs5, cs6, cs7, af11, af12, af13, af21, 
af22, af23, af31, af32, af33, af41, af42, af43, ef}

length <length> 	Total packet length 	

ip length 232
ip length != 233
ip length 333-435
ip length != 333-453
ip length { 333, 553, 673, 838}

id <id> 	IP ID 	

ip id 22
ip id != 233
ip id 33-45
ip id != 33-45
ip id { 33, 55, 67, 88 }

frag-off <value> 	Fragmentation offset 	

ip frag-off 222
ip frag-off != 233
ip frag-off 33-45
ip frag-off != 33-45
ip frag-off { 33, 55, 67, 88 }

ttl <ttl> 	Time to live 	

ip ttl 0
ip ttl 233
ip ttl 33-55
ip ttl != 45-50
ip ttl { 43, 53, 45 }
ip ttl { 33-55 }

protocol <protocol> 	Upper layer protocol 	

ip protocol tcp
ip protocol 6
ip protocol != tcp
ip protocol { icmp, esp, ah, comp, udp, udplite, tcp, dccp, sctp }

checksum <checksum> 	IP header checksum 	

ip checksum 13172
ip checksum 22
ip checksum != 233
ip checksum 33-45
ip checksum != 33-45
ip checksum { 33, 55, 67, 88 }
ip checksum { 33-55 }

saddr <ip source address> 	Source address 	

ip saddr 192.168.2.0/24
ip saddr != 192.168.2.0/24
ip saddr 192.168.3.1 ip daddr 192.168.3.100
ip saddr != 1.1.1.1
ip saddr 1.1.1.1
ip saddr & 0xff == 1
ip saddr & 0.0.0.255 < 0.0.0.127

daddr <ip destination address> 	Destination address 	

ip daddr 192.168.0.1
ip daddr != 192.168.0.1
ip daddr 192.168.0.1-192.168.0.250
ip daddr 10.0.0.0-10.255.255.255
ip daddr 172.16.0.0-172.31.255.255
ip daddr 192.168.3.1-192.168.4.250
ip daddr != 192.168.0.1-192.168.0.250
ip daddr { 192.168.0.1-192.168.0.250 }
ip daddr { 192.168.5.1, 192.168.5.2, 192.168.5.3 }

version <version> 	Ip Header version 	

ip version 4

hdrlength <header length> 	IP header length 	

ip hdrlength 0
ip hdrlength 15

Ip6
ip6 match
dscp <value> 		

ip6 dscp cs1
ip6 dscp != cs1
ip6 dscp 0x38
ip6 dscp != 0x20
ip6 dscp {cs0, cs1, cs2, cs3, cs4, cs5, cs6, cs7, af11, af12, af13, af21, af22, af23, af31, af32, af33, af41, af42, af43, ef}

flowlabel <label> 	Flow label 	

ip6 flowlabel 22
ip6 flowlabel != 233
ip6 flowlabel { 33, 55, 67, 88 }
ip6 flowlabel { 33-55 }

length <length> 	Payload length 	

ip6 length 232
ip6 length != 233
ip6 length 333-435
ip6 length != 333-453
ip6 length { 333, 553, 673, 838}

nexthdr <header> 	Next header type (Upper layer protocol number) 	

ip6 nexthdr {esp, udp, ah, comp, udplite, tcp, dccp, sctp, icmpv6}
ip6 nexthdr esp
ip6 nexthdr != esp
ip6 nexthdr { 33-44 }
ip6 nexthdr 33-44
ip6 nexthdr != 33-44

hoplimit <hoplimit> 	Hop limit 	

ip6 hoplimit 1
ip6 hoplimit != 233
ip6 hoplimit 33-45
ip6 hoplimit != 33-45
ip6 hoplimit {33, 55, 67, 88}
ip6 hoplimit {33-55}

saddr <ip source address> 	Source Address 	

ip6 saddr 1234:1234:1234:1234:1234:1234:1234:1234
ip6 saddr ::1234:1234:1234:1234:1234:1234:1234
ip6 saddr ::/64
ip6 saddr ::1 ip6 daddr ::2

daddr <ip destination address> 	Destination Address 	

ip6 daddr 1234:1234:1234:1234:1234:1234:1234:1234
ip6 daddr != ::1234:1234:1234:1234:1234:1234:1234-1234:1234::1234:1234:1234:1234:1234

version <version> 	IP header version 	

ip6 version 6


Tcp
tcp match
dport <destination port> 	Destination port 	

tcp dport 22
tcp dport != 33-45
tcp dport { 33-55 }
tcp dport {telnet, http, https }
tcp dport vmap { 22 : accept, 23 : drop }
tcp dport vmap { 25:accept, 28:drop }

sport < source port> 	Source port 	

tcp sport 22
tcp sport != 33-45
tcp sport { 33, 55, 67, 88}
tcp sport { 33-55}
tcp sport vmap { 25:accept, 28:drop }
tcp sport 1024 tcp dport 22

sequence <value> 	Sequence number 	

tcp sequence 22
tcp sequence != 33-45

ackseq <value> 	Acknowledgement number 	

tcp ackseq 22
tcp ackseq != 33-45
tcp ackseq { 33, 55, 67, 88 }
tcp ackseq { 33-55 }

flags <flags> 	TCP flags 	

tcp flags { fin, syn, rst, psh, ack, urg, ecn, cwr}
tcp flags cwr
tcp flags != cwr

window <value> 	Window 	

tcp window 22
tcp window != 33-45
tcp window { 33, 55, 67, 88 }
tcp window { 33-55 }

checksum <checksum> 	IP header checksum 	

tcp checksum 22
tcp checksum != 33-45
tcp checksum { 33, 55, 67, 88 }
tcp checksum { 33-55 }

urgptr <pointer> 	Urgent pointer 	

tcp urgptr 22
tcp urgptr != 33-45
tcp urgptr { 33, 55, 67, 88 }

doff <offset> 	Data offset 	

tcp doff 8


Udp
udp match
dport <destination port> 	Destination port 	

udp dport 22
udp dport != 33-45
udp dport { 33-55 }
udp dport {telnet, http, https }
udp dport vmap { 22 : accept, 23 : drop }
udp dport vmap { 25:accept, 28:drop }

sport < source port> 	Source port 	

udp sport 22
udp sport != 33-45
udp sport { 33, 55, 67, 88}
udp sport { 33-55}
udp sport vmap { 25:accept, 28:drop }
udp sport 1024 tcp dport 22

length <length> 	Total packet length 	

udp length 6666
udp length != 50-65
udp length { 50, 65 }
udp length { 35-50 }

checksum <checksum> 	UDP checksum 	

udp checksum 22
udp checksum != 33-45
udp checksum { 33, 55, 67, 88 }
udp checksum { 33-55 }


Udplite
udplite match
dport <destination port> 	Destination port 	

udplite dport 22
udplite dport != 33-45
udplite dport { 33-55 }
udplite dport {telnet, http, https }
udplite dport vmap { 22 : accept, 23 : drop }
udplite dport vmap { 25:accept, 28:drop }

sport < source port> 	Source port 	

udplite sport 22
udplite sport != 33-45
udplite sport { 33, 55, 67, 88}
udplite sport { 33-55}
udplite sport vmap { 25:accept, 28:drop }
udplite sport 1024 tcp dport 22

checksum <checksum> 	Checksum 	

udplite checksum 22
udplite checksum != 33-45
udplite checksum { 33, 55, 67, 88 }
udplite checksum { 33-55 }


Sctp
sctp match
dport <destination port> 	Destination port 	

sctp dport 22
sctp dport != 33-45
sctp dport { 33-55 }
sctp dport {telnet, http, https }
sctp dport vmap { 22 : accept, 23 : drop }
sctp dport vmap { 25:accept, 28:drop }

sport < source port> 	Source port 	

sctp sport 22
sctp sport != 33-45
sctp sport { 33, 55, 67, 88}
sctp sport { 33-55}
sctp sport vmap { 25:accept, 28:drop }
sctp sport 1024 tcp dport 22

checksum <checksum> 	Checksum 	

sctp checksum 22
sctp checksum != 33-45
sctp checksum { 33, 55, 67, 88 }
sctp checksum { 33-55 }

vtag <tag> 	Verification tag 	

sctp vtag 22
sctp vtag != 33-45
sctp vtag { 33, 55, 67, 88 }
sctp vtag { 33-55 }

chunk <type> 	Existence of a chunk with given type in packet 	

sctp chunk init exists
sctp chunk error missing

chunk <type> <field> 	A chunk's field value (implies chunk existence) 	<sourcex lang="bash">
```
```shell
sctp chunk init flags 0x1 sctp chunk data tsn 0x23 </source>
Dccp
dccp match
dport <destination port> 	Destination port 	

dccp dport 22
dccp dport != 33-45
dccp dport { 33-55 }
dccp dport {telnet, http, https }
dccp dport vmap { 22 : accept, 23 : drop }
dccp dport vmap { 25:accept, 28:drop }

sport < source port> 	Source port 	

dccp sport 22
dccp sport != 33-45
dccp sport { 33, 55, 67, 88}
dccp sport { 33-55}
dccp sport vmap { 25:accept, 28:drop }
dccp sport 1024 tcp dport 22

type <type> 	Type of packet 	

dccp type {request, response, data, ack, dataack, closereq, close, reset, sync, syncack}
dccp type request
dccp type != request


Ah
ah match
hdrlength <length> 	AH header length 	

ah hdrlength 11-23
ah hdrlength != 11-23
ah hdrlength {11, 23, 44 }

reserved <value> 		

ah reserved 22
ah reserved != 33-45
ah reserved {23, 100 }
ah reserved { 33-55 }

spi <value> 		

ah spi 111
ah spi != 111-222
ah spi {111, 122 }

sequence <sequence> 	Sequence Number 	

ah sequence 123
ah sequence {23, 25, 33}
ah sequence != 23-33


Esp
esp match
spi <value> 		

esp spi 111
esp spi != 111-222
esp spi {111, 122 }

sequence <sequence> 	Sequence Number 	

esp sequence 123
esp sequence {23, 25, 33}
esp sequence != 23-33


Comp
comp match
nexthdr <protocol> 	Next header protocol (Upper layer protocol) 	

comp nexthdr != esp
comp nexthdr {esp, ah, comp, udp, udplite, tcp, tcp, dccp, sctp}

flags <flags> 	Flags 	

comp flags 0x0
comp flags != 0x33-0x45
comp flags {0x33, 0x55, 0x67, 0x88}

cpi <value> 	Compression Parameter Index 	

comp cpi 22
comp cpi != 33-45
comp cpi {33, 55, 67, 88}


Icmp
icmp match
type <type> 	ICMP packet type 	

icmp type {echo-reply, destination-unreachable, source-quench, redirect, echo-request, time-exceeded, parameter-problem, timestamp-request, timestamp-reply, info-request, info-reply, address-mask-request, address-mask-reply, router-advertisement, router-solicitation}

code 	ICMP packet code 	

icmp code 111
icmp code != 33-55
icmp code { 2, 4, 54, 33, 56}

checksum <value> 	ICMP packet checksum 	

icmp checksum 12343
icmp checksum != 11-343
icmp checksum { 1111, 222, 343 }

id <value> 	ICMP packet id 	

icmp id 12343
icmp id != 11-343
icmp id { 1111, 222, 343 }

sequence <value> 	ICMP packet sequence 	

icmp sequence 12343
icmp sequence != 11-343
icmp sequence { 1111, 222, 343 }

mtu <value> 	ICMP packet mtu 	

icmp mtu 12343
icmp mtu != 11-343
icmp mtu { 1111, 222, 343 }

gateway <value> 	ICMP packet gateway 	

icmp gateway 12343
icmp gateway != 11-343
icmp gateway { 1111, 222, 343 }


Icmpv6
icmpv6 match
type <type> 	ICMPv6 packet type 	

icmpv6 type {destination-unreachable, packet-too-big, time-exceeded, echo-request, echo-reply, mld-listener-query, mld-listener-report, mld-listener-reduction, nd-router-solicit, nd-router-advert, nd-neighbor-solicit, nd-neighbor-advert, nd-redirect, parameter-problem, router-renumbering}

code 	ICMPv6 packet code 	

icmpv6 code 4
icmpv6 code 3-66
icmpv6 code {5, 6, 7}

checksum <value> 	ICMPv6 packet checksum 	

icmpv6 checksum 12343
icmpv6 checksum != 11-343
icmpv6 checksum { 1111, 222, 343 }

id <value> 	ICMPv6 packet id 	

icmpv6 id 12343
icmpv6 id != 11-343
icmpv6 id { 1111, 222, 343 }

sequence <value> 	ICMPv6 packet sequence 	

icmpv6 sequence 12343
icmpv6 sequence != 11-343
icmpv6 sequence { 1111, 222, 343 }

mtu <value> 	ICMPv6 packet mtu 	

icmpv6 mtu 12343
icmpv6 mtu != 11-343
icmpv6 mtu { 1111, 222, 343 }

max-delay <value> 	ICMPv6 packet max delay 	

icmpv6 max-delay 33-45
icmpv6 max-delay != 33-45
icmpv6 max-delay {33, 55, 67, 88}


Ether
ether match
saddr <mac address> 	Source mac address 	

ether saddr 00:0f:54:0c:11:04

type <type> 		

ether type vlan

Dst
dst match
nexthdr <proto> 	Next protocol header 	

dst nexthdr { udplite, ipcomp, udp, ah, sctp, esp, dccp, tcp, ipv6-icmp}
dst nexthdr 22
dst nexthdr != 33-45

hdrlength <length> 	Header Length 	

dst hdrlength 22
dst hdrlength != 33-45
dst hdrlength { 33, 55, 67, 88 }


Frag
frag match
nexthdr <proto> 	Next protocol header 	

frag nexthdr { udplite, comp, udp, ah, sctp, esp, dccp, tcp, ipv6-icmp, icmp}
frag nexthdr 6
frag nexthdr != 50-51

reserved <value> 		

frag reserved 22
frag reserved != 33-45
frag reserved { 33, 55, 67, 88}

frag-off <value> 		

frag frag-off 22
frag frag-off != 33-45
frag frag-off { 33, 55, 67, 88}

more-fragments <value> 		

frag more-fragments 0
frag more-fragments 0

id <value> 		

frag id 1
frag id 33-45


Hbh
hbh match
nexthdr <proto> 	Next protocol header 	

hbh nexthdr { udplite, comp, udp, ah, sctp, esp, dccp, tcp, icmpv6}
hbh nexthdr 22
hbh nexthdr != 33-45

hdrlength <length> 	Header Length 	

hbh hdrlength 22
hbh hdrlength != 33-45
hbh hdrlength { 33, 55, 67, 88 }


Mh
mh match
nexthdr <proto> 	Next protocol header 	

mh nexthdr { udplite, ipcomp, udp, ah, sctp, esp, dccp, tcp, ipv6-icmp }
mh nexthdr 22
mh nexthdr != 33-45

hdrlength <length> 	Header Length 	

mh hdrlength 22
mh hdrlength != 33-45
mh hdrlength { 33, 55, 67, 88 }

type <type> 		

mh type {binding-refresh-request, home-test-init, careof-test-init, home-test, careof-test, binding-update, binding-acknowledgement, binding-error, fast-binding-update, fast-binding-acknowledgement, fast-binding-advertisement, experimental-mobility-header, home-agent-switch-message}
mh type home-agent-switch-message
mh type != home-agent-switch-message

reserved <value> 		

mh reserved 22
mh reserved != 33-45
mh reserved { 33, 55, 67, 88}

checksum <value> 		

mh checksum 22
mh checksum != 33-45
mh checksum { 33, 55, 67, 88}


Rt
rt match
nexthdr <proto> 	Next protocol header 	

rt nexthdr { udplite, ipcomp, udp, ah, sctp, esp, dccp, tcp, ipv6-icmp }
rt nexthdr 22
rt nexthdr != 33-45

hdrlength <length> 	Header Length 	

rt hdrlength 22
rt hdrlength != 33-45
rt hdrlength { 33, 55, 67, 88 }

type <type> 		

rt type 22
rt type != 33-45
rt type { 33, 55, 67, 88 }

seg-left <value> 		

rt seg-left 22
rt seg-left != 33-45
rt seg-left { 33, 55, 67, 88}


Vlan
vlan match
id <value> 	Vlan tag ID 	

vlan id 4094
vlan id 0

cfi <value> 		

vlan cfi 0
vlan cfi 1

pcp <value> 		

vlan pcp 7
vlan pcp 3


Arp
arp match
ptype <value> 	Payload type 	

arp ptype 0x0800

htype <value> 	Header type 	

arp htype 1
arp htype != 33-45
arp htype { 33, 55, 67, 88}

hlen <length> 	Header Length 	

arp hlen 1
arp hlen != 33-45
arp hlen { 33, 55, 67, 88}

plen <length> 	Payload length 	

arp plen 1
arp plen != 33-45
arp plen { 33, 55, 67, 88}

operation <value> 		

arp operation {nak, inreply, inrequest, rreply, rrequest, reply, request}


Ct
ct match
state <state> 	State of the connection 	

ct state { new, established, related, untracked }
ct state != related
ct state established
ct state 8

direction <value> 	Direction of the packet relative to the connection 	

ct direction original
ct direction != original
ct direction {reply, original}

status <status> 	Status of the connection 	

ct status expected
(ct status & expected) != expected
ct status {expected,seen-reply,assured,confirmed,snat,dnat,dying}

mark [set] 	Mark of the connection 	

ct mark 0
ct mark or 0x23 == 0x11
ct mark or 0x3 != 0x1
ct mark and 0x23 == 0x11
ct mark and 0x3 != 0x1
ct mark xor 0x23 == 0x11
ct mark xor 0x3 != 0x1
ct mark 0x00000032
ct mark != 0x00000032
ct mark 0x00000032-0x00000045
ct mark != 0x00000032-0x00000045
ct mark {0x32, 0x2222, 0x42de3}
ct mark {0x32-0x2222, 0x4444-0x42de3}
ct mark set 0x11 xor 0x1331
ct mark set 0x11333 and 0x11
ct mark set 0x12 or 0x11
ct mark set 0x11
ct mark set mark
ct mark set mark map { 1 : 10, 2 : 20, 3 : 30 }

expiration 	Connection expiration time 	

ct expiration 30
ct expiration 30s
ct expiration != 233
ct expiration != 3m53s
ct expiration 33-45
ct expiration 33s-45s
ct expiration != 33-45
ct expiration != 33s-45s
ct expiration {33, 55, 67, 88}
ct expiration { 1m7s, 33s, 55s, 1m28s}

helper "<helper>" 	Helper associated with the connection 	

ct helper "ftp"

[original | reply] bytes <value> 		

ct original bytes > 100000
ct bytes > 100000

[original | reply] packets <value> 		

ct reply packets < 100

[original | reply] ip saddr <ip source address> 		

ct original ip saddr 192.168.0.1
ct reply ip saddr 192.168.0.1
ct original ip saddr 192.168.1.0/24
ct reply ip saddr 192.168.1.0/24

[original | reply] ip daddr <ip destination address> 		

ct original ip daddr 192.168.0.1
ct reply ip daddr 192.168.0.1
ct original ip daddr 192.168.1.0/24
ct reply ip daddr 192.168.1.0/24

[original | reply] l3proto <protocol> 		

ct original l3proto ipv4

[original | reply] protocol <protocol> 		

ct original protocol 6

[original | reply] proto-dst <port> 		

ct original proto-dst 22

[original | reply] proto-src <port> 		

ct reply proto-src 53

count [over] <number of connections> 		

ct count over 2

tcp dport 22 add @ssh_flood { ip saddr ct count over 2 } reject
[ which requires an existing ssh_flood set, ie. add set filter ssh_flood { type ipv4_addr; flags dynamic; } ]

Meta

meta matches packet by metainformation.
meta match
iifname <input interface name> 	Input interface name 	

meta iifname "eth0"
meta iifname != "eth0"
meta iifname {"eth0", "lo"}
meta iifname "eth*"

oifname <output interface name> 	Output interface name 	

meta oifname "eth0"
meta oifname != "eth0"
meta oifname {"eth0", "lo"}
meta oifname "eth*"

iif <input interface index> 	Input interface index 	

meta iif eth0
meta iif != eth0

oif <output interface index> 	Output interface index 	

meta oif lo
meta oif != lo
meta oif {eth0, lo}

iiftype <input interface type> 	Input interface type 	

meta iiftype {ether, ppp, ipip, ipip6, loopback, sit, ipgre}
meta iiftype != ether
meta iiftype ether

oiftype <output interface type> 	Output interface hardware type 	

meta oiftype {ether, ppp, ipip, ipip6, loopback, sit, ipgre}
meta oiftype != ether
meta oiftype ether

length <length> 	Length of the packet in bytes 	

meta length 1000
meta length != 1000
meta length > 1000
meta length 33-45
meta length != 33-45
meta length { 33, 55, 67, 88 }
meta length { 33-55, 67-88 }

protocol <protocol> 	ethertype protocol 	

meta protocol ip
meta protocol != ip
meta protocol { ip, arp, ip6, vlan }

nfproto <protocol> 		

meta nfproto ipv4
meta nfproto != ipv6
meta nfproto { ipv4, ipv6 }

l4proto <protocol> 		

meta l4proto 22
meta l4proto != 233
meta l4proto 33-45
meta l4proto { 33, 55, 67, 88 }
meta l4proto { 33-55 }

mark [set] 	Packet mark 	

meta mark 0x4
meta mark 0x00000032
meta mark and 0x03 == 0x01
meta mark and 0x03 != 0x01
meta mark != 0x10
meta mark or 0x03 == 0x01
meta mark or 0x03 != 0x01
meta mark xor 0x03 == 0x01
meta mark xor 0x03 != 0x01
meta mark set 0xffffffc8 xor 0x16
meta mark set 0x16 and 0x16
meta mark set 0xffffffe9 or 0x16
meta mark set 0xffffffde and 0x16
meta mark set 0x32 or 0xfffff
meta mark set 0xfffe xor 0x16

priority [set] <priority> 	tc class id 	

meta priority none
meta priority 0x1:0x1
meta priority 0x1:0xffff
meta priority 0xffff:0xffff
meta priority set 0x1:0x1
meta priority set 0x1:0xffff
meta priority set 0xffff:0xffff

skuid <user id> 	UID associated with originating socket 	

meta skuid {bin, root, daemon}
meta skuid root
meta skuid != root
meta skuid lt 3000
meta skuid gt 3000
meta skuid eq 3000
meta skuid 3001-3005
meta skuid != 2001-2005
meta skuid { 2001-2005 }

skgid <group id> 	GID associated with originating socket 	

meta skgid {bin, root, daemon}
meta skgid root
meta skgid != root
meta skgid lt 3000
meta skgid gt 3000
meta skgid eq 3000
meta skgid 3001-3005
meta skgid != 2001-2005
meta skgid { 2001-2005 }

rtclassid <class> 	Routing realm 	

meta rtclassid cosmos

pkttype <type> 	Packet type 	

meta pkttype broadcast
meta pkttype != broadcast
meta pkttype { broadcast, unicast, multicast}

cpu <cpu index> 	CPU ID 	

meta cpu 1
meta cpu != 1
meta cpu 1-3
meta cpu != 1-2
meta cpu { 2,3 }
meta cpu { 2-3, 5-7 }

iifgroup <input group> 	Input interface group 	

meta iifgroup 0
meta iifgroup != 0
meta iifgroup default
meta iifgroup != default
meta iifgroup {default}
meta iifgroup { 11,33 }
meta iifgroup {11-33}

oifgroup <group> 	Output interface group 	

meta oifgroup 0
meta oifgroup != 0
meta oifgroup default
meta oifgroup != default
meta oifgroup {default}
meta oifgroup { 11,33 }
meta oifgroup {11-33}

cgroup <group> 		

meta cgroup 1048577
meta cgroup != 1048577
meta cgroup { 1048577, 1048578 }
meta cgroup 1048577-1048578
meta cgroup != 1048577-1048578
meta cgroup {1048577-1048578}

Statements

statement is the action performed when the packet match the rule. It could be terminal and non-terminal. In a certain rule we can consider several non-terminal statements but only a single terminal statement.
Verdict statements

The verdict statement alters control flow in the ruleset and issues policy decisions for packets. The valid verdict statements are:

    accept: Accept the packet and stop the remain rules evaluation.
    drop: Drop the packet and stop the remain rules evaluation.
    queue: Queue the packet to userspace and stop the remain rules evaluation.
    continue: Continue the ruleset evaluation with the next rule.
    return: Return from the current chain and continue at the next rule of the last chain. In a base chain it is equivalent to accept
    jump <chain>: Continue at the first rule of <chain>. It will continue at the next rule after a return statement is issued
    goto <chain>: Similar to jump, but after the new chain the evaluation will continue at the last chain instead of the one containing the goto statement

Log
log statement
level [over] <value> <unit> [burst <value> <unit>] 	Log level 	

log
log level emerg
log level alert
log level crit
log level err
log level warn
log level notice
log level info
log level debug

group <value> [queue-threshold <value>] [snaplen <value>] [prefix "<prefix>"] 		

log prefix aaaaa-aaaaaa group 2 snaplen 33
log group 2 queue-threshold 2
log group 2 snaplen 33


Reject

The default reject will be the ICMP type port-unreachable. The icmpx is only used for inet family support.

More information on the Rejecting_traffic page.
reject statement
with <protocol> type <type> 		

reject
reject with icmp type host-unreachable
reject with icmp type net-unreachable
reject with icmp type prot-unreachable
reject with icmp type port-unreachable
reject with icmp type net-prohibited
reject with icmp type host-prohibited
reject with icmp type admin-prohibited
reject with icmpv6 type no-route
reject with icmpv6 type admin-prohibited
reject with icmpv6 type addr-unreachable
reject with icmpv6 type port-unreachable
reject with icmpx type host-unreachable
reject with icmpx type no-route
reject with icmpx type admin-prohibited
reject with icmpx type port-unreachable
ip protocol tcp reject with tcp reset

Counter
counter statement
packets <packets> bytes <bytes> 		

counter
counter packets 0 bytes 0


Limit
limit statement
rate [over] <value> <unit> [burst <value> <unit>] 	Rate limit 	

limit rate 400/minute
limit rate 400/hour
limit rate over 40/day
limit rate over 400/week
limit rate over 1023/second burst 10 packets
limit rate 1025 kbytes/second
limit rate 1023000 mbytes/second
limit rate 1025 bytes/second burst 512 bytes
limit rate 1025 kbytes/second burst 1023 kbytes
limit rate 1025 mbytes/second burst 1025 kbytes
limit rate 1025000 mbytes/second burst 1023 mbytes

Nat
nat statement
dnat to <destination address> 	Destination address translation 	

dnat to 192.168.3.2
dnat to ct mark map { 0x00000014 : 1.2.3.4}

snat to <ip source address> 	Source address translation 	

snat to 192.168.3.2
snat to 2001:838:35f:1::-2001:838:35f:2:::100

masquerade [<type>] [to :<port>] 	Masquerade 	

masquerade
masquerade persistent,fully-random,random
masquerade to :1024
masquerade to :1024-2048

Queue
queue statement
num <value> <scheduler> 		

queue
queue num 2
queue num 2-3
queue num 4-5 fanout bypass
queue num 4-5 fanout
queue num 4-5 bypass

Extras
Export Configuration

% nft export (xml | json)

Monitor Events

Monitor events from Netlink creating filters.

% nft monitor [new | destroy] [tables | chains | sets | rules | elements] [xml | json]


Nft scripting
List ruleset

% nft list ruleset

Flush ruleset

% nft flush ruleset

Load ruleset

Create a command batch file and load it with the nft interpreter,

% echo "flush ruleset" > /etc/nftables.rules
% echo "add table filter" >> /etc/nftables.rules
% echo "add chain filter input" >> /etc/nftables.rules
% echo "add rule filter input meta iifname lo accept" >> /etc/nftables.rules
% nft -f /etc/nftables.rules

or create an executable nft script file,

% cat << EOF > /etc/nftables.rules
> #!/usr/local/sbin/nft -f
> flush ruleset
> add table filter
> add chain filter input
> add rule filter input meta iifname lo accept
> EOF
% chmod u+x /etc/nftables.rules
% /etc/nftables.rules

or create an executable nft script file from an already created ruleset,

% nft list ruleset > /etc/nftables.rules
% nft flush ruleset
% nft -f /etc/nftables.rules
```
```shell

Examples
Simple IP/IPv6 Firewall

flush ruleset

table firewall {
  chain incoming {
    type filter hook input priority 0; policy drop;

    # established/related connections
    ct state established,related accept

    # loopback interface
    iifname lo accept

    # icmp
    icmp type echo-request accept

    # open tcp ports: sshd (22), httpd (80)
    tcp dport {ssh, http} accept
  }
}

table ip6 firewall {
  chain incoming {
    type filter hook input priority 0; policy drop;

    # established/related connections
    ct state established,related accept

    # invalid connections
    ct state invalid drop

    # loopback interface
    iifname lo accept

    # icmp
    # routers may also want: mld-listener-query, nd-router-solicit
    icmpv6 type {echo-request,nd-neighbor-solicit} accept

    # open tcp ports: sshd (22), httpd (80)
    tcp dport {ssh, http} accept
  }
}
```
Category:

    Pages using deprecated source tags

Navigation menu

    Log in

    Page
    Discussion

    Read
    View source
    View history

Search

    Main page
    Recent changes
    Random page
    Help about MediaWiki

Tools

    What links here
    Related changes
    Special pages
    Printable version
    Permanent link
    Page information

    This page was last edited on 1 October 2021, at 15:43.
    Content is available under GNU Free Documentation License 1.3 or later unless otherwise noted.

    Privacy policy
    About nftables wiki
    Disclaimers

    GNU Free Documentation License 1.3 or later
    Powered by MediaWiki

