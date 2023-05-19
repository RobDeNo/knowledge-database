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

# Linux Auditing and Logging Standards 15
## What RFC is Syslog?
```shell
RFC 5424
```
----------------------------------
# Linux Auditing and Logging Standards 25
## Challenge only allows 3 attempts. What is the numerical code assigned to the facility dealing with authorization?
```shell
4
```
----------------------------------
# Linux Auditing and Logging Standards 35
## How many severity codes are defined in the standard that defines syslog?
```shell
8
```
----------------------------------
# Linux Auditing and Logging Standards 45
## What severity is assigned to system instability messages?
```shell
0
```
----------------------------------
# Linux Auditing and Logging Syslog 15
## In the legacy rules section of the file, what facility is logged to 0.log?
```shell
kern
```
----------------------------------
# Linux Auditing and Logging Syslog 25
## In the legacy rules section of the file, how many severities are logged to 0.log? Flag: Total number of severities
```shell
8 severities
```
----------------------------------
# Linux Auditing and Logging Syslog 35
## In the legacy rules section of the file, how many severities are logged to 4min.log? List the severities from highest severity (lowest numerical listed) to lowest severity (highest numerical listed) using their severity name. Flag format: name,name,name

```shell
Emergency,Alert,Critical,Error,Warning
```
----------------------------------
# Linux Auditing and Logging Syslog 45
## In the legacy rules section of the file, how many severities are logged to 4sig.log? List the severities from highest severity (lowest numerical listed) to lowest severity (highest numerical listed), using their severity name. Flag format: name,name,name
Hint: I’m sure they made a man page for this. Read the downloaded file for some links.

```shell
Notice,Informational,Debug
```
----------------------------------
# Linux Auditing and Logging Syslog 55
## What is being logged in not.log? Provide the facilities from lowest facility to highest facility numerically, and the severity being logged. (List only the first word for each.)
Flag format: facility,facility,facility,severity
```shell
2,9,12.=5 /var/log/not.log
mail,clock,ntp,notice
```
----------------------------------
# Linux Auditing and Logging Syslog 65
## What facilities and what severities are being sent to a remote server over a reliable connection using port 514? Provide the facility names, number of severities, and the correct destination IP address.
Flag format: F,F,#,IP
```shell
auth,authpriv,8,@@10.30.0.1:514
.* action(type="omfwd" target="192.0.2.1" port="10514" protocol="tcp")
# it is equivalent to the following obsolete legacy format line:
*.* @@192.0.2.1:10514 # do NOT use this any longer!
auth,authpriv,8,10.30.0.1
```
----------------------------------
# Linux Auditing and Logging Syslog 75
## Use the answer from Syslog 6 for this question. Do logs that match this filter ever get saved on the local machine?
```shell
YES
auth,authpriv.*		-/var/log/auth.log
```
----------------------------------
# Linux Auditing and Logging Syslog 85
## What messages are being sent to 10.84.0.1? Provide the facility number, the number (amount) of severity codes, and Layer 4 connection type as the answer.
Flag format: F,S,Layer 4 connection Type
```shell
kern.!=info  @10.84.0.1:514
0,7,udp
#Kern short for kernel is shown at the 0 level
#!=info means all the serverity code minux the code the "info" slot. 
#the @ sign infront of the connection determines the layer 4 protocol is UDP
```
----------------------------------
# Linux Auditing and Logging XML 310
# Parse all of the IP addresses from the file using XPATH queries
/home/garviel/output.xml
https://www.w3schools.com/xml/xpath_intro.asp
HINT:
http://xpather.com/
http://www.whitebeam.org/library/guide/TechNotes/xpathtestbed.rhtm
Sample Output (without piping to MD5SUM)
addr="XXX.xxx.xxx.xxx"
addr="XXX.xxx.xxx.xxx"
addr="XXX.xxx.xxx.xxx"
addr="XXX.xxx.xxx.xxx"
addr="XXX.xxx.xxx.xxx"
addr="XXX.xxx.xxx.xxx"
--TRIMMED--
Flag format: md5 hash of output
```shell
#xpath example
Xpath Syntax: xpath -q -e '//element/@attribute' file.xml
xpath -q -e '//address/@addr' /home/garviel/output.xml | md5sum
#-q Be quiet. Output only errors (and no separator) on stderr.
#-e query{} this si what you are querying
```
----------------------------------
# Linux Auditing and Logging XML 4 10
## Select all of the IP addresses and ports using a single XPATH Union Statement
File: /home/garviel/output.xml
 Pipe the result to md5sum for the flag
HINT:
https://librarycarpentry.org/lc-webscraping/02-xpath/index.html
Sample Output (without piping to MD5SUM)
addr="xx.xxx.xx.xx"
addr="xx.xxx.xx.xx"
addr="xx.xxx.xx.xx"
addr="xx.xxx.xx.xx"
portid="xx"
addr="10.50.29.6"
addr="xx.xxx.xx.xx"
portid="22"
--TRIMMED--
```shell
xpath -q -e //address/@addr /home/garviel/output.xml #GOOD
xpath -q -e '//address/@addr | //port/@portid' /home/garviel/output.xml #GOOD
xpath -q -e '//address/@addr' /home/garviel/output.xml #GOOD
xpath -q -e '//address/@addr' /home/garviel/output.xml | '//port/@portid' #BAAAAAD#

xpath -q -e '//address/@addr | //port/@portid' /home/garviel/output.xml |md5sum

```
----------------------------------
# Linux Auditing and Logging JSON 110
## Use jq to pretty print the JSON file conn.log. Hash the pretty-printed file with md5sum for the flag.
File: /home/garviel/conn.log
Sample JSON "Pretty Print" Output (without piping to MD5SUM)
  "ts": 1615383120.585641,
  "uid": "C9ybUDHykHdrh0h93",
  "id.orig_h": "10.50.24.73",
  "id.orig_p": 38156,
  "id.resp_h": "192.168.65.20",
  "id.resp_p": 443,
  "proto": "tcp",
  "duration": 2.8133392333984375e-05,
  "orig_bytes": 0,
  "resp_bytes": 0,

HINT:

    https://jqplay.org/

    https://docs.jsonata.org/simple

    https://stedolan.github.io/jq/manual/


```shell
#See Json Cheat sheets
# Output a JSON file, in pretty-print format:
jq
jq "." /home/garviel/conn.log | md5sum
25ebedf7442e470eaaa48b5f7d5b96f4

```
----------------------------------
# Linux Auditing and Logging JSON 210
## File : /home/garviel/conn.log This file is a conn.log made in Zeek (Bro) with data about TCP/IP connections.
Use jq to locate and count the unique originating endpoint IP addresses in the file. Enter the number of unique originating IP addresses as the flag.
Flag format: #
HINT: Use this link to understand the JSON object’s attributes
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
# Linux Auditing and Logging JSON 310
## File: /home/garviel/conn.log This file is a conn.log made in Zeek (Bro) with data about TCP/IP connections.
Use jq to locate and count connections where the destination IP sent more than 40 bytes to the source IP.
Flag format: #

```shell
jq '{"resp_ip_bytes"}' /home/garviel/conn.log | sort
jq '{"resp_bytes"}' /home/garviel/conn.log | sort | grep -v '40\|null\|resp_bytes": 0' | uniq -c
jq '{"resp_bytes"}' /home/garviel/conn.log | sort | grep -v '40^Cnull\|"resp_bytes": 0\|{\|}' | uniq -c #Noooo
jq '{"resp_bytes">40}' /home/garviel/conn.log | sort | grep -v '"resp_bytes": 40\|null\|"resp_bytes": 0\|{\|}' | uniq -c

jq '"resp_bytes">40' /home/garviel/conn.log
jq '.|.select("resp_bytes>40") | "id.orig_h"' /home/garviel/conn.log
jq '.|select(.resp_bytes>40) | ."id.orig_h"' /home/garviel/conn.log


```
----------------------------------
# 
## 
```shell

```
----------------------------------
# 
## 
```shell

```
----------------------------------
# Linux Auditing and Logging Whut 310
## Identify the Cyber Attack Technique that Balrog is trying on the machine.
```shell
Credential Access
```
----------------------------------
# 
## 
```shell

```
----------------------------------
# Linux Auditing and Logging XML 515
## File: /home/garviel/output.xml Select every IP address with open (in use) ports using XPATH queries and XPATH axes.
Pipe the result to md5sum for the flag
Sample Output (without piping to MD5SUM)
addr="10.50.29.5"
portid="xx"
addr="xx.xx.xx.xx"
portid="xx"
--TRIMMED--
```shell
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
extract it, 2 variable to interate down, back into main folder