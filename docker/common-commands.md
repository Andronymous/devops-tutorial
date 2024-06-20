### The Docker Command Line Interface (CLI) is the primary tool for interacting with Docker. It allows users to execute commands to control Docker objects like containers, images, volumes, and
## Common Commands:

```shell
# Check the installed Docker version.
docker --version 

# Display system-wide information about Docker.
docker info 

# Create and start a container from an image.
docker run hello-world  

# List running containers.
docker ps 

# List all containers (including stopped ones).
docker ps -a 

# List all Docker images on the system.
docker images 

# Pull an image from a Docker registry.
docker pull nginx 

# Build an image from a Dockerfile.
docker build -t my-image . 

# Stop a running container.
docker stop my-container 

# Remove a stopped container.
docker rm my-container 

# Remove an image.
docker rmi my-image 

# Run a command in a running container.
docker exec -it my-container /bin/bash 
```

