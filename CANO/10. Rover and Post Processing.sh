#Rover
1. survey and analysis
2. very compatible
#Rage
work RF location with 
#Team connect
situational awareness while doing survey
#remote hardware
make a PI and stick with source to gather information
#mobile emitter analysis
randomizing macs makes it hard to find
mobile emittter anaylsis means you can compare digital address to lcoations and create POL

sudo cd /opt && mkdir rover
cd rover
cp /home/a28/Downloads/linux-64-x86_64-ROVER-4.23.2-gcc9-hf1-26oct2023.tar.bz2.gpg /opt/rover/
#now use the passcode to unpack the liscence, 8004189701
sudo gpg -o linux-64-x86_64-ROVER-4.23.2-gcc9-hf1-26oct2023.tar linux-64-x86_64-ROVER-4.23.2-gcc9-hf1-26oct2023.tar.bz2.gpg
#now unpack the file
sudo tar -xvjf linux-64-x86_64-ROVER-4.23.2-gcc9-hf1-26oct2023.tar
#now create the symlink to launcher to your path
sudo ln -s /opt/rover/ROVER64-4.23.2-gcc9-hf1/bin/ROVER-launcher /usr/local/bin/ROVER
et242-45at8-s44v-39wftd
2d242-46vwg-b39i-39wftd
pu242-4w8ku-gbf2-39wftd

################# INSTALL SIGNAL
# NOTE: These instructions only work for 64-bit Debian-based
# Linux distributions such as Ubuntu, Mint etc.

# 1. Install our official public software signing key:
wget -O- https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor > signal-desktop-keyring.gpg
cat signal-desktop-keyring.gpg | sudo tee /usr/share/keyrings/signal-desktop-keyring.gpg > /dev/null

# 2. Add our repository to your list of repositories:
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/signal-desktop-keyring.gpg] https://updates.signal.org/desktop/apt xenial main' |\
  sudo tee /etc/apt/sources.list.d/signal-xenial.list

# 3. Update your package database and install Signal:
sudo apt update && sudo apt install signal-desktop
#####################
# add target deck
View->Emiiter/Channel View->New/Emiiter View
Match Any ROVER Target
SIDEBAR -> laptops -> netowrk survey, save it
Tools->WifiDashboard, draw your rectangle
file-> open-> cloud stuff add



