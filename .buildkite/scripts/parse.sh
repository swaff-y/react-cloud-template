#!/bin/bash

set -e

buildkite-agent artifact download "${pwd}/test_results"
cat test_results | grep All files