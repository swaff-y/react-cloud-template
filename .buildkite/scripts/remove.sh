#!/bin/bash

set -e

buildkite-agent artifact download build.zip .
rm serverless.yml
unzip build.zip -d .
npm install
sls remove