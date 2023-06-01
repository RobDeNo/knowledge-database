#!/usr/bin/python3
import socket
s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM, 0)
ip_addr = '172.16.80.106'
port = 2930
# Connect to a remote socket at address.
# s.connect((ip_addr, port)) # typically used for TCP
message = b"Message"
#Send data to the socket. The socket should not be connected to a remote socket. Typically used for UDP.
s.sendto(message, (ip_addr, port))
#Receive data from the socket. The return value is a pair (bytes, address) where bytes is a bytes object representing the data received and address is the address of the socket sending the data.
data, addr = s.recvfrom(1024)
# You can optionally use s.recv but it will only return (bytes)
#Default encoding is 'utf-8'. errors may be given to set a different error handling scheme. The default for errors is 'strict', meaning that encoding errors raise a UnicodeError.
print(data.decode())
# using "utf-8" default
# echo "no candy for you" | nc -lvp 2930 -u