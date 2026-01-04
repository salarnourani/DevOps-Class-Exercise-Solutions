Docker CLI Container (Using Host Docker Daemon)
===============================================

This project demonstrates how to run Docker commands inside a container
by connecting to the Docker daemon running on the host system.

--------------------------------------------------
Build Image
--------------------------------------------------
Build the image from the provided Dockerfile:

docker build -t docker-cli .

--------------------------------------------------
Run Container
--------------------------------------------------
Start the container and connect it to the host Docker daemon
by mounting the Docker socket:

docker run -it \
  --name docker-cli \
  -v /var/run/docker.sock:/var/run/docker.sock \
  docker-cli

--------------------------------------------------
Running Docker Commands Inside the Container
--------------------------------------------------
After starting the container, you will be inside its shell.

Check running containers:

docker ps

Run a test container:

docker run hello-world

Even though these commands are executed inside the container,
all containers are created and managed by the host Docker daemon.

--------------------------------------------------
Docker Daemon Explanation
--------------------------------------------------
Docker consists of two main parts:

- Docker CLI: The command-line tool (docker)
- Docker Daemon: The background service (dockerd)

In this setup:
- Docker daemon runs on the host machine
- The container does NOT run its own daemon
- The container communicates with the host daemon through:
  /var/run/docker.sock

This approach is known as:
Docker Outside of Docker (DoD)

--------------------------------------------------
Important Notes
--------------------------------------------------
- All docker commands inside the container affect the host system
- Containers started from inside this container are visible on the host
- Mounting docker.sock gives the container full control over Docker

--------------------------------------------------
Use Cases
--------------------------------------------------
- CI/CD pipelines
- Build environments
- Automation and testing
- Learning Docker internals

--------------------------------------------------
Summary
--------------------------------------------------
- Docker daemon runs on the host
- Docker CLI runs inside the container
- Communication is done via docker.sock
- No Docker daemon is running inside the container

