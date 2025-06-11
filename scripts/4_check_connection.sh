!#/bin/bash

INSTANCE_IP=$(cat ansible/host_ip.txt)
nmap -sV -Pn -p T:25565 "$INSTANCE_IP"