### The Docker Command Line Interface (CLI) is the primary tool for interacting with Docker. It allows users to execute commands to control Docker objects like containers, images, volumes, and
## Common Commands:

#### Check the installed Docker version.
```shell
docker --version 
```

#### Display system-wide information about Docker.
```shell
docker info 
```

#### Create and start a container from an image.
```shell
docker run hello-world  
```

#### List running containers.
```shell
docker ps 
```

#### List all containers (including stopped ones).
```shell
docker ps -a 
```

#### List all Docker images on the system.
```shell
docker images 
```

#### Pull an image from a Docker registry.
```shell
docker pull nginx 
```

#### Build an image from a Dockerfile.
```shell
docker build -t my-image . 
```

#### Stop a running container.
```shell
docker stop my-container 
```

#### Remove a stopped container.
```shell
docker rm my-container 
```

#### Remove an image.
```shell
docker rmi my-image 
```

#### Run a command in a running container.
```shell
docker exec -it my-container /bin/bash 
```

