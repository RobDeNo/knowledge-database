# Activate network interface
sudo ifconfig eth0 up     # OR
sudo ip link set eth0 up
# Assign IP to interface
sudo ifconfig eth0 192.168.1.2
# assign a etmask to an interface
sudo ifconfig eth0 netmask 255.255.255.0
# assign the route to an interface 
sudo route add default gw 192.168.1.1 eth0
# editing DNS settings
sudo vim /etc/resolv.conf
nameserver 8.8.8.8
nameserver 8.8.4.4
# editing interfaces
sudo vim /etc/network/interfaces
-----
auto eth0
iface eth0 inet static
  address 192.168.1.2
  netmask 255.255.255.0
  gateway 192.168.1.1
  dns-nameservers 8.8.8.8 8.8.4.4
  # restart network services
  sudo systemctl restart networking
TRAINING
SELinux
1.	Install SELinux on your VM.
2.	Configure SELinux to prevent a user from accessing a specific file.
3.	Configure SELinux to allow a single user to access a specific network service but deny access to all others.
4.	Configure SELinux to deny access to a specific user or group for a specific network service.
AppArmor
5.	Configure AppArmor to prevent a user from accessing a specific file.
6.	Configure AppArmor to allow a single user to access a specific network service but deny access to all others.
7.	Configure AppArmor to deny access to a specific user or group for a specific network service.
TCP Wrappers
8.	Configure TCP wrappers to allow access to a specific network service from a specific IP address.
9.	Configure TCP wrappers to deny access to a specific network service from a specific IP address.
10.	Configure TCP wrappers to allow access to a specific network service from a range of IP addresses.
