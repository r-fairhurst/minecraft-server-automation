#!/bin/bash

INSTANCE_IP=$(cat ansible/host_ip.txt)

while true; do
    nmap -sV -Pn -p T:25565 "$INSTANCE_IP" | grep -q "25565/tcp open"
    if [ $? -eq 0 ]; then
        echo "Port 25565 is open!"
        break
    else
        echo "Port 25565 is not open. Retrying in 10 seconds..."
        sleep 10
    fi
done