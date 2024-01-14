#!/bin/bash

# Load variables from .env
source "./.env"

# Copy id_rsa.pub file to the root user's home directory
scp ~/.ssh/id_rsa.pub root@"$REMOTE_HOST":/root

# Copy .env file to the root user's home directory
scp ./.env root@"$REMOTE_HOST":/root

# Copy the init_root directory to the root user's home directory
scp -r ./init_root root@"$REMOTE_HOST":/root

# Execute create_user.sh with environment variables
ssh root@"$REMOTE_HOST" <<EOF
cd /root
chmod +x ./init_root/create_user.sh
export $(cat .env | xargs) && ./init_root/create_user.sh
EOF
