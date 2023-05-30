#!/bin/bash

set -e

docker build -t react-cloud-template:dev .

docker run --rm react-cloud-template:dev npm test &> coverage

# if [ "$BUILDKITE_BRANCH" == "main"  ]
# then

# else

# fi