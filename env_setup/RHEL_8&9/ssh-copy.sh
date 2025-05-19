#!/bin/bash

# Define the list of hosts
HOSTS=("192.168.10.101" "192.168.10.102" "192.168.10.201" "192.168.10.202")

# Define the username to use for SSH
USERNAME="support"

# Loop through each host and copy the SSH key
for HOST in "${HOSTS[@]}"; do
    echo "Copying SSH key to $HOST..."
    sshpass -p "2fudge" ssh-copy-id -o StrictHostKeyChecking=no $USERNAME@$HOST
done