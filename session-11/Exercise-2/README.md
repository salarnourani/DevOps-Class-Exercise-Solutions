Alpine SSH Docker Container
===========================

This project provides a lightweight Alpine Linux–based Docker container
with an SSH server enabled and a non-root user configured with a home
directory. The container allows SSH access from the host machine.

--------------------------------------------------
Build Image
--------------------------------------------------
Build the Docker image using the provided Dockerfile:

docker build -t ssh:latest .

--------------------------------------------------
Run Container
--------------------------------------------------
Run the container in detached mode and map the host port to the container
SSH port:

docker run -itd \
  --name ssh-try \
  -p 10101:22 \
  ssh:latest

Host Port:      10101
Container Port: 22 (SSH)

--------------------------------------------------
SSH Connection
--------------------------------------------------
Connect to the container using SSH from the host system:

ssh -p 10101 $USER@localhost

On the first connection, confirm the host key by typing "yes".

--------------------------------------------------
User Credentials
--------------------------------------------------
Username: $USER
Password: 1234

--------------------------------------------------
Verification
--------------------------------------------------
After login, verify that the home directory exists:

pwd

Expected output:
/home/$USER

This confirms that:
- SSH access is working correctly
- The user home directory is properly created

--------------------------------------------------
Security Notice
--------------------------------------------------
This setup is intended for educational and laboratory purposes only.

For production environments:
- Use SSH key-based authentication
- Disable password authentication
- Disable root login
- Avoid running SSH alongside unrelated services

--------------------------------------------------
Summary
--------------------------------------------------
- Lightweight Alpine-based container
- SSH server enabled
- Non-root user with home directory
- SSH access via port mapping
