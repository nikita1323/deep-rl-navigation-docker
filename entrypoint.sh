#!/bin/bash

set -e

rosdep update
cd /$PROJECT_NAME
echo "$PWD"
rosdep install --from-paths src --ignore-src -y
colcon build
source install/setup.bash

# Execute the command passed to the container (default to bash if none provided)
if [ $# -eq 0 ]; then
    # No arguments: start an interactive shell
    exec /bin/bash
else
    # Arguments provided: execute them
    exec "$@"
fi