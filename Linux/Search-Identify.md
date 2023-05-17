
# [grep](/Linux/bash/grep-info.md) 
```Shell
- The grep filter searches a file for a particular pattern of characters, and displays all lines that contain that pattern
grep openstack
grep -v openstack # anything -4 the four lines before each result
grep lodge /etc/group #look for group in groups
grep --p '^([0-9A-Fa-f]{2}-){5}[0-9A-Fa-f]{2}$' #look for mac
cat /etc/passwd | grep -v "nologin" | grep -v "bash" #look for suspect login
```
# xxd - output hex of a file
xxd "filename"

# file - give information about file
1. Filesystem timestamp
2. Magic timestamp
3. Language Test
File example.txt 
example.txt: ASCII text

File * #Test all files in Directory
File Example/ #Tests all files in folder to check contents
File [file1] [file2] [file 3] #test multiple files
file -z install.tar.gz #test compressed files, z needed to test contents

# man 
man -k #search for specific String
man hier #hows hierachy of file structure

# ls
ls -l # list with info
ls -lhs #Human readbale long list
ls -lisa #all of it
ls -lhra #includes hidden

# Whereis 
whereis man cat #where is the man page for "cat"

# which
which pwd #shows location of specific binary
which rsyslod #location of binary
which syslod #locaiton of binary

# [stat](bash/stat-info.md)
stat exmaple.txt
stat -f example.txt # gives information about file system
stat -L /etc/resolv.conf #Derefence symbolick links

# lsblk
lsblk #shows the 


find 
Linux Basics Bash Logic2 10
put s/bin into a file
grep -Fsf
/usr/local/sbin
/usr/local/bin
/usr/sbin
/usr/bin
/sbin
/bin
/usr/games
/usr/local/games
/snap/bin
create file of jsut file names
ls /usr/bin | xargs -n 1 basename
grep -Fsf /home/garviel/binnames.txt /bin


```