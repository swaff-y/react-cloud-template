#!/bin/bash

set -e

docker build -t react-cloud-template:dev .

docker run \
  -it \
  --rm \
  -v ${PWD}:/app \
  -v /app/node_modules \
  -p 3001:3000 \
  -e CHOKIDAR_USEPOLLING=true \
  react-cloud-template:dev npm test

# if [ "$BUILDKITE_BRANCH" == "main"  ]
# then

# else

# fi