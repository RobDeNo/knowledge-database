# [grep](/Linux/bash/grep-info.md) 
- The grep filter searches a file for a particular pattern of characters, and displays all lines that contain that pattern
```Shell
grep openstack
grep -v openstack # anything -4 the four lines before each result
grep lodge /etc/group #look for group in groups
grep --p '^([0-9A-Fa-f]{2}-){5}[0-9A-Fa-f]{2}$' #look for mac
cat /etc/passwd | grep -v "nologin" | grep -v "bash" #look for suspect login

```
# File
```Shell

```
# dir
```Shell

```
# xxd - output hex of a file
```Shell
xxd "filename"
```
# file - give information about file
1. Filesystem timestamp
2. Magic timestamp
3. Language Test
```Shell
File example.txt 
example.txt: ASCII text

File * #Test all files in Directory
File Example/ #Tests all files in folder to check contents
File [file1] [file2] [file 3] #test multiple files
file -z install.tar.gz #test compressed files, z needed to test contents
```
# man 
```Shell
man -k #search for specific String
man hier #hows hierachy of file structure
```
# ls
```Shell
ls -l # list with info
ls -lhs #Human readbale long list
ls -lisa #all of it
ls -lhra #includes hidden
```
# Whereis 
```Shell
whereis man cat #where is the man page for "cat"
```
# which
```Shell
which pwd #shows location of specific binary
which rsyslod #location of binary
which syslod #locaiton of binary
```
# [stat](bash/stat-info.md)
```shell
stat exmaple.txt
stat -f example.txt # gives information about file system
stat -L /etc/resolv.conf #Derefence symbolick links
```