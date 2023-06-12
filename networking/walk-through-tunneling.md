```shell
ssh net1_student3@10.50.31.162 -D 9050 -NT
proxychains wget -r ftp://104.16.181.15
proxychains wget -r http://104.16.181.15
#now we move on to the next target from student3@john
proxychains ssh net1_student3@104.16.181.15
#now your on jack
#now you need to locse your dynamic tunnel and open a local forward from the .15
ssh net1_student3@10.50.31.162 -L 13001:104.16.181.15:22 -NT
ssh net1_student3@localhost -p 13001 -D 9050
ps -elf | grep ssh
#now you can scan the network with proxychains
proxychains ./scan.sh # this will show port 4567
proxychains wget -r ftp://142.16.8.41 #download the files
proxychains nc 142.16.8.41 4567
#now we test the conneciton for the new ssh
proxychains ssh net1_student3@142.16.8.41 -p 4567
#local tunnel
ssh net1_student3@10.50.31.162 -L 13001:104.16.181.15:22 -NT
ssh net1_student3@localhost -p 13001 -L 13002:142.16.8.41:4567 -NT
ssh net1_student3@localhost -p 13002 -D 9050 -NT
#155.39.88.1
ssh net1_student3@10.50.31.162 -L 13001:104.16.181.15:22 -NT
ssh net1_student3@localhost -p 13001 -L 13002:142.16.8.41:4567 -NT
ssh net1_student3@localhost -p 13002 -L 13003:155.39.88.21:23 -NT
ssh net1_student3@155.39.88.17 -p 4567 -R 10300:localhost:22 -NT
ssh net1_student3@localhost -p 13002 -L 10301:localhost:10300 -NT
ssh net1_student3@localhost -p 10301 -D 9050 -NT
-------------------------------------------------------------------------------------
# p0f
cat /etc/p0f/p0f.fp  | more
- this will check the database of common signature of pcket
  - only captures proper packets
- windows usually has larger window sizes than windows
- p0f requires ROOT

sudo p0f -r blah.pcacp > file.log | grep 

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
```
-------------------------------------------------------------------------------------
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


```
