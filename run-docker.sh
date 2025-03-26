#!/bin/bash

# Run the Docker container
docker run -it \
    --name $CONTAINER_NAME \
    --net=host \
    -p 0.0.0.0:6006:6006 \
    -p 8888:8888 \
    --gpus all \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v "$PWD/$PROJECT_NAME:/$PROJECT_NAME" \
    -v "$PWD/requirements.txt:/$PROJECT_NAME/requirements.txt" \
    $IMAGE_NAME