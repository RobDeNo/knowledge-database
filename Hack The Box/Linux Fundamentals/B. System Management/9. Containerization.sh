Containerization is a process of packaging and running applications in isolated environments, such as a container, virtual machine, or serverless environment. 
DOCKER - open source platform for automating deployment as self contained containers
# script to install docker on ubuntu
--------------------------------------------------------------------
#!/bin/bash
# Preparation
sudo apt update -y
sudo apt install ca-certificates curl gnupg lsb-release -y
sudo mkdir -m 0755 -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker Engine
sudo apt update -y
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

# Add user htb-student to the Docker group
sudo usermod -aG docker htb-student
echo '[!] You need to log out and log back in for the group changes to take effect.'

# Test Docker installation
docker run hello-world
------------------------------------------------------------------------

Creating a docker image is done be creating a docker file   all the instructions the Docker engine needs to create the container.
Requirement;
    1. Apache 
    2. SSH
################# DOCKERFILE #####################
------------------------------------------------------
# Use the latest Ubuntu 22.04 LTS as the base image
FROM ubuntu:22.04

# Update the package repository and install the required packages
RUN apt-get update && \
    apt-get install -y \
        apache2 \
        openssh-server \
        && \
    rm -rf /var/lib/apt/lists/*

# Create a new user called "student"
RUN useradd -m docker-user && \
    echo "docker-user:password" | chpasswd

# Give the htb-student user full access to the Apache and SSH services
RUN chown -R docker-user:docker-user /var/www/html && \
    chown -R docker-user:docker-user /var/run/apache2 && \
    chown -R docker-user:docker-user /var/log/apache2 && \
    chown -R docker-user:docker-user /var/lock/apache2 && \
    usermod -aG sudo docker-user && \
    echo "docker-user ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Expose the required ports
EXPOSE 22 80

# Start the SSH and Apache services
CMD service ssh start && /usr/sbin/apache2ctl -D FOREGROUND
------------------------------------------------------
# now you need to Convert the docker file to an image
docker build -t FS_docker .
- since the image has been created it can be executed through the docker engine
- now start the container by running the below
    docker run -p <host port>:<docker port> -d <docker container name> #docker run syntax
    docker run -p 8022:22 -p 8080:80 -d FS_docker # Docker Run
    # In this case, we start a new container from the image FS_docker and map the host 
    # ports 8022 and 8080 to container ports 22 and 80, respectively. The container runs 
    # in the background, allowing us to access the SSH and HTTP services inside the container using the specified host ports.

DOCKER MANAGEMENT
Command	        Description
docker ps	    # List all running containers
docker stop	    # Stop a running container.
docker start	# Start a stopped container.
docker restart	# Restart a running container.
docker rm	    # Remove a container.
docker rmi	    # Remove a Docker image.
docker logs	    # View the logs of a container.

## Linux Containers ####################
Linux Containers (LXC) is a virtualization technology that allows multiple isolated Linux systems to run on a single host.
- isolation features such as cgroups and namespaces
# installing LXC
sudo apt-get install lxc
sudo apt-get install lxc lxc-utils -y
# creating a new ubuntu container you would use the below syntax 
sudo lxc-create -n linuxcontainer -t ubuntu # the new container would be name "linuxcontainer" from the ubuntu OS
## Managing LXC Containers
lxc-ls	List all existing containers
lxc-stop -n <container>	Stop a running container.
lxc-start -n <container>	Start a stopped container.
lxc-restart -n <container>	Restart a running container.
lxc-config -n <container name> -s storage	Manage container storage
lxc-config -n <container name> -s network	Manage container network settings
lxc-config -n <container name> -s security	Manage container security settings
lxc-attach -n <container>	Connect to a container.
lxc-attach -n <container> -f /path/to/share	Connect to a container and share a specific directory or file.

# isolated enviormenets for testing specific needs are critical and aving gime and not running into errors.
/usr/share/lxc/config/<container name>.conf
# create a file here t limit resources, adding the below parsmeters to limit the cpu
lxc.cgroup.cpu.shares = 512 #cpu time
lxc.cgroup.memory.limit_in_bytes = 512M #amount of ram to use
# restart the service to apply changes
sudo systemctl restart lxc.service

1	Install LXC on your machine and create your first container.
2	Configure the network settings for your LXC container.
3	Create a custom LXC image and use it to launch a new container.
4	Configure resource limits for your LXC containers (CPU, memory, disk space).
5	Explore the lxc-* commands for managing containers.
6	Use LXC to create a container running a specific version of a web server (e.g., Apache, Nginx).
7	Configure SSH access to your LXC containers and connect to them remotely.
8	Create a container with persistence, so changes made to the container are saved and can be reused.
9	Use LXC to test software in a controlled environment, such as a vulnerable web application or malware.



