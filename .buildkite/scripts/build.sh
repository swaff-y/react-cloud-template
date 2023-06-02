#!/bin/bash

set -e

npm install

if [ "$BUILDKITE_BRANCH" == "main"  ]
then
  npm run build:prod
else
  aws ssm get-parameter --name "react-cloud-temp-dev" | jq .Parameter.Value | jq -r . > dev.env
  npm run build:dev
fi

zip -r build.zip build
