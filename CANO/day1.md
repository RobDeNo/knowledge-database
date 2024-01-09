```shell
find /home/a28/Field-Expedient-Linux-Exercises -type f -exec grep -H 'cookie' {} \; | grep cookie

find /etc -type f -name "War*" -exec grep -r 'peace' {} \; 
#### FIND ALL THESE ####
find /etc -type f -name "*conf" #this will find a file ending with "conf"
find / -iname linux.odt #This is looking for a , NOT case sensitive
find / -size +1000M #finds all files of a certain size
find /opt/usr/var -name foo2oak.1.gz -type f #searching for a file
find . -type d
find / -mtime 50 #search for modified times
find / -cmin -60 #
find / -amin -60
find / -type f -name '*.mp3'
-- STOP HERE---
find . -type f -name '*.mp3' -exec rm -f {} \; #look for some mp3 files and remove them all
find ../chap-13 -type f -iname "*Moby*" -exec grep -H 'Shakespeare' {} \; #this will help you find the  specific words in a file as well as display the location of the file that string is found in
grep -r "Beware of arro" ../../
#################################################################
### GREP ALL OF THESE ####
grep root /etc/passwd
grep hello /usr/share/dict/american-english
grep -w -c hello /usr/share/dict/american-english
grep "^cat" /usr/share/dict/american-english #first 3 chararcters to start with
grep -x "c.t" /usr/share/dict/american-English #the "." is like a question mark, it will find the cat, cot, cut etc
grep -r cookie ../../ #recursivley look through all your files for a string
find fonty -name "*doc" exec grep first {} \;
##################################################################
ls -Ra | grep "file"
#this will recursivley look through directly and find the file named "file"
ls song[1][4-7].mp3
song14.mp3  song15.mp3  song16.mp3  song17.mp3
#looks through the files for finding an array of string/digits
ls *[0-9]*
cat foo | tee foo2
cat fir
ls | wc -l| tee new.txt
ls | tee -a spa
# Tee does two things
# 1. what you are putting in etc
# 2. Displays it to your screen

### CARVING OUT INFORMATION ###
cut -f1 monster-tab # this is cutting out the first column
cut -c1-9 monster-tab # this will but out the first 9 characters
### COMMA CARVING
cut -d ',' f2 monsters
### processing text ###
echo -e "computer\nmouse\nLAPTOP\ndata\nRedHate\nlaptop\ndebian\nlaptop" > techmint.txt
cat techmint.txt
sort techmint.txt
sort techmint.txt > sorted.txt
uniq techmint.txt
sort -r techmint.txt

@@@@
cut -c2-10 Personal\ Data/Tabs
cut -f1-5 Personal\ Data/Tabs
cut -f2,5 Personal\ Data/Tabs > Tabs-foo

### DIFFERENT between the two files ###
diff monsters more-monsters

tar -zcvf Shakespeare.txt.bak2.
# This command extracts files from Archives. 
tar xvf file.tar
#This command creates a tar file called file.tar.gz which is the Archive of .c files.  
tar cvzf file.tar.gz *.c

#### SYSTEM PROCESSES ####
uname -a
df -h 
ps -elf | grep firefox 
ps aux | grep firefox
kill 1234
kill -9 1234
### networking ###
ifconfig
sudo ifconfig wlan1 down
ip address show 
ip link show
iwconfig
iw dev

PATH=$PATH:~/Desktop/scripts
NH2SXQwcBdpmTEzi3bvBHMM9H66vVXjL





```