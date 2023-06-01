Gorgas Socket Manipulation (GPM)
XX OCT 2023
Start Time: 1300
Duration: 4 hours

Type of Operation: Socket Programming for Datagram, IP, TCP

Objective: Gorgas Cyber Forces are preparing for an upcoming mission and have requested assistance with packet manipulation. They need to send custom message to allied forces throughout the region; however, they currently do not have anyone available that understands how. Using Python your team is required to complete each of the following tasks (Specific details for each task are identified in the challenge):

    Utilize sockets and craft a custom Raw IPv4 Sockets

    Utilize sockets and craft a custom Raw IPv4 TCP Sockets

    Utilize sockets and craft a custom Datagram Socket Message Sender

    Utilize sockets and craft a custom Stream Socket Message Sender

Click Here to view there current progress on the scripts

Tools/Techniques: Python3, Wireshark/TCPDump

Scenario Credentials: FLAG = raw_packet_start

Prior Approvals: Prior to completing each of the four tasks, ensure you understand the various items of the script you developed.

Scheme of Maneuver:
> Linux Workstations:
→ T1: INTERNET_HOST
-→ T2: BLUE_DMZ_Host

Target Section:

T1
Hostname: INTERNET_HOST
IP: PROVIDED FLOAT IP
OS: Linux
Creds: PROVIDED CREDENTIALS
Last Known SSH Port: 22
PSP: none
Malware: none
Action: Send a Datagram Socket Message to this host

T2
Hostname: BLUE_DMZ_Host-1
IP: 172.16.1.15
OS: unknown
Creds:unknown
Last Known SSH Port: unknown
PSP: Unknown
Malware: Unknown
Action: Send a Stream Socket Message to this host