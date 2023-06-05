#!/bin/bash

set -e

npm install
$APPLICATION

if [ "$BUILDKITE_BRANCH" == "main"  ]
then
  export STAGE=prod
  export APPLICATION=$(cat prod.env | grep APPLICATION | sed "s/^.*='\(.*\)'$/\1/")
  aws ssm get-parameter --name "react-cloud-temp-prod" | jq .Parameter.Value | jq -r . > prod.env
  npm run build:prod
  ruby .buildkite/scripts/create_stack.rb serverless.yml
else
  export STAGE=dev
  export APPLICATION=$(cat dev.env | grep APPLICATION | sed "s/^.*='\(.*\)'$/\1/")
  aws ssm get-parameter --name "react-cloud-temp-dev" | jq .Parameter.Value | jq -r . > dev.env
  npm run build:dev
  ruby .buildkite/scripts/create_stack.rb serverless.yml
fi

zip -r build.zip build serverless.yml
