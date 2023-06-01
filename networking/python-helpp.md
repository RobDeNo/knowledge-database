# Python used objec a doi
```Python
socket(ip,port)
a=22
#do not put quotes on integers
a=22.2
#this is a float, only one PERIOD
b="Big Wang"
#text needs to be in quotes
c='\"Big Wang, its what's for dinner\"'
"\"\""
#This is escaping the quotes
ip="10.10.0.40"
#ip needs to be in a string
hex=0x40
#Hex can be an integer


#Network Programming with Python 3
import socket
s = socket.socket(socket.FAMILY, socket.TYPE, socket.PROTOCOL)
                (socket.AF_INET,socket.SOCK_STREAM, 0 )
                (socket.AF_INET6,socket.SOCK_DGRAM, 0)
                (socket.AF_INET6,socket.SOCK_RAW, 0)

python3
dir() # shows whats in namespace
dir(___builtins___) #looks at built in commands
import socket # this will import the saocket module
from socket import socket
from socket import AF_INET
from socket import SOCK_STREAM
from socket import IPPROTO_TCP
s=socket(AF_INET, SOCK_STREAM, IPPROTO_TCP)
import socket as bobby
import scapy as robby
--------------------------------------------------------------------------------
####
Client                                              Server Socket
socket(family,type,proto)                           socket(family,type,`proto)
                                                    setsocket(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
                                                    bind((", port)) #this is a tuple
                                                    listen(1) - Enable a server to accept TCP connections
----------------------------------------------------------------------------------------------------------
connect((ip,port)) - TCP only                       accept() - TCP only
----------------------------------------------------------------------------------------------------------
sento() - send to unestablished socket              recv() - recv data from socket
send() - send to established socket                 recvfrom() - recv data from socket #TCP
sendall() - repeats 'send' until all data send                                        #TCP
----------------------------------------------------------------------------------------------------------
recv() - recv data from socket                      sento() - send to unestablished socket
recvfrom() - recv data from socket                  end() - send to established socket
                                                    sendall() - repeats 'send' until all data send
----------------------------------------------------------------------------------------------------------                     
close() - Close a socket file descriptor            close() - Close a socket file descriptor
----------------------------------------------------------------------------------------------------------