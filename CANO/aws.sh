lightsail

#1. Create Instance
#2. create SSH Key
    cp AWS_student1.pem ~/.ssh
#3. INSTALLING WIREGUARD VPN
#4. Modify the ssh key permissions chmod 400 aws1.pem(LAPTOP)
    chmod 400 AWS_student1.pem
#5. now SSH into your box and chmod they key
    chmod 0400 AWS1.pem
    ssh -i AWS_student1.pem ubuntu@184.72.214.201
    sudo apt update && sudo apt upgrade -y
    sudo apt install wireguard jq -y
    sudo modprobe wireguard #ensure functioning with the kernel
#6. Download wireguard setup and SCP over to the ubuntu server
    scp -i ~/.ssh/AWS1.pem wireguard-manager.sh ubuntu@3.208.15.191:~
#7. Change permissions of the file to make it executable
    sudo chmod 700 wireguard-manager.sh
    sudo cp wireguard-manager.sh /etc/wireguard/
    #execute the wireguard script to setup
        sudo bash /etc/wireguard/wireguard-manager.sh
        #1 for everything, name it at the end
        # update to allow wireguard through your firewall port 51820
#8. now onto undate AWS
    manage>networking>add rule
#9. add another certificate/peer
    rerun wireguard and select number 5
    #create all your wireguard peers!!!
#10. (VPS)now you need to move the certs on the VPS to its HOME directory
    cp /etc/wireguard/clients/*.conf . # won't show really
    #install wireguard on laptop
#11. (LAPTOP)now SCP the files, by pulling them down from the VPS
    sudo scp -i ~/.ssh/AWS1.pem ubuntu@3.208.15.191:~/*.conf /etc/wireguard/ #KEEP TRYING
#12. Now added wire guard config to your computer
    sudo wg-quick up laptop-wg0
    ping 10.0.0.1 # this test the connection
    # add aliases to bashrc
    sudo nano ~/.bashrc
    alias wg_up='sudo wg-quick up laptop-wg0'
    alias wg_down='sudo wg-quick down laptop-wg0'
    source ~/.bashrc

#13. Now login to your AWS platform with your wireguard on
    ssh -i ~/.ssh/AWS_student1.pem ubuntu@10.0.0.1
#14. (LAPTOP)Now edit your file nano /home/a28/.ssh/config
HOST vps_vpn
Hostname 10.0.0.1
User ubuntu
IdentityFile ~/.ssh/AWS1.pem

15. scp new_VPN:~/new
