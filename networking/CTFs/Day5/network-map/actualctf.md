Donovian Mapping & Reconnaissance (DMR)
XX OCT 2023
Start Time: 1300
Duration: 4 hours
Type of Operation: Scanning & Reconnaissance

Objective: In an effort to aid Gorgas Cyber forces, you have been tasked to assist with an overall collection and analysis of data from Donovian Cyberspace and their networks. You are tasked to perform various types of reconnaissance to accomplish this. The Gorgan Active Recon cell gained access to a boundary router and gathered the following intelligence belonging to deployed Donovian forces but have not been able to put together any mapping of their overall infrastructure. Aid the efforts by building a map of the entire network including networking devices and the target host machines below with:
Gathered Intelligence: Credentials
student:password
vyos:password
The regional COCOM has provided direction to build a network map providing the following details, in order to drive future cyberspace operations:
    Device type
    Hostname
    Interface type
    Interface IP
    Subnet Mask CIDR
    Autonomous system number, Routing Protocol, IP network and Network Name groupings
    Open ports
    Operating system type and versions
Tools/Techniques: dig, nmap, nc, /dev/tcp
Scenario Credentials: Perform DNS recon on your ctfd server to obtain the start flag.
the start flag is an encoded string that is in a record associated with your CTFd server. Decode this string for the flag
Prior Approvals: You will use SSH to progress through the network but all scanning should be conducted from your INTERNET_HOST
Scheme of Maneuver:
>INTERNET_HOST
-> Red Boundry Router: DONOVIAN CYBERSPACE
Target Section:
----------------------------------------------------------------------------------------------------

T1
Hostname: networking-ctfd-1.server.vta
Record Type: TXT
IP: UNKNOWN
Ports: 53
Action: interrogate DNS records
----------------------------------------------------------------------------------------------------
Red Boundry Router
Hostname: RED_SCR
IP: 172.16.120.1
Ports: 22
Username: vyos
Password: password
Action: Use as start point and Perform Passive/Active Reconnaissance
----------------------------------------------------------------------------------------------------

T2
Hostname: UNKNOWN
IP: 172.16.182.110
Action: Perform Active Reconnaissance
----------------------------------------------------------------------------------------------------

T3
Hostname: UNKNOWN
IP: 172.16.140.33
Action: Perform Active Reconnaissance
----------------------------------------------------------------------------------------------------

T4
Hostname: UNKNOWN
IP: 172.16.182.106
Action: Perform Active Reconnaissance
----------------------------------------------------------------------------------------------------
Gathered Intelligence: Credentials
student:password
vyos:password
T5
Hostname: UNKNOWN
IP: 172.16.182.114
Action: Perform Active Reconnaissance
----------------------------------------------------------------------------------------------------

T6
Hostname: UNKNOWN
IP: 172.16.182.118
Action: Perform Active Reconnaissance
----------------------------------------------------------------------------------------------------

T7
Hostname: UNKNOWN
IP: 172.16.140.35
Action: Perform Active Reconnaissance
----------------------------------------------------------------------------------------------------
