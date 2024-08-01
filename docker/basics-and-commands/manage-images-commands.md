## The Docker Command Line Interface (CLI) is the primary tool for interacting with Docker. It allows users to execute commands to control Docker objects like containers, images, volumes, and
## Managing Docker Images Commands:


#### Pull an image from a Docker registry.
```shell
docker pull <repository>/<image_name>:<tag>
```

#### Push an image to a Docker registry.
```shell
docker push <repository>/<image_name>:<tag>
```

#### List all Docker images on the system :
```shell
docker images
```

#### Tagging an Image
```shell
docker tag <image_id> <repository>/<image_name>:<tag>
```

#### Remove an image : 
```shell
docker rmi my-image
```

#### Saving Docker Images :
```shell
docker save -o <path>/<file_name>.tar <image_name>:<tag>
```

#### Loading Docker Images :
```shell
docker load -i <path>/<file_name>.tar
```

#### Inspecting Docker Images :
```shell
docker inspect <image_id>
```

#### Pruning Unused Images :
```shell
docker image prune
```

