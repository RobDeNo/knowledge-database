#!/bin/bash
#This script will update and upgrade current software. Additionally will install net tools if not already presemt
sudo apt update
sudo apt upgrade
sudo intall net-tools -y
