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


```
