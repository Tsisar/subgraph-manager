#!/bin/bash

IMAGE_NAME="tsisarft/subgraph-manager:latest"

# Building the Docker image
echo "Building Docker image: $IMAGE_NAME"
docker build -t $IMAGE_NAME .
if [ $? -ne 0 ]; then
    echo "Error during Docker image $IMAGE_NAME build"
    exit 1
fi
echo "Docker image $IMAGE_NAME built successfully"

# Push Image to DockerHub
echo "Push Report Processor Image to DockerHub"
docker push $IMAGE_NAME
if [ $? -ne 0 ]; then
    echo "Error during image push"
    exit 1
fi
echo "Docker image $IMAGE_NAME pushed successfully"