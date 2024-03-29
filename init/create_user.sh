#!/bin/bash
echo "****Load variables from $SCRIPT_DIR/.env****"
SCRIPT_DIR="$(dirname "${BASH_SOURCE[0]}")"
source "$SCRIPT_DIR/.env"

# Set default values or use environment variables if available
USERNAME="${USERNAME:your_username}"
SSH_PUBLIC_KEY="${SSH_PUBLIC_KEY:-your_ssh_key_here}"

# Create a new user
adduser "$USERNAME"

# Add the new user to the sudo group
usermod -aG sudo "$USERNAME"

# Set up SSH access for the new user
su - "$USERNAME" <<EOF
mkdir ~/.ssh
chmod 700 ~/.ssh
echo "$SSH_PUBLIC_KEY" >> ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys
exit
EOF

# Optional: Configure SSH for security
sudo sed -i 's/PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
sudo systemctl restart ssh

echo "User $USERNAME created with sudo rights and SSH access."
