#!/bin/bash

set -e

export CI=true
npm install
npm test -- --coverage &> test_results
pwd