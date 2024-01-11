#1 editing your interface
sudo nano /etc/udev/rules.d/70-persistant-net-rules
    #run to searchfr for your interface(wireless)
    ifconfig
    SUBSYSTEM=="net", ACTION=="add", DRIVERS=="?*", ATTR{address}=="e0:c2:64:bc:4d:5f", NAME="wlan0"
#2 not edit the grub
    sudo nano /etc/default/grub
    GRUB_CMDLINE_LINUX="net.ifnames=0 biosdevname=0"
#3 now update your system wit the changes
    sudo update-grub
    sudo update-initramfs -u
    reboot