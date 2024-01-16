#1 General survey use kismet
#2 single target/attack use airodump
kismetwireless.net
#how to remove old kismet
sudo rm -rfv /usr/local/bin/kismet* /usr/local/share/kismet* /usr/local/etc/kismet*
sudo apt remove kismet
audo purge kismet
----
#INSTALLING ON PI
wget -O - https://www.kismetwireless.net/repos/kismet-release.gpg.key --quiet | gpg --dearmor | sudo tee /usr/share/keyrings/kismet-archive-keyring.gpg >/dev/null
echo 'deb [signed-by=/usr/share/keyrings/kismet-archive-keyring.gpg] https://www.kismetwireless.net/repos/apt/release/bullseye bullseye main' | sudo tee /etc/apt/sources.list.d/kismet.list >/dev/null
sudo apt update
#sudo apt install kismetLAPTOP
wget -O - https://www.kismetwireless.net/repos/kismet-release.gpg.key --quiet | gpg --dearmor | sudo tee /usr/share/keyrings/kismet-archive-keyring.gpg >/dev/null
echo 'deb [signed-by=/usr/share/keyrings/kismet-archive-keyring.gpg] https://www.kismetwireless.net/repos/apt/release/jammy jammy main' | sudo tee /etc/apt/sources.list.d/kismet.list >/dev/null
sudo apt update
sudo apt install kismet
sudo apt install xclip python-tk libportaudio2
sudo usermod -aG kismet a28


@@@@@@@@@@@@@@@@@@@@@@@@



log_title=

#adding under kismet a user named pi, adding yourself to the kismet group will allow you to call it directly
sudo usermod -aG kismet pi
#/etc/kiismet/kismet_site.conf
log_title=laptop
log_prefix=./
log_types=kismet,pcapppi,pcapng
devicefound=00:11:22:33:44:55
devicefound_timeout=15
devicelost=00:11:22:33:44:55
devicelost_timeout=15
source=wlan1
gps=gpsd:host=localhost,port2947,reconnect=true
gps=virtual:lat=39.12552780239233, lon=-76.79239001576157, alt=1234
#/etc/kismet_filter.conf
1. selectign what specfificlly you do or do not want to capture
#/etc/kismet/kistmet_alerts.conf
1. this is where you can put alerts for when you are detecting your detecting your target
#/etc/kismet/kismet.conf
1. "ctrl w"
    source=wlan1
#ensure gps is workimng
sudo nano /etc/kistmet/kistmet.conf
#kismet gui (start this on your PIE)
sudo shutdown -p now
#kismet RSSI meter
#you need to have a 1. WIFI CARD, 2 KISMET RUNNING to get this rssi meter
mv ~/Downloads/Kistmet-RSSI-Bar-Master.zip /opt
sudo cp /opt
sudo unzip Kismet-RSSI-Bar-Master.zip
cd Kismet-RSSI-Bar-master
-----------------
sudo apt install xclip python-tk libportaudio2
sudo apt install python3-pip
pip3 install -r requirements.txt
#main.py messing, tyou need to set username and password in the main.py
https://github.com/GrokkedBandwidth



