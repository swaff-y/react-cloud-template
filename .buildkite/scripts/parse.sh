#!/bin/bash

set -e

buildkite-agent artifact download test_results .
./parse_results.rb test_results