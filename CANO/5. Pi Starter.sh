#1 connect the pi to your router to get ip
#2 install rasberry Pi Imager from ubuntu app store
#3 open imager and make sure to set
    Debian Bullseye 32-Bit
    enable SSH
    set hostname
    set pw
#4 SSH to new pi
    ssh pi@192.168.8.195 
    #ssh-keygen -f "/home/a28/.ssh/known_hosts" -R "192.168.8.195"
#5 add network tools and run updates
    sudo apt-get install net-tools
    sudo apt update; sudo apt upgrade -y
#6 configure raspi-config
    sudo raspi-config
    1, S3 CHANGE PASSWORD
    1, S4, CHANGE HOSTNAME #T-Mobile_Hotspot, Samsung_SmartcastTV
    3, P2, Enable SSH
    5, L1, Set Locale # en_US.UTF-8 UTF-8
    5, L2, Change Timezone #AO dependant
    5, L4 Set Wifi Country #AO dependant
    6, A1, Expand Filesystem
    6, A4, Interface Names #diable predictable names
#7 (LAPTOP) create SSH keys
    ssh-keygen -b 4096
    ssh-copy-id -i pi1 Samsung_SmartcastTV@192.168.8.195
    ssh-copy-id -i pi2 pi2@192.168.8.195 #username not hostname
    ssh-copy-id -i pi pi@192.168.8.211
#8 Make copy of ssh keys incase they get deleted
    cp ~/.ssh/pi2.pub pi2.pub.bak
    cp ~/.ssh/pi.pub pi.pub.bak 
#9 Harden SSH config on pi
    sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak #backup for errors
    sudo nano /etc/ssh/sshd_config # change
    #make below changes
    AddressFamily inet
    PermitRootLogin no
    PasswordAuthentication no
    #restart daemon
    sudo systemctl restart sshd
#10 install wireguard on PI
    sudo apt install wireguard -y
#11 send wireguard config file to PI
    sudo scp -i ~/.ssh/pi2 /etc/wireguard/pi2-wg0.conf pi2@192.168.8.195:~
    sudo scp -i ~/.ssh/pi /etc/wireguard/pi-wg0.conf pi@192.168.8.211:~
    #move to correct location
    sudo cp pi1-wg0.conf /etc/wireguard
    sudo cp pi2-wg0.conf /etc/wireguard
    sudo wg-quick up pi1-wg0
    sudo wg-quick up pi2-wg0
    ping 10.0.0.1
    #set to start at startup
    sudo systemctl enable wg-quick@pi-wg0
#12 Coonfigure Ceulluar modem
    sudo apt install git
    git clone https://github.com/sixfab/Sixfab_PPP_Installer.git
    cd Sixfab_PPP_Installer
    #make it executable
    chmod +x ppp_install.sh
    sudo ./ppp_install.sh
#13 run through modem setup
    fast.t-mobile.com (for t-mobile)
    broadband (for AT&T)
    h2g2 (for googlefi)
    #after make sure you can ping from your ppp interface
    ifconfig
    ping -I ppp0 8.8.8.8
#14 configure ceullular modem
    sudo apt install minicom
    sudo minicom --baudrate 115200 --device /dev/ttyUSB2
    #run through AT commands
    at+cops? Provides network information
    at+csq   Provides RSSI value for network
    at+qgps? Provides GPS state
    at+qgps=1 Turns on GPS
    at+qgpscfg=”autogps”,1 Turns on GPS at boot
    at+qgmr # this will check the firmware of your device
        #EG25GGBR07A08M2G_30.006.30.006 BAD FIRMWARE
        sudo apt install fastboot

        echo -ne "AT+QFASTBOOT\r" > /dev/ttyUSB2
        fastboot flash modem NON-HLOS.ubi
        fastboot reboot
    ‘CTRL+a’ and then ‘z’			Exits minicom
    ###FOR TELIT GPS
    at$gpsrst	Sets GPS to factory	
    at$gpsacp	Clears GPS history
    at$gpsnmun=2,1,1,1,1,1,1	Enable GNSS data
    at$gpssav	Saves GPS setting
    CTRL+a and then ‘z’					Exit
#15 Configure GPS
    sudo apt install gpsd gpsd-clients
    sudo nano /etc/default/gpsd
    #make the below additions
    Devices=”/dev/ttyUSB1”
    #restart the daemon
    sudo systemctl restart gpsd
#16 Modify SSH to create an alias
    sudo nano ~/. /config
    #add another vpns
    HOST pi2_vpn
    Hostname 10.0.0.5
    User pi2
    IdentityFile ~/.ssh/pi2
#17 OPSEC
    sudo nano /boot/config.txt
    #Add the following at the bottom:
    dtoverlay=disable-wifi
    dtoverlay=disable-bt





    

