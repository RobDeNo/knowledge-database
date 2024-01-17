#1 editing your interface REDACTED!!!!!!!!!!!!!!!
sudo nano /etc/udev/rules.d/70-persistant-net-rules
    #run to searchfr for your interface(wireless)
    ifconfig
    SUBSYSTEM=="net", ACTION=="add", DRIVERS=="?*", ATTR{address}=="e0:c2:64:bc:4d:5f", NAME="wlan0"
#2 not edit the grub REDACTED!!!!!!!!!!!!!!!
    sudo nano /etc/default/grub
    GRUB_CMDLINE_LINUX="net.ifnames=0 biosdevname=0"
#3 now update your system wit the changes
    sudo update-grub
    sudo update-initramfs -u
    reboot
#4 now change your hostname
sudo hostnamectl set-hostname desktop #hostname will mismatch hosts file
sudo nano /etc/hosts # thi is where you can change your host files for this
    #Wireless NIC Application
    1. Atheros
    2. Mediatek - sw works
    3. Broadcom
    4. Realtek
    #use the below command to check the chipset
    lsusb
    sudo apt install ethtool
    sudo ethtool -i "wlan1"

#5 edit the gps d
sudo apt install gpsd # install the file if its not needed
sudo nano /etc/default/gpsd
START_DAEMON="true" # starts the gpsd on boot
USBAUTO="true" #allows hot plugging
DEVICES="/dev/ttyUSB0" #tells where to find the GPS, where to get the information
GPSD_OPTIONS="-n -G -b"
GPSD_SOCKET="/var/run/gpsd.sock"

sudo systemctl restart gpsd # now restart the gps thing
cgps # use this to start the gps
#6 time to do aircrack stuff
sudo airodump-ng-oui-update
#
-g #use gps
-w #write tp file
--band abg #for 2.4 and 5
--ht20
-r #reads packet from the file
-M manufacturer --ouput-format
-
sudo airodump-ng wlan1
48:22:54:D5:ED:4E  -24      174        0    0   4  270   WPA2 CCMP   PSK  Lab-1
sudo airodump-ng --band abg wlan1
sudo airodump-ng -w lab1 -c 1 --bssid 48:22:54:D5:ED:4E --gpsd wlan1
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
##################PE
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


    