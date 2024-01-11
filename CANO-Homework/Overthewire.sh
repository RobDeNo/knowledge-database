Level 0
```shell```
 sh bandit0@bandit.labs.overthewire.org
find /home/ -type f -iname readme 2>dev/null

#level 1 bandit.labs.overthewire.org
NH2SXQwcBdpmTEzi3bvBHMM9H66vVXjL

#level 2
bandit0@bandit.labs.overthewire.org -p 2220

NH2SXQwcBdpmTEzi3bvBHMM9H66vVXjL


#level 1 to 2 rRGizSaX8Mk1RTb1CNQoXTcYZWU6lgzi
cat ./-

#level 2 to 3 aBZ0W5EmUfAf7kHTQeOwd8bauFJ2lAiG
cat spaces\ in\ this\ filename

#level 3 to 4 2EW7BBsr6aMMoJ2HjW067dm8EgX26xNe

#level 4 to 5 lrIWWI6bB37kxfiCQZqUdOIYfr6eEeqR
tail -n +1 ./-file0*

#level 5 to 6 P4L4vucdmLnm8I7Vl7jG1ApGSfjYKqJU
find . -size 1033c ! -executable
find . -type f -size 1033c ! -executable -exec file {} + | grep ASCII

#level 6 to 7 z7WtoNQU2XfjmMtWA8u5rN4vzqu4v99S
find / -user bandit7 -group bandit6 2>/dev/null

#level 7 to 8 TESKZC0XvTetK0S9xNwm25STk5iWrBvP
cat /home/bandit7/data.txt | grep millionth

#level 8 to 9 EN632PlfYiZbn3PhVK3XOGSlNInNE00t
sort data.txt | uniq -c | egrep "*1 "

#level 9 to 10 G7w8LIi6J3kTb8A7j9LgrywtEUlyyp6s
cat data.txt | grep -a ==

#level 10 to 11 6zPeziLdR2RKNdNYFNb6nVCKzphlXHBM
base64 -d data.txt

#11 to 12 The password is JVNBBFSmZwKKOP0XbFXOoW8chDz5yVRv
cyberchef

#12 to 13 wbWdlBxEir4CaE8LaPhauuOo6pwRmrDw
mv the datt
read the hex, rename to proper file strucutre, go back and fortuh
xxd -r
gzip -d
bzip2 -d compressed_data.bz2
cat compressed_data | Head
tar -xf compressed_data.tar 
tar -xf data5.bin

#13 to 14 key
scp -P 2220 bandit13@bandit.labs.overthewire.org:sshkey.private .
chmod 700 sshkey.private
ssh -i ~/sshkey.private bandit14@bandit.labs.overthewire.org -p 2220
ssh -i sshkey

#14 to 15 
TASK - The password for the next level can be retrieved by submitting the password of the current level to port 30000 on localhost.
#bandit14 pw: fGrHPx402xGC7U7rXKDaxiWFTOiF0ENq
telnet localhost 30000
#"enter the pw" 
fGrHPx402xGC7U7rXKDaxiWFTOiF0ENq
ANSWER jN2kgmIXJ6fShzhT2avhotn4Zcka6tnt

#15 to 16
The password for the next level can be retrieved by submitting the password of the current level to port 30001 on localhost using SSL encryption.
openssl s_client -connect localhost:30001 #openssl s_client is the implementation of a simple client that connects to a server using SSL/TLS.
jN2kgmIXJ6fShzhT2avhotn4Zcka6tnt
