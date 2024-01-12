#Target Templates
Have a command for each location for your collections
1. Specific points for collections
2. Multiple terminals running different portions of your operations
- survey east, and survey west
#AIRODUMP/COLLECT
sudo airodump-ng -w lab1 --uptime --manufacturer --wps --gpsd wlan1
sudo airodump-ng --uptime --manufacturer --wps --gpsd wlan1 
sudo airodump-ng --bssid XXXXX -w collections/TGT_JURI_OLAF --uptime --manufacturer --wps --gpsd -c XXX abg wlan1
#collection
sudo airodump-ng -w tgtjuri --uptime --manufacturer --wps --gpsd wlan1
sudo airodump-ng --bssid XXXXX -w collections/TGT_JURI_OLAF --uptime --manufacturer --wps --gpsd -c XXX abg wlan1

#DE_AUTH LINE
#Situation:
#Position:
#Operation:
#Time:

#SSID(human network name)##############


#BSSID(Make address)##############


#CHANNEL##############


#MAKE/MODEL##############


#ENCRYPTION##############


#ASSOCIATED CLIENTS##############


#DEAUTH##############


#PIXIE##############


#EVIL TWIN##############