!(tcp.port==22) = not that port
# create a capture filter in wireshark
- not port 22 not port 23
# Wireshark + TCP Dump Cheat Sheet
https://packetlife.net/media/library/13/Wireshark_Display_Filters.pdf
[wire](/home/usacys/Documents/rob/knowledge-database/pictures/1-tcp-dump-cheat-sheet.png)
# class notes
https://www.evernote.com/shard/s83/client/snv?isnewsnv=true&noteGuid=41d8e616-db39-468a-be1e-56c80d7bc901&noteKey=6a541e0af8cf7e6a2be6aa591826ae67&sn=https%3A%2F%2Fwww.evernote.com%2Fshard%2Fs83%2Fsh%2F41d8e616-db39-468a-be1e-56c80d7bc901%2F6a541e0af8cf7e6a2be6aa591826ae67&title=Class%2BInfo


sudo tcpdump -n -e(ehternet header)x(heaxdump)
sudo tcpdump -n -e -w test.pcap
## Logical operators
-define a function of BPF

- tcpdump 
  - [header]ether arp ip ip6 tcp udp icmp
    - [byte#:#bytes]0:2(halfword)0:4(word)
    - you can't read three bytes
      - & mask operator solution
tcpdump  -i etho0 'tcp[0:2]=53 || tcp[2:2]=22'
tcpdump  ether[12:2]=0x0806
    - this will read only the arp
tcpdump tcp{13}=0x12 most exclusive 
    -this will find the ACK and SYNS
tcpdump ip[0]=0x45
tcpdump ip[0] & 0xF0 = 0x40
    - this will narrow down the first byte of the version field of an ip header

tcpdump ip[6]=32
    -
tcpdump ip[6] & 64 = 64
    -this will only see the DF bit, not the reserved bit
tcpdump ip[6] & 224 = 64
    -this will read all the top bits
tcpdump ip[6] & 224 !=32 ### !=0
---------------------------------------------------------------
  HEX 8     4       2       1       8       4       2       1
----------------------------------------------------------------
 DEC 128    64      32      16      8       4       2       1
-----------------------------------------------------------------
DSCP 32    16      8       4       2       1        --      --

tcpdump ip [1]=112
tcpdump ip[1]& 0xFC
tcpdump ip[1] = 112
              & 252
              >>2=28



sudo tcpdump -n 'ip[8]<=64||ip[7]<=64'
sudo tcpdump -n 'ip[8]<=64||ip6[7]<=64' -r BPFCheck.pcap | wc -l
# evernote
## Day 1-2
https://www.evernote.com/shard/s83/client/snv?isnewsnv=true&noteGuid=f381d7b0-fc99-4150-a57d-a00409464e56&noteKey=84fe463e70df5bcdcb03a0fa275954be&sn=https%3A%2F%2Fwww.evernote.com%2Fshard%2Fs83%2Fsh%2Ff381d7b0-fc99-4150-a57d-a00409464e56%2F84fe463e70df5bcdcb03a0fa275954be&title=Day%2B1-2%2B-%2BFundamentals
## Day 3
https://www.evernote.com/shard/s83/client/snv?isnewsnv=true&noteGuid=939a7280-d014-4cb1-80ab-e3e6155a2a18&noteKey=21c259a8014e94cd7cf6f9433c928955&sn=https%3A%2F%2Fwww.evernote.com%2Fshard%2Fs83%2Fsh%2F939a7280-d014-4cb1-80ab-e3e6155a2a18%2F21c259a8014e94cd7cf6f9433c928955&title=Day%2B3%2B-%2BFundamentals%2B%2528Traffic%2BCapture%2529