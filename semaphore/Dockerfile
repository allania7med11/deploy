FROM semaphoreui/semaphore:latest

# Switch to root user to install packages
USER root

# Set default UID and GID (to be overridden at build time)
ARG NEW_UID=1000
ARG NEW_GID=1000

# Install required packages and dependencies in a single step
RUN if [ -f "/etc/alpine-release" ]; then \
    apk update && apk add --no-cache sudo python3 py3-pip bash shadow; \
    fi && \
    echo "semaphore ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/semaphore && \
    chmod 0440 /etc/sudoers.d/semaphore && \
    addgroup -g $NEW_GID semaphore || true && \
    usermod -u $NEW_UID -g $NEW_GID semaphore && \
    pip3 install --upgrade ansible && \
    ansible --version

# Ensure /etc/semaphore and /app exist and are writable
RUN mkdir -p /etc/semaphore /app /home/semaphore/.ssh && \
    chown -R semaphore:semaphore /etc/semaphore /app /home/semaphore && \
    chmod 775 /etc/semaphore /app && \
    chmod 700 /home/semaphore/.ssh

# Copy application files after setting correct permissions
COPY . /app/
RUN chown -R semaphore:semaphore /app

# SSH Setup - Ensure it exists and set correct permissions
RUN if [ -d "/app/ansible/.ssh/" ]; then \
    cp -r /app/ansible/.ssh/* /home/semaphore/.ssh/; \
    fi && \
    chown -R semaphore:semaphore /home/semaphore/.ssh && \
    chmod 700 /home/semaphore/.ssh && \
    find /home/semaphore/.ssh/ -type f -exec chmod 600 {} \; && \
    find /home/semaphore/.ssh/ -type d -exec chmod 700 {} \;

# Ensure /tmp/semaphore/.ansible/tmp exists and is writable by semaphore
RUN mkdir -p /tmp/semaphore/.ansible/tmp && \
    chown -R semaphore:semaphore /tmp/semaphore && \
    chmod -R 700 /tmp/semaphore

# Switch back to non-root user
USER semaphore

# Set the working directory
WORKDIR /app
