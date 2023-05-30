#!/bin/bash

set -e

docker run \
    -it \
    --rm \
    -v ${PWD}:/app \
    -v /app/node_modules \
    -p 3001:3000 \
    -e CHOKIDAR_USEPOLLING=true \
    sample:dev

# if [ "$BUILDKITE_BRANCH" == "main"  ]
# then

# else

# fi