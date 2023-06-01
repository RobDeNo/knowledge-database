#!/usr/bin/python3


import socket
import os

port = 1337

message = b"Connected to TCP Server on port %i\n" % port
# % is to assign a interpolation placeholder for information to be supplied (Python 3 string formatting). i=integer, c=character and s=string


# Create TCP stream socket using IPv4
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM, 0)

# This prevents the bind from being stuck in TIME_WAIT state. The SO_REUSEADDR flag tells the kernel to reuse a local socket in
TIME_WAIT state, without waiting for its natural timeout to expire. Will not work if the socket is to the same destination.
s.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)

# Bind the socket to address.  The socket must not already be bound.
# '' Ties the socket to any IPv4 address on this device
s.bind(('', PORT))
# Enable a server to accept connections. Listens for 1 request toconnect
s.listen(1)

# Execute the command (a string) in a subshell.
os.system("clear")
print ("Waiting for TCP connections\n")

#Listens for connections until stopped
while 1:
    # This accepts connections from clients and creates a new socket.
    # The return value is a pair (conn, address)
    # conn = a new socket object usable to send and receive data on the connection (local)
    # address = the address bound to the socket on the other end of the connection (remote)
    conn, addr = s.accept()

    # Waits for a message to be sent across and breaks out the address
    # Receive data from the socket.
    # The return value is a bytes object representing the data received.
    # The maximum amount of data to be received at once is specified by bufsize
    connect = conn.recv(1024)
    # connect = data recieved from remote to your local socket.
    address, port = addr
    # splits addr into 2 variables that is contained within it. Remote IP and remote port.
   
    # Prints the message
    print ("Message Received - '%s'" % connect.decode())  # Attempts to decode the message sent into utf-8 by default
    print ("Sent by -", address, "port -", port, "\n")  # Extracts the address and port that sent the message

    # Sends our message in response. Used when there is a remote connection (TCP)
    conn.sendall(message)

    # Closes the local connection from remote
    conn.close()