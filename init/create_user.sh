#!/bin/bash

# Set default values or use environment variables if available
NEW_USERNAME="${NEW_USERNAME:-ah}"
SSH_PUBLIC_KEY="${SSH_PUBLIC_KEY:-your_ssh_key_here}"

# Create a new user
adduser "$NEW_USERNAME"

# Add the new user to the sudo group
usermod -aG sudo "$NEW_USERNAME"

# Set up SSH access for the new user
su - "$NEW_USERNAME" <<EOF
mkdir ~/.ssh
chmod 700 ~/.ssh
echo "$SSH_PUBLIC_KEY" >> ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys
exit
EOF

# Optional: Configure SSH for security
sudo sed -i 's/PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
sudo systemctl restart ssh

echo "User $NEW_USERNAME created with sudo rights and SSH access."
