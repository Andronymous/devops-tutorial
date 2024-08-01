#!/bin/bash

docker build --no-cache=true -t hub.andronymous.ir/devops/ansible-controller .
#docker push hub.andronymous.ir/devops/ansible-controller



#common flags :
#
#-f, --file:
#Description: Specify a Dockerfile to use (default is Dockerfile in the build context).
#Example: docker build -f Dockerfile.dev .
#
#--build-arg:
#Description: Set build-time variables that are accessible like environment variables during the build.
#Example: docker build --build-arg VERSION=1.0 .
#
#-q, --quiet:
#Description: Suppresses the build output and prints only the image ID.
#Example: docker build -q .
#
#--no-cache:
#Description: Do not use cache when building the image.
#Example: docker build --no-cache .
#
#--pull:
#Description: Always attempt to pull a newer version of the base images.
#Example: docker build --pull .
#
#--network:
#Description: Set the networking mode for the RUN instructions during the build.
#Example: docker build --network host .
#
#--label:
#Description: Set metadata for an image.
#Example: docker build --label version="1.0" .
#
#-m, --memory:
#Description: Set memory limit for the build container.
#Example: docker build -m 2GB .
