#!/bin/bash

set -e

buildkite-agent artifact download build.zip .
ls