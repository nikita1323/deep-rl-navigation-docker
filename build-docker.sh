#!/bin/bash

# Build the Docker image
echo "Building Docker image '$IMAGE_NAME' with:"
echo "  CONTAINER_USERNAME=$CONTAINER_USERNAME"
echo "  CONTAINER_UID=$CONTAINER_UID"
echo "  CONTAINER_GID=$CONTAINER_GID"
echo "  TORCH_VARIANT=$TORCH_VARIANT"

docker build \
    --build-arg USERNAME="$CONTAINER_USERNAME" \
    --build-arg USER_UID="$CONTAINER_UID" \
    --build-arg USER_GID="$CONTAINER_GID" \
    --build-arg TORCH_VARIANT="$TORCH_VARIANT" \
    --build-arg PROJECT_NAME="$PROJECT_NAME" \
    -t "$IMAGE_NAME" \
    .

# Check if the build was successful
if [[ $? -eq 0 ]]; then
    echo "Docker image '$IMAGE_NAME' built successfully!"
    echo "Run it with:"
    if [[ "$TORCH_VARIANT" == "gpu" ]]; then
        echo "  docker run --gpus all -it $IMAGE_NAME"
    else
        echo "  docker run -it $IMAGE_NAME"
    fi
else
    echo "Error: Docker image build failed."
    exit 1
fi