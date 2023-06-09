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
   1. Prep
   2. post
   3. int
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



```
