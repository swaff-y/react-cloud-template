#!/bin/bash

set -e

npm install

if [ "$BUILDKITE_BRANCH" == "main"  ]
then
  npm run build:prod
else
  npm run build:dev
fi

zip -r build.zip build
