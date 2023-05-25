

Gorgas Network Validation (GNV)
XX OCT 2023
Start Time: ~1300
Duration: 4 hour

Type of Operation: Network & Protocol familiarization, Custom Packet Creation & Manipulation

Objective: Identify and Validate the methods of encapsulation, header manipulation, packet traversal, and header structure in order to assist Gorgan Cyber Forces. Craft Custom ARP Requests and obfuscated ICMPv6 packets to enable Gorgas Cyber Forces to perform effective host discovery and Manipulation. You will use scapy and leverage ARP functions to manually "discover" your windows host, as a valid test case to provide to their cyber forces. You will use scapy and leverage IPv6 auto configuration functions to create a means of IPv6 direct communications between the Linux and Windows Machine.


Scenario Credentials: NETWORK FUNDAMENTALS - START FLAG = N3tw0rkFund3m3nt@ls

--------------------------------------------------------------

Task 1

Frame and Packet Headers

Type of Operation: PCAP Traffic Analysis

Objective: In support of the Gorgas Cyberspace Defense Operations, the team have captured packets over a network backbone with suspicious traffic. The pcap was pruned for most benign traffic. The PCAP is sent to you for further analysis.

    PCAP is stored on T1, located at /home/activity_resources/pcaps/packet-headers.pcapng.

    START FLAG = {provided in notification}


--------------------------------------------------------------

Task 2

Packet Payloads

Type of Operation: PCAP Traffic Analysis

Objective: In support of the Gorgas Cyberspace Defense Operations, the team have captured packets over a network backbone with suspicious traffic. The pcap was pruned for most benign traffic. The PCAP is sent to you for further analysis.

    PCAP is stored on T1, located at /home/activity_resources/pcaps/packet-headers.pcapng.

    START FLAG = {provided in notification}


--------------------------------------------------------------

Task 3

Basic Analysis - Utilizing Berkeley Packet Filters

Type of Operation: PCAP Examination

Objective: You have been given a pcap of unknown contents for examination. You are tasked with performing basic analysis of the contents of this pcap using Berkeley Packet Filters (BPF).

    PCAP is stored on T1, located at /home/activity_resources/pcaps/BPFCheck.pcap.

    START FLAG = {provided in notification}


--------------------------------------------------------------

Scheme of Maneuver:
Task 1
> INTERNET_HOST (T1)


Task 2
> INTERNET_HOST (T1)


Task 3
> INTERNET_HOST (T1)

--------------------------------------------------------------

Tools/Techniques: Tcpdump, Tshark, Open Source Research (OSR), Wireshark, to Monitor and View your custom packets. Scapy, a packet manipulation program.

Prior Approvals: All connections will be established from your analyst Op Stations. Provide all findings through the associated CTF challenges:

Target Section:

--------------------------------------------------------------

T1
Hostname: INTERNET_HOST
External IP: 10.50.XXX.XXX (ALREADY PROVIDED)
Internal IP: 10.10.0.40 (ALREADY PROVIDED)
creds: student:password
Action: Use to examine PCAPS
