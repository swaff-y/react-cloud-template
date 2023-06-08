#!/bin/bash

buildkite-agent artifact download build.zip .
rm serverless.yml
unzip build.zip -d .
npm install
sls remove > result
exit 0