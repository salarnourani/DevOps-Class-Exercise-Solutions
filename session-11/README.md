Docker Session Overview (Short Introduction)

1. Docker CLI Container  
A lightweight container that includes only the Docker CLI and connects to the host’s Docker daemon via the mounted docker.sock.  
This allows running Docker commands from inside a container while all actions are executed on the host.

2. SSH-enabled Alpine Container  
A minimal Alpine Linux container with an SSH server enabled and a non-root user configured.  
Used for remote access, testing, or basic administration through SSH with very low resource usage.

3. MariaDB Docker Setup  
A database container built from the official MariaDB image with predefined credentials and network settings.  
It runs MariaDB in an isolated, reproducible environment and can be attached to a static Docker network.

Note:  
docker commit can be used to create a temporary image snapshot from a running container, but Dockerfiles are the preferred and recommended approach for long-term image management.

