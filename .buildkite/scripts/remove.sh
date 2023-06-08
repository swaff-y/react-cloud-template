#!/bin/bash

trap 'kill -- $$' INT TERM QUIT;

buildkite-agent artifact download build.zip .
rm serverless.yml
unzip build.zip -d .
npm install
sls remove > result