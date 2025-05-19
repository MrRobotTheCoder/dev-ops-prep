#!/bin/bash

# Define the list of hosts
HOSTS=("192.168.10.101" "192.168.10.102" "192.168.10.201" "192.168.10.202")

# Define the username to use for SSH
USERNAME="support"

# Loop through each host and disable password authentication
for HOST in "${HOSTS[@]}"; do
    echo "Disabling password authentication on $HOST..."

    # Use SSH to modify the sshd_config file and restart the SSH service
    ssh $USERNAME@$HOST << EOF
        sudo sed -i 's/^#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
        sudo sed -i 's/^PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
        sudo systemctl restart sshd
EOF

    echo "Password authentication disabled on $HOST."
done