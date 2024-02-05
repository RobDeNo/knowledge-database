Containerization is a process of packaging and running applications in isolated environments, such as a container, virtual machine, or serverless environment. 
DOCKER - open source platform for automating deployment as self contained containers
# script to install docker on ubuntu
-----------------------------------
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
------------------------------------

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
- sice the image has been created it can be executed through the docker engine
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

