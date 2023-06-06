#!/bin/bash

set -e

export CI=true
npm install
npm test -- --coverage --json | grep '{"' | jq . &> test_results