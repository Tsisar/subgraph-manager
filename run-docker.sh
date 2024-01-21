#!/bin/bash

IMAGE_NAME="tsisarft/subgraph-manager:latest"

HOST_PORT=2222

echo "Running Docker container from image: $IMAGE_NAME"
docker run -p $HOST_PORT:22 -d $IMAGE_NAME

echo "Docker container is running, connect via: ssh -p $HOST_PORT root@localhost"
