type of firewall
1. host based
   1. your computer can do it  dual niced
2. network bases like an actual firewall(applicane)
3. Cloud
# Linux hooks 
1. NF_IP_PRE_ROUTING
2. NF_IP_LOCAL_IN
3. NF_IP_FORWARD
4. NF_IP_LOCAL_OUT
5. NF_IP_POST_ROUTING

1. The Filter Table
   1. makes decisions about to let a packet proceed to destination or drop it
2. NAT Table
   1. changes the sources or destination address
3. Mangle Table
   1. this allows you to manipulate the packet to change a bunch of fields

1. Tables - contain chains
   1. Filter
   2. NAT
      1. DNAT - this will translate traffice both ways
      2. 
   3. Mangle
      1. changin individual items
         1. DSCP
         2. TCPMSS
         3. TTL 
         4. ECN 
2. Chains - contain rules
   1. Prep10.10.0.40
   4. out
   5. forward
3. rules - dictate what to mtach


-inbound rule, no destination address
--but you can put a sources
outbound traffic, do not but a source, but put a destination
ouput no source, DO specify a source address
input no destination, DO specify destination
all NATing happens on the public facing interface
```shell
#Filter
sudo iptables -t filter -A INPUT -p tcp --dport 23 -j DROP #drop all inbound telnet
sudo iptables -t filter -A INPUT -p tcp -m multiport --dport 31,32,33,34 -j DROP 
sudo iptables -t filter -A INPUT -p tcp -m multiport --ports 31,32,33,34 -j DROP

#NAT
sudo iptable -t NAT -a INPUT -o eth0 

#mangle
sudo iptables -t mangle -D 



sudo iptables -t filter -F #flush all iptable rules
iptables -t filter -A INPUT -s 10.10.0.40 -p tcp --dport 22 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -t filter -A OUTPUT -d 10.10.0.40 -p tcp --sport 22 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -t filter -nL --line-numbers
iptables -t filter -D OUTPUT 1
sudo shutdown -r 5

iptables -t filter -A OUTPUT -d 10.10.0.40 -p tcp --dport 22 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -t filter -A INPUT -t tcp -m multiport --ports 22,23,80 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -t filter -D INPUT 1
iptables -t filter -D OUTPUT 1
iptables -t filter -D OUTPUT 1

iptables -t filter -D OUTPUT 1
        iptables -t filter -A OUTPUT -p udp -m multiport --ports 6579,4444 -j ACCEPT

iptables -t filter -P FORWARD ACCEPT
iptables -t filter -P FORWARD ACCEPT


#nfttables
nft add table ip MY_TABLE
nft list ruleset
nft add chain ip MY_TABLE CHAIN_1 { type filter hook input priority 0 \; policy accept \; }

nft add rule ip MY_TABLE CHAIN_1 tcp dport {22, 23, 80} ct state {new, established} accept
nft add rule ip MY_TABLE CHAIN_2 tcp sport {22, 23, 80} ct state {new, established} accept
        iptables -t filter -A OUTPUT -p udp -m multiport --ports 6579,4444 -j ACCEPT

nft add rule ip MY_TABLE CHAIN_2 tcp dport {22, 23, 80} ct state {new, established} accept
nft add chain ip MY_TABLE CHAIN_2 {\; policy drop \;}
nft add chain ip MY_TABLE CHAIN_1 {\; policy drop \;}

nft list ruleset -A
nft delete rule MY_TABLE CHAIN_1 handle11
nft flush chain ip MY_TABLE CHAIN_1
```
------------------------------------------------------------------------------------------------------------------------------
```shell
    #Allow New and Established traffic to/from via SSH, TELNET, and RDP
        iptables -t filter -A INPUT -p tcp -m multiport --ports 22,23,3389 -m state --state NEW,ESTABLISHED -j ACCEPT
        iptables -t filter -A OUTPUT -p tcp -m multiport --ports 22,23,3389 -m state --state NEW,ESTABLISHED -j ACCEPT
    #Change the Default Policy in the Filter Table for the INPUT, OUTPUT, and FORWARD chains to DROP
        iptables -t filter -P INPUT DROP
        iptables -t filter -P OUTPUT DROP
        iptables -t filter -P FORWARD DROP
    #Only allow Pivot to perform ping (ICMP) operations to/from
        iptables -t filter -A INPUT -s 10.10.0.40 -p icmp --icmp-type echo-request -j ACCEPT
        iptables -t filter -A OUTPUT -d 10.10.0.40 -p icmp --icmp-type echo-reply -j ACCEPT
        iptables -t filter -A INPUT -s 10.10.0.40 -p icmp --icmp-type echo-reply -j ACCEPT
        iptables -t filter -A OUTPUT -d 10.10.0.40 -p icmp --icmp-type echo-request -j ACCEPT
    #Allow ports 6579 and 4444 for both udp and tcp traffic
        iptables -t filter -A INPUT -p tcp -m multiport --ports 6579,4444 -j ACCEPT
        iptables -t filter -A INPUT -p udp -m multiport --ports 6579,4444 -j ACCEPT
        iptables -t filter -A OUTPUT -p udp -m multiport --ports 6579,4444 -j ACCEPT
        iptables -t filter -A OUTPUT -p tcp -m multiport --ports 6579,4444 -j ACCEPT
    #Allow New and Established traffic to/from via HTTP
        iptables -t filter -A INPUT -p tcp -m multiport --ports 80 -m state --state NEW,ESTABLISHED -j ACCEPT
        iptables -t filter -A OUTPUT -p tcp -m multiport --ports 80 -m state --state NEW,ESTABLISHED -j ACCEPT
```
IP/NFTables - Filtering T1
Issue: Somewhat unclear rule direction
Rule: 'Only allow Pivot to perform ping (ICMP) operations to/from"
Advised Change: "Only allow Pivot to perform and receive ping (ICMP) operations"
This will make is clear the Pivot should be able to reiceve pings from the Blue Host
------------------------------------------------------------------------------------------------------------------------------
IP/NFTables - Filtering T3 5
```shell
    #Allow New and Established traffic to/from via SSH, TELNET, and RDP
    iptables -t filter -A INPUT -p tcp -m multiport --ports 22,23,3389 -m state --state NEW,ESTABLISHED -j ACCEPT
    iptables -t filter -A OUTPUT -p tcp -m multiport --ports 22,23,3389 -m state --state NEW,ESTABLISHED -j ACCEPT
    #Change the Default Policy in the Filter Table for the INPUT, OUTPUT, and FORWARD chains to DROP
    iptables -t filter -P INPUT DROP
    iptables -t filter -P OUTPUT DROP
    iptables -t filter -P FORWARD DROP
    #Allow New and Established traffic to/from via HTTP
    iptables -t filter -A INPUT -p tcp -m multiport --ports 80 -m state --state NEW,ESTABLISHED -j ACCEPT
    iptables -t filter -A OUTPUT -p tcp -m multiport --ports 80 -m state --state NEW,ESTABLISHED -j ACCEPT
    #Once these steps have been completed and tested, go to Pivot and open up a netcat listener on port 9003 and wait up to 2 minutes for your flag. If you did not successfully accomplish the tasks above, then you will not receive the flag.
```
------------------------------------------------------------------------------------------------------------------------------
```shell
nft add table ip MY_TABLE
nft list ruleset
nft add chain ip MY_TABLE INPUT { type filter hook input priority 0 \; policy accept \; }
nft add chain ip MY_TABLE OUTPUT { type filter hook output priority 0 \; policy accept \; }
#Input Table
#Allow New and Established traffic to/from via SSH, TELNET, and RDP
nft add rule ip MY_TABLE INPUT tcp dport {22, 23, 3389} ct state {new, established} accept
nft add rule ip MY_TABLE INPUT tcp sport {22, 23, 3389} ct state {new, established} accept
#Change your chains to now have a policy of Drop
nft add chain ip MY_TABLE INPUT {\; policy drop \;}
#Allow ping (ICMP) requests to and from the Pivot.
nft add rule ip MY_TABLE INPUT icmp type 8 ip saddr 10.10.0.40 accept
nft add rule ip MY_TABLE INPUT icmp type 0 ip saddr 10.10.0.40 accept
#Allow ports 5050 and 5150 for both udp and tcp traffic to/from
nft add rule ip MY_TABLE INPUT tcp dport {5050, 5150} ct state {new, established} accept
nft add rule ip MY_TABLE INPUT tcp sport {5050, 5150} ct state {new, established} accept
#Allow New and Established traffic to/from via HTTP
nft add rule ip MY_TABLE INPUT tcp dport {80} ct state {new, established} accept
nft add rule ip MY_TABLE INPUT tcp sport {80} ct state {new, established} accept

----------------------------------------------------------------------------------------
#Output Table
##Allow New and Established traffic to/from via SSH, TELNET, and RDP
nft add rule ip MY_TABLE OUTPUT tcp sport {22, 23, 3389} ct state {new, established} accept
nft add rule ip MY_TABLE OUTPUT tcp dport {22, 23, 3389} ct state {new, established} accept
#Change your chains to now have a policy of Drop
nft add chain ip MY_TABLE OUTPUT {\; policy drop \;}
#Allow ping (ICMP) requests to and from the Pivot.
nft add rule ip MY_TABLE OUTPUT icmp type 8 ip daddr 10.10.0.40 accept
nft add rule ip MY_TABLE OUTPUT icmp type 0 ip daddr 10.10.0.40 accept
#Allow ports 5050 and 5150 for both udp and tcp traffic to/from
nft add rule ip MY_TABLE OUTPUT tcp dport {5050, 5150} ct state {new, established} accept
nft add rule ip MY_TABLE OUTPUT tcp sport {5050, 5150} ct state {new, established} accept
#Allow New and Established traffic to/from via HTTP
nft add rule ip MY_TABLE OUTPUT tcp dport {80} ct state {new, established} accept
nft add rule ip MY_TABLE OUTPUT tcp sport {80} ct state {new, established} accept
t2 9f7a33941828bdafd2755fd20176cdf4
t3 05e5fb96e2a117e01fc1227f1c4d664c
t1 467accfb25050296431008a1357eacb1
467accfb25050296431008a1357eacb1_9f7a33941828bdafd2755fd20176cdf4_05e5fb96e2a117e01fc1227f1c4d664c
echo "467accfb25050296431008a1357eacb1_9f7a33941828bdafd2755fd20176cdf4_05e5fb96e2a117e01fc1227f1c4d664c" | md5sum
953e720e688941b15b72c098022c51c3 
result d3b88e04de1e76482a1972f36734a7d8
----------------------------------------------------------------------------------------


nft add rule ip MY_TABLE CHAIN_2 tcp dport {22, 23, 80} ct state {new, established} accept
nft add chain ip MY_TABLE CHAIN_2 {\; policy drop \;}
nft add chain ip MY_TABLE CHAIN_1 {\; policy drop \;}

nft list ruleset -A
nft delete rule MY_TABLE INPUT handle 21
nft flush chain ip MY_TABLE CHAIN_1

```
sudo snort -r {/path/pcap} -c {/path/rules}

alert tcp 10.10.0.40 any any (msg: "Invalid telnet login";sid:1001;content:"bad password";nocase;flow:to_client , established ;threshhold:type both,track by_src ,count 3 , seconds 10;


sudo snort -D -c snort.conf -l /var/log/snort
sudo tcpdump -r snort.log.1686592904 -x
sudo tcpdump -r snort.log.1686592904 -x
sudo snort -D -c snort.conf -l /var/log/snort
sudo snort -D -c /etc/snort/rules/new.rules -l /var/log/snort
sudo snort -r /home/activity_resources/pcaps/ids.pcap -c /etc/snort/rules/cow.rules

START FLAG: this_whole_ids_is_out_of_line

T4 Snort Server (Bob): 10.50.30.212

Login Credentials: netN_studentX:passwordX (N=net number and X=student number)

Alt SSH Port: 25

* DO NOT CREATE YOUR RULES ON THIS SYSTEM * 


alert icmp any any -> any any (msg:"Cows";content:"|DEADBEEF|";sid:1000001;)

alert icmp any any -> any any (msg:ICMP detected; sid:111; rev:1;)

alert icmp 0.0.0.255 any -> any any (msg:"DMZ Ping";itype:8;icode:0;sid:1000002;)
