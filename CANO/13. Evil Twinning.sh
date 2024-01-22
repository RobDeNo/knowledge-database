cd /opt 
sudo apt install haveged hostapd git util-linux procps iproute2 iw dnsmasq iptables

#now after finding prob, set card to mon master
## Step 1, capture traffic
sudo airodump-ng -c 11 --bssid <rogue mac> -w capture wlan1
sudo create -w 2 -c 9 --mac 00:c0:ca:b4:62:34 --frew-band 2.4 wlx00c0cab46234