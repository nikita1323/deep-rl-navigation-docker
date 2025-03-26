#!/bin/bash

# Base Docker run command
DOCKER_CMD="docker run -it \
    --name $CONTAINER_NAME \
    --net=host \
    -p 0.0.0.0:6006:6006 \
    -p 8888:8888 \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v \"$PWD/$PROJECT_NAME:/$PROJECT_NAME\" \
    -v \"$PWD/requirements.txt:/$PROJECT_NAME/requirements.txt\""

# Add GPU flag if USE_GPU is true
if [ "$USE_GPU" = "gpu" ]; then
    DOCKER_CMD="$DOCKER_CMD --gpus all"
fi

# Execute the complete command
DOCKER_CMD="$DOCKER_CMD $IMAGE_NAME"
eval "$DOCKER_CMD"