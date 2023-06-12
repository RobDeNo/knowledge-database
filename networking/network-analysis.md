# p0f
cat /etc/p0f/p0f.fp  | more
- this will check the database of common signature of pcket
  - only captures proper packets
- windows usually has larger window sizes than windows
- p0f requires ROOT

sudo p0f -r > file.log

# creating a target baseline

```shell
telnet 10.50.22.42
ssh net1_student@10.50.20.51 -R 10300:localhost:8462
ssh net1_student@localhost -p 10300 -D 9050

ssh net1_student@localhost -p 10300 -L 10301:192.168.100.60:22 -NT
ssh net1_student@localhost -p 10301 -D 9050 -NT

ssh net1_student@localhost -p 10301 -L 10302:10.90.50.140:6481 -NT
ssh net1_student@localhost -p 10302 -D 9050 -NT

ssh net1_student@localhost -p 10302 -L 10303:172.20.21.5:23 -NT
telnet localhost 10303
ssh net1_student@172.20.21.4 -p 6481 -R 10304:localhost:22 -NT
ssh net1_student@localhost -p 10302 -L 10305:localhost:10304 -NT
ssh net1_student@localhost -p 10305 -D 9050 -NT

Task 1 IP/NFTables - Host Filtering: T@bl3sth@tF1lt3r

Task 2 IP/NFTables - NAT: N@tF1lt3rsf0rL1f3
```
```shell
ssh net1_student@10.50.23.43
ssh net1_student@10.50.23.43 -D 9050 -NT

ssh net1_student@10.50.23.43 -L 10300:10.1.2.200:23
telnet localhost 10300
ssh net1_student@10.1.2.130 -R 10301:localhost:8976
ssh net1_student@10.50.23.43 -L 10302:localhost:10301
ssh net1_student@localhost -p 10302 -D 9050 -NT

ssh net1_student@localhost -p 10302 -L 10303:10.2.5.20:22 -NT
ssh net1_student@localhost -p 10303 -D 9050 -NT

ssh net1_student@localhost -p 10303 -L 10304:10.3.9.39:23 -NT
telnet localhost 10304 
ssh net1_student@10.3.9.33 -R 10305:localhost:3597
ssh net1_student@localhost -p 10303 -L 10306:localhost:10305
ssh net1_student@localhost -p 10306 -D 9050 -NT

