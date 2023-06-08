Task 2 - Tunnels Prep: The_Only_Easy_Day_Was_Yesterday

Task 3 - Donovian Tunnels Training: dig_dug_dig_dug

    Your Network Number is N (Given by Instructor)

    Credentials: net{N}_studentX:passwordX

    X is your student number

    T3 (Atropia) Float IP address is - 10.50.33.33

    T4 (Pineland) Float IP address is - 10.50.22.92 (Note - You can only telnet here to act as an insider, this will not be a routed path)



Task 4 - Donovian Data Collection: Will open when Task 3 is complete

    T5 Float IP address is - 10.50.37.163
    Credentials: Same as Task 3.

1. c
2. Using the following syntax:
OPS$ ssh cctc@10.50.1.150 -p 1111
What is 1111? (Max 2 Attempts)
C. local listening port on OPS - this is the local listneing port
3. OPS$ ssh cctc@localhost -p 1111 #this is the local listneing por on OPS workstation
4. Which IP would we use to SSH to PC1 from OPS?
   1. 10.50.1.150
5. Which ssh syntax would properly setup a Dynamic tunnel to PC1? (Max 2 Attempts)
A. ssh -D 9050 cctc@localhost -NT
B. ssh cctc@100.1.1.1 -D 9050 -NT
C. ssh cctc@10.50.1.150 -D 9050 -NT
D. ssh -L 9050 cctc@10.50.1.150 -NT 
    1. C since this one sets the ssh to the target IP address and send it through the dynamic Tunnel
6. Which ssh syntax would properly setup a Local tunnel to PC1 SSH port? (Max 2 Attempts)
A. ssh -L 1111:localhost:22 cctc@10.50.1.150 -NT
B. ssh cctc@10.50.1.150 -L 1111:10.50.1.150:22 -NT
C. ssh cctc@100.1.1.1 -L 1111:localhost:22 -NT
D. ssh -R 1111:localhost:22 cctc@10.50.1.150 -NT 
    1. A is correct due to the authenticaiton and sdocket information being correct
7. Which ssh syntax would properly setup a Local tunnel to PC1 HTTP port? (Max 2 Attempts)
A. ssh cctc@100.1.1.1 -L 1111:10.50.1.150:80 -NT
B. ssh cctc@10.50.1.150 -L 1111:localhost:80 -NT
C. ssh cctc@100.1.1.1 -L 1111:localhost:80 -NT
D. ssh -L 1111:100.1.1.1:80 cctc@localhost -NT 
    1. socket information and authenticaiton information correct
8. Which ssh syntax would allow us to establish a Dynamic tunnel using the Local tunnel created in Question 6? (Max 2 Attempts)
A. ssh -D 9050 cctc@localhost -NT
B. ssh cctc@100.1.1.1 -p 1111 -D 9050 -NT
C. ssh -p 1111 cctc@10.50.1.150 -D 9050 -NT
D. ssh -D 9050 cctc@localhost -p 1111 -NT 
    1. This is D due to the prior connection using port 1111 on the host machine, and using local host authentication to ssh into the tunnel
9. Which syntax would allow us to download the webpage of PC1 using the Local tunnel created in Question 7? (Max 2 Attempts)
A. wget -r http://100.1.1.1:1111
B. wget -r http://100.1.1.1
C. wget -r http://localhost:1111
D. wget -r http://localhost -p 1111 
    1. specifiy port with the cologne:1111
10. Which syntax would allow us to download the webpage of PC2 using the Dynamic tunnel created in Question 8? (Max 2 Attempts)
A. proxychains wget -r http://100.1.1.2:1111
B. proxychains wget -r http://100.1.1.2
C. proxychains curl http://100.1.1.2
D. wget -r http://localhost:1111
    1. its b becuase ip brudda




11.  Which ssh syntax would properly setup a Local tunnel to PC2 SSH port using PC1 as your pivot? (Max 2 Attempts)
A. ssh cctc@10.50.1.150 -L 1111:192.168.2.1:22 -NT
B. ssh -L 1111:100.1.1.2:22 cctc@100.1.1.1 -NT
C. ssh -L 1111:100.1.1.2:22 cctc@10.50.1.150 -p 1111 -NT
D. ssh cctc@10.50.1.150 -L 1111:100.1.1.2:22 -NT 
    1. its D due to the authentication going top PC1 and the sockets connecting to PC2 using the port 1111



12.  Which ssh syntax would properly setup a 2nd Local tunnel to PC2 SSH port using the tunnel made in Question 6 as your first tunnel? (Max 2 Attempts)
A. ssh -L 2222:100.1.1.2:22 cctc@localhost -p 1111 -NT
B. ssh -L 2222:100.1.1.2:22 cctc@10.50.1.150 -p 1111 -NT
C. ssh cctc@100.1.1.1 -p 1111 -L 2222:100.1.1.2:22 -NT
D. ssh cctc@localhost -p 1111 -L 2222:192.168.2.1:22 -NT 

    1. the correwct answer is A due to the authentication needing to still be locsal host out port 1111, with a local desitnation port of 2222: then the IPs
   
1.    Which ssh syntax would properly setup a 2nd Local tunnel to PC2 HTTP port using the tunnel made in Question 6 as your first tunnel? (Max 2 Attempts)
B. ssh cctc@localhost -p 1111 -L 2222:100.1.1.2:80 -NT
    1. the answer b



14. Which ssh syntax would allow us to establish a Dynamic tunnel using the Local tunnel created in Question 12? (Max 2 Attempts)
A. ssh -D 9050 cctc@localhost -p 2222 -NT


15. An Admin created the following tunnels but found that the Dynamic tunnel would not connect. Where did the Admin make the error? (Max 2 Attempts)
1.) ssh cctc@10.50.1.150 -L 1234:100.1.1.2:22 -NT
2.) ssh -D 9050 cctc@100.1.1.2 -p 1234 -NT
C. authenticated to wrong IP in line 2


16. An Admin created the following tunnels but found that the Dynamic tunnel would not connect. Where did the Admin make the error? (Max 2 Attempts)

1.) ssh cctc@10.50.1.150 -L 1234:192.168.2.1:22 -NT
2.) ssh -L 4321:100.1.1.2:22 cctc@localhost -p 1234 -NT
3.) ssh cctc@localhost -p 4321 -D 9050 -NT
A. targeted wrong IP in line 1
B. targeted wrong IP in line 2
C. called wrong port in line 2
D. called wrong port in line 3 
1. Ip is too far away 


17. Which ssh syntax would properly setup a 3rd Local tunnel to PC3 TELNET port using the tunnels made in Question 6 and Question 12? (Max 2 Attempts)
D. ssh -p 2222 cctc@localhost -L 3333:192.168.2.2:23 -NT 

18. Which syntax would allow us to telnet to PC3 using the tunnel make in Question 17? (Max 2 Attempts)
B. telnet localhost 3333

19. Which syntax would properly setup a Remote tunnel from PC3 back to PC2 using PC3 SSH port as the target? (Max 2 Attempts)
C. ssh -R 4444:localhost:22 cctc@192.168.2.1 -NT

20. hich syntax would properly setup a Local tunnel to map to the tunnel made in Question 19 using the tunnel made in Question 6 and Question 12? (Max 2 Attempts)
A. ssh cctc@localhost -p 2222 -L 5555:localhost:4444 -NT
this is where the port is opened on PC2





NEXTTTTTTTTTTTTTTTTT
netY_studentX:passwordX
(netY = Networking Class Identifier & studentX = Student Number & passwordX = Student Number)
net1_student3:password3

DTC: Task 2-4 Start Flags
    Task 2 - Tunnels Prep: The_Only_Easy_Day_Was_Yesterday
    Task 3 - Donovian Tunnels Training: dig_dug_dig_dug
        Your Network Number is N (Given by Instructor)
        Credentials: net{N}_studentX:passwordX
        X is your student number
        T3 (Atropia) Float IP address is - 10.50.33.33
        T4 (Pineland) Float IP address is - 10.50.22.92 (Note - You can only telnet here to act as an insider, this will not be a routed path)
Task 4 - Donovian Data Collection: Will open when Task 3 is complete
        T5 Float IP address is - 10.50.37.163
        Credentials: Same as Task 3.
    2023-06-06T15:29:02Z

    internet_host$ ssh netX_studentX@{T3_float_ip} -L NssXX:localhost:NssXX -NT
    internet_host$ ssh netX_studentX@localhost -p NssXX -L NssXX:10.2.0.2:80 -NT

1. Tunnels Training - Local Practice 5
T3 is the authorized initial pivot
Conduct passive recon on the Target T3, it appears to have access to the 10.3.0.0/24 subnet.
    Create a Local Port Forward from your Internet_Host to T3 targeting:
ip: 10.3.0.27
port: `HTTP``
Identify the flag on Victoria's HTTP Server

ET@d~d

ssh net1_student3@10.3.0.10 -R 10300:localhost:22 -NT
ssh net1_student3@10.50.33.33 -L 10300:localhost:10301 -NT
ssh net1_student3@localhost -p 10300 -L 10301:10.4.0.1:22 -NT
wget -r http://localhost:10302
ssh net1_student3@localhost -p 10301 -D 9050

internet_host$ ssh netX_studentX@{T3_float_ip} -D 9050 -NT
ssh inet1_student3@10.50.33.33 -D 9050 -NT



Invention, my dear friends, is 93% perspiration, 6% electricity, 4% evaporation, and 2% butterscotch ripple.


find / -name hint* 2> /dev/null

find / -name flag* 2> /dev/null







