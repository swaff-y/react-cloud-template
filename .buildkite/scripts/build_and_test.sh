#!/bin/bash

set -e

docker build -t react-cloud-template:dev .

docker run react-cloud-template:dev npm test

# if [ "$BUILDKITE_BRANCH" == "main"  ]
# then

# else

# fi