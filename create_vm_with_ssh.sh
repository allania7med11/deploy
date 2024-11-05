#!/bin/bash

# Variables
VM_NAME="portfolio"
UBUNTU_VERSION="jammy"
CPUS="2"
MEMORY="4000M"
DISK="10G"
SSH_KEY="$HOME/.ssh/id_rsa.pub"  # Path to your SSH public key

# Create a Multipass VM with the specified configuration
multipass launch $UBUNTU_VERSION --name $VM_NAME --cpus $CPUS --memory $MEMORY --disk $DISK

# Check if the SSH key exists
if [ -f "$SSH_KEY" ]; then
  # Copy the SSH public key to the VM
  multipass exec $VM_NAME -- bash -c "mkdir -p ~/.ssh && echo '$(cat $SSH_KEY)' >> ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys"
  echo "SSH key has been copied to the VM."
else
  echo "SSH public key not found at $SSH_KEY. Please generate one using 'ssh-keygen' if needed."
fi
