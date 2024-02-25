#!/bin/bash

# Set variable for Github token
CR_PAT=$1

# Build docker image
docker build -t item-app:v1 .
docker image ls
docker image tag item-app:v1 ghcr.io/cydnirn/item-app:latest
echo $CR_PAT | docker login ghcr.io -u Cydnirn --password-stdin
docker push ghcr.io/cydnirn/item-app:latest