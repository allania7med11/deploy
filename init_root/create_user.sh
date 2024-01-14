#!/bin/bash

useradd -m -d /home/$REMOTE_USERNAME $REMOTE_USERNAME
echo -e "$REMOTE_PASSWORD\n$REMOTE_PASSWORD" | sudo passwd "$REMOTE_USERNAME"
usermod -aG sudo $REMOTE_USERNAME
su -s /bin/bash $REMOTE_USERNAME
cd
mkdir -p /home/$REMOTE_USERNAME/.ssh    
sudo cat /root/id_rsa.pub >> /home/$REMOTE_USERNAME/.ssh/authorized_keys
