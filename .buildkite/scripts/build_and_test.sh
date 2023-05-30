#!/bin/bash

set -e

if [ "$BUILDKITE_BRANCH" == "main"  ]
then
  docker build -t react-cloud-template:prod .
  docker run --rm react-cloud-template:prod npm test &> coverage
else
  docker build -t react-cloud-template:dev .
  docker run --rm react-cloud-template:dev npm test &> coverage
fi