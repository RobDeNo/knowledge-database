sudo airodump-ng --band abg wlan1
sudo airodump-ng -w Lab_8 -c 3 --bssid 14:EB:B6:13:8E:0D --gpsd wlan1
sudo airodump-ng -w lab1 --uptime --manufacturer --bssid 48:22:54:D5:ED:4E --gpsd wlan1
sudo airodump-ng -w lab1 --uptime --manufacturer --wps --bssid 48:22:54:D5:ED:4E --gpsd wlan1

#useful flags
--uptime
--manufacturer
--wps 
-b 
-f # speed of channel stepping
200 = driving (.2 seconds)
2000 = for slow walking (2 seconds)



#1. Best RSSI
Lab-1
#2 Stations connectedWPS is off
00:CB:CB:69:14:CB
58:CB:52:13:F8:6A
#3 How long
7 hours, 2 min
#4 type fo encryption
WPA2, CCMP
#5 WPS on or off

sudo airodump-ng -w Lab_8 -c 3 --uptime --manufacturer --wps --bssid 14:EB:B6:13:8E:0D --gpsd wlan1

