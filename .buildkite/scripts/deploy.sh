#!/bin/bash

set -e

buildkite-agent artifact download "${pwd}/build.zip"
ls