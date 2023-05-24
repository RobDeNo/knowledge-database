# Linux Auditing and Logging XML 15
## <scaninfo type="syn" protocol="tcp" numservices="200" services="1-200"/>
```xml
#answer <scaninfo/>
```
----------------------------------
#Linux Auditing and Logging XML 25
## Identify one of the XML attributes in the output below 
<scaninfo type="syn" protocol="tcp" numservices="200" services="1-200"/>
Flag format: value="pair"
```shell
#answer type="syn"
```
----------------------------------

# RFC is Syslog
```shell
RFC 5424
```
----------------------------------
# What is the numerical code assigned to the facility dealing with authorization?
```shell
4
```
----------------------------------
# severity codes are defined in the standard that defines syslog?
```shell
8
```
----------------------------------
# severity is assigned to system instability messages?
```shell
0
```
----------------------------------
# Linux Auditing and Logging Syslog 25
## In the legacy rules section of the file, how many severities are logged to 0.log? Flag: Total number of severities
```shell
8 severities
```
----------------------------------
# show facil
Flag format: facility,facility,facility,severity
```shell
2,9,12.=5 /var/log/not.log
mail,clock,ntp,notice
```
----------------------------------
# show facil
```shell
auth,authpriv,8,@@10.30.0.1:514
.* action(type="omfwd" target="192.0.2.1" port="10514" protocol="tcp")
# it is equivalent to the following obsolete legacy format line:
*.* @@192.0.2.1:10514 # do NOT use this any longer!
auth,authpriv,8,10.30.0.1
```
----------------------------------
# logs on local
```shell
YES
auth,authpriv.*		-/var/log/auth.log
```
----------------------------------
# remote logs
Flag format: F,S,Layer 4 connection Type
```shell
kern.!=info  @10.84.0.1:514
0,7,udp
#Kern short for kernel is shown at the 0 level
#!=info means all the serverity code minux the code the "info" slot. 
#the @ sign infront of the connection determines the layer 4 protocol is UDP
```
----------------------------------
# xpath parse
Sample Output (without piping to MD5SUM)
addr="XXX.xxx.xxx.xxx"
```shell
#xpath example
Xpath Syntax: xpath -q -e '//element/@attribute' file.xml
xpath -q -e '//address/@addr' /home/garviel/output.xml | md5sum
#-q Be quiet. Output only errors (and no separator) on stderr.
#-e query{} this si what you are querying
```
----------------------------------
# xpath ip and port
addr="xx.xxx.xx.xx"
portid="xx"
```shell
xpath -q -e //address/@addr /home/garviel/output.xml #GOOD
xpath -q -e '//address/@addr | //port/@portid' /home/garviel/output.xml #GOOD
xpath -q -e '//address/@addr' /home/garviel/output.xml #GOOD
xpath -q -e '//address/@addr' /home/garviel/output.xml | '//port/@portid' #BAAAAAD#

xpath -q -e '//address/@addr | //port/@portid' /home/garviel/output.xml |md5sum
```
----------------------------------
# json pretty

```shell
#See Json Cheat sheets
# Output a JSON file, in pretty-print format:
jq
jq "." /home/garviel/conn.log | md5sum
25ebedf7442e470eaaa48b5f7d5b96f4
```
----------------------------------
# json unique
```shell
jq '.foo[] | {id.orig_h}'
jq 'unique{"id.orig_h"}' /home/garviel/conn.log #unique is not it
jq '{"id.orig_h"}' /home/garviel/conn.log | sort | uniq -c | wc -l
#jq runs the tool to read files in jq format
#'{"id.orig_h"}' is selecting the field with the ip, then parsing the conn.log file
#the output has a lot of spaces and sort sort function will put the ip's in order and remove the extra spaces
#uniq -c will remove duplicates lines 
#add the ipv6 takeout
count the number of lins
```
----------------------------------
# filter file connections in conn log
```shell
jq '.|select(.resp_bytes>40) | ."id.orig_h"' /conn.log
```
----------------------------------
# ip and port in use
xpath -q -e '//address/@addr | //port/@portid | //state/@state="open"' /home/garviel/output.xml |md5sum
xpath -q -e 
xpath -q -e '//address/@addr | //port/@portid | //state[@state='open]' /home/garviel/output.xml | grep -v "closed\|up" | md5sum
//title[@lang='en']
xpath -q -e '//address/@addr | //port/@portid | //state[@state="open"]' /home/garviel/output.xml
xpath -q -e '//state@state='open']' /home/garviel/output.xml
<host starttime="1615317877" endtime="1615318249"><status state="up" reason="user-set" reason_ttl="0"/>
xpath -q -e '//status/@state' /home/garviel/output.xml
xpath -q -e '//status/@state' /home/garviel/output.xml
```
----------------------------------
#
```shell
passwd -exec /bin/sh \;
2h,30m,find /etc/passwd -exec /bin/sh \;,2
```
