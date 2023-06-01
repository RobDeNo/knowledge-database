# Socekt Types
1. Stream - connection oriented, TCP SCTP, blue(user space)
2. Datagram - connectionless similar to UDP(User space)
3. Raw - direct sending and recicing of IP packets(Kernel PSace)

# netcat
```shell
# can only do above well known ports
nc -lvp "1024 and above"

# can only do above well known ports
netstat antlp

nc -lvp 1024
nc 10.10.0.40 1024
nc 127.0.0.1 1024
