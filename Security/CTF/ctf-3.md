Donovian Database Exploitation (DWDBE)
XX Dec 2026
Start Time: 1300
Duration: 4 hours

Type of Operation: Cyberspace Exploitation (C-E)

Objective: Maneuver through network, identify and gather intelligence from the Donovian Logistics Agency database.

Tools/Techniques: All connections will be established through web browser to donovian-nla. SSH masquerade to Donovian_Webserver with provide credentials. Ports in use will be dependent on target location and are subject to change. Web exploitation techniques are limited to SQLi injections. Network scanning tools/technique usage is at the discretion of student.

Scenario Credentials: FLAG = 5QL1nj3ct5t@rt0F@ct1v1ty

Prior Approvals: SQLi injects through web browser. Creation of database administrator account if directed to. Any connection to donovian-nla other than HTTP/HTTPs is NOT approved.

Scheme of Maneuver:
>10.50.39.150
->T1:10.100.28.48
Target Section:
T1
Hostname: donovian-nla
IP: 10.100.28.48
OS: unknown
Creds:unknown
Last Known SSH Port: unknown
Last Known HTTP Port: 80

Malware: Unknown
Action: Conduct approved SQLi Exploitation techniques to collect intelligence.
```shell
ssh student@10.50.39.150 -L 10300:10.100.28.40:4444
ssh student@localhost -p 10300 -D 9050
ssh student@localhost -p 10300 -L 10301:10.100.28.55:80
