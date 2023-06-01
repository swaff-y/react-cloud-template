#!/bin/bash

set -e

buildkite-agent artifact download test_results .
./.buildkite/scripts/parse_results.rb test_results