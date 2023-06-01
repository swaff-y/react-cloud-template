#!/bin/bash

set -e

buildkite-agent artifact download test_results .
ruby .buildkite/scripts/parse_results.rb test_results