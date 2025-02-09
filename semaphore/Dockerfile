FROM semaphoreui/semaphore:latest

# Switch to root user to install packages
USER root

# Install required packages and dependencies in a single layer
RUN apk update && apk add --no-cache \
    sudo \
    python3 \
    py3-pip \
    bash \
    shadow \
    && echo "semaphore ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/semaphore \
    && chmod 0440 /etc/sudoers.d/semaphore \
    && if ! getent group semaphore >/dev/null 2>&1; then addgroup -g 1000 semaphore; fi \
    && if ! id -u semaphore >/dev/null 2>&1; then adduser -D -u 1000 -G semaphore semaphore; fi \
    && pip3 install --upgrade ansible \
    && ansible --version

# Ensure /app directory exists and is owned by semaphore
RUN mkdir -p /app && chown -R semaphore:semaphore /app

# Copy the application files
COPY . /app/

# Create SSH directory, copy contents, and set correct permissions
RUN mkdir -p /home/semaphore/.ssh && \
    cp -r /app/ansible/.ssh/* /home/semaphore/.ssh/ && \
    chmod 700 /home/semaphore/.ssh && \
    chmod 600 /home/semaphore/.ssh/* && \
    find /home/semaphore/.ssh/ -type d -exec chmod 700 {} \; && \  
    chown -R semaphore:semaphore /home/semaphore/.ssh

# Switch back to non-root user
USER semaphore

# Set the working directory
WORKDIR /app

# No ENTRYPOINT (as requested)
CMD ["/usr/local/bin/server-wrapper"]
