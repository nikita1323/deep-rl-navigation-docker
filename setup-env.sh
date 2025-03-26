#!/bin/bash

##########################################
#  Default environment variables

# Better not change
CONTAINER_USERNAME=$(whoami)
CONTAINER_UID=$UID
CONTAINER_GID=$(id -g)
PROJECT_NAME="DRL_robot_navigation_ros2"

# Do whatever you like
TORCH_VARIANT="cpu" # or "gpu"
IMAGE_NAME="drl-robot-navigation-ros2-docker-image"
CONTAINER_NAME="drl-robot-navigation-ros2-docker-container"

##########################################

# Usage function to display help
usage() {
    echo "Usage: $0 [OPTIONS]"
    echo "Set up environment for building '${PROJECT_NAME}' project."
    echo ""
    echo "Options:"
    echo "  -u, --CONTAINER_USERNAME NAME           Specify the username for docker container (default: $CONTAINER_USERNAME)"
    echo "  --uid UID                               Specify the user ID (default: $CONTAINER_UID)"
    echo "  --gid GID                               Specify the group ID (default: $CONTAINER_GID)"
    echo "  -t, --torch-variant VARIANT             Specify PyTorch variant: 'cpu' or 'gpu' (default: $TORCH_VARIANT)"
    echo "  -h, --help                              Display this help message"
    echo ""
    echo "Example:"
    echo "  $0 --torch-variant gpu --CONTAINER_USERNAME myuser --uid 1001 --gid 1001"
    echo "  $0 -t cpu -u $CONTAINER_USERNAME"
}

# Parse command-line arguments
while [[ "$#" -gt 0 ]]; do
    case $1 in
        -u|--CONTAINER_USERNAME)
            CONTAINER_USERNAME="$2"
            shift 2
            ;;
        --uid)
            CONTAINER_UID="$2"
            shift 2
            ;;
        --gid)
            CONTAINER_GID="$2"
            shift 2
            ;;
        -t|--torch-variant)
            TORCH_VARIANT="$2"
            shift 2
            ;;
        -h|--help)
            usage
            exit 0
            ;;
        *)
            echo "Unknown option: $1"
            usage
            exit 1
            ;;
    esac
done

# Validate TORCH_VARIANT
if [[ "$TORCH_VARIANT" != "cpu" && "$TORCH_VARIANT" != "gpu" ]]; then
    echo "Error: --torch-variant must be 'cpu' or 'gpu', got '$TORCH_VARIANT'"
    exit 1
fi

# Inform user about GPU requirements
if [[ "$TORCH_VARIANT" == "gpu" ]]; then
    echo "Building with GPU support. Ensure NVIDIA drivers and NVIDIA Container Toolkit are installed."
    echo "See: https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html"
fi

export CONTAINER_USERNAME=$CONTAINER_USERNAME
export CONTAINER_UID=$CONTAINER_UID
export CONTAINER_GID=$CONTAINER_GID

export TORCH_VARIANT=$TORCH_VARIANT
export PROJECT_NAME=$PROJECT_NAME
export IMAGE_NAME=$IMAGE_NAME
export CONTAINER_NAME=$CONTAINER_NAME