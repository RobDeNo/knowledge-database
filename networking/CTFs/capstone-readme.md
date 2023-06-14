CAPSTONE
Hostname: UNKNOWN
IP: 10.50.x.x address provided by instructor
creds: netY_studentX:passwordX (netY = Networking Class Identifier & studentX = Student Number & passwordX = Student Number)
Known Ports: UNKNOWN
Action: Execute proper movement and redirection techniques

The Capstone environment will test your knowledge and skills on all the topics covered in the CCTC Networking course. You will not be able to complete this activity with the CTFD alone.

You will not find the questions or answers to this Capstone within the CTFD or in past activities.

You will have to conduct reconnaissance within the new environment to find the questions. The CTFD is only a repository for the BASE64 converted answers.

Any system, you reach or login to, you should check the "/usr/share/cctc/" directory. This is where any/all files of interest or instructions will be provided. You should always check this directory for information, just in case.

Most tools have been removed from hosts, which will alter/dictate the way you approach gathering flags. If you want to use a tool/command from within the host (example: tcpdump, netcat, arp, etc…​) you can check to see if it is present, and you can find the tool/command via the "whereis" or "which" commands. This will provide the directory path that the tool/command can be accessed from. You may need to use the full path in some cases. Don't forget to conduct passive reconnaissance on any system you can access and active recon to find other systems and ports to interact with.

Use tools such as ssh tunnels, netcat, curl, wget, ftp, and proxychains from your own INTERNET_HOST to navigate throughout the environment and to reach and interact with devices and services.

When creating tunnels your authorized port ranges to utilize are NSS00 - NSS99
N = NetX (1-6)
SS = Student Number - (ie 01 - 40)
00-99 = available port forward ranges
i.e. Net1_student1 can use 10100 - 10199 and Net4_student14 can use 41400 - 41499

If asked to submit your answer in base64 format, you can use the following example as a reference:

If the question asks you to submit an answer of cheese in all caps converted to base64:

echo "CHEESE" | base64
Q0hFRVNFCg==

flag = capstone
