#!/bin/bash

# Load variables from .env
source "./.env"

# Copy .env file to the  user's home directory
scp ./.env $REMOTE_USERNAME@$REMOTE_HOST:/home/$REMOTE_USERNAME

# Copy the init_dev directory to the  user's home directory
scp -r ./init_dev $REMOTE_USERNAME@"$REMOTE_HOST":/home/$REMOTE_USERNAME

# Install needed programs
# ssh $REMOTE_USERNAME@"$REMOTE_HOST" <<EOF
# /bin/bash
# cd /home/$REMOTE_USERNAME
# export $(cat .env | xargs) && /home/$REMOTE_USERNAME/init_dev/setup.sh
# EOF
