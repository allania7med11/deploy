FROM semaphoreui/semaphore:latest

# Switch to root user to install packages
USER root

# Install required packages and dependencies in a single step
RUN if [ -f "/etc/alpine-release" ]; then \
    apk update && apk add --no-cache sudo python3 py3-pip bash shadow; \
    fi && \
    echo "semaphore ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/semaphore && \
    chmod 0440 /etc/sudoers.d/semaphore && \
    addgroup -g 1000 semaphore || true && \
    usermod -aG semaphore semaphore && \
    pip3 install --upgrade ansible && \
    ansible --version

# Ensure /etc/semaphore exists and is writable
RUN mkdir -p /etc/semaphore /app && \
    chown -R semaphore:semaphore /etc/semaphore /app && \
    chmod 775 /etc/semaphore

# Copy application files after setting correct permissions
COPY . /app/
RUN chown -R semaphore:semaphore /app

# SSH Setup - Ensure it exists and set correct permissions
RUN mkdir -p /home/semaphore/.ssh && \
    if [ -d "/app/ansible/.ssh/" ]; then \
    cp -r /app/ansible/.ssh/* /home/semaphore/.ssh/; \
    fi && \
    chown -R semaphore:semaphore /home/semaphore/.ssh && \
    chmod 700 /home/semaphore/.ssh && \
    find /home/semaphore/.ssh/ -type f -exec chmod 600 {} \; && \
    find /home/semaphore/.ssh/ -type d -exec chmod 700 {} \;

# Switch back to non-root user
USER semaphore

# Set the working directory
WORKDIR /app
