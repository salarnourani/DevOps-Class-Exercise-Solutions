FROM alpine:latest

# Install packages
RUN apk add --no-cache \
    openssh \
    bash \
    sudo

# Configure SSH
RUN ssh-keygen -A && \
    mkdir -p /var/run/sshd

# Create user with home directory
RUN adduser -D -s /bin/bash salar && \
    echo "salar:1234" | chpasswd && \
    addgroup salar wheel

# Expose SSH port
EXPOSE 22

# Run SSH daemon
CMD ["/usr/sbin/sshd", "-D"]
