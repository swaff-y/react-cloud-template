#!/bin/bash

set -e

buildkite-agent artifact download build.zip .
unzip build.zip -d .
ls