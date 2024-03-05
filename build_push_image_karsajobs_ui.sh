#!/bin/bash

# Set variable for Github token
CR_PAT=$1
Hash=$(git rev-parse --short HEAD)

# Build docker image
docker build --network=host -t karsajobs-ui:$Hash .
docker image tag karsajobs-ui:$Hash ghcr.io/cydnirn/karsajobs-ui:latest
echo $CR_PAT | docker login ghcr.io -u Cydnirn --password-stdin
docker push ghcr.io/cydnirn/karsajobs-ui:latest