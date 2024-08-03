FROM semaphoreui/semaphore:latest

# Switch to root user to install packages
USER root

# Upgrade Ansible to the latest version
RUN pip3 install --upgrade ansible

# Verify the installation
RUN ansible --version

# Switch back to non-root user 
USER semaphore

