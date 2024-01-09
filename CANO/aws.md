lightsail

1. Create Instance
2. create SSH Key
    cp AWS_student1.pem ~/.ssh
3. INSTALLING WIREGUARD VPN
4. Modify the ssh key permissions chmod 400 aws1.pem
    chmod 400 AWS_student1.pem
5. now SSH into your box 
    ssh -i AWS_student1.pem ubuntu@184.72.214.201
    sudo apt update && sudo apt upgrade -y
    sudo apt install wireguard jq -y
    sudo modprobe wireguard
6. SCP the file over for the setup
    scp -i ~/.ssh/AWS_student1.pem wireguard-manager.sh ubuntu@184.72.214.201:~
7. Change permissions of the file to make it executable
    sudo chmod 700 wireguard-manager.sh
    sudo cp wireguard-manager.sh /etc/wireguard/
####change wiregaurd default port number
8. now onto undate AWS
    manage>networking>add rule
9. add another certificate/peer
    rerun wireguard and select number 5
10. now you need to move the certs on the VPS to its HOME directory
    cp /etc/wireguard/clients/*.conf .
11. now SCP the files, by pulling them down from the VPS
    sudo scp -i ~/.ssh/AWS_student1.pem ubuntu@184.72.214.201:~/*.conf /etc/wireguard
12. Now added wire guard config to your computer
    sudo wg-quick up laptop-wg0
13. Now login to your AWS platform with your local stuff
    ssh -i ~/.ssh/AWS_student1.pem ubuntu@10.0.0.1
14. Now edit your file nano /home/a28/.ssh/config
    Hostname 
    HOST VPN  10.0.0.1
    User ubuntu
    IdentityFile ~/.ssh/AWS_student1
15. scp new_VPN:~/new
