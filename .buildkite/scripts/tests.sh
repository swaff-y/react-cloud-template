#!/bin/bash

set -e

export CI=true
npm test -- --coverage &> test_results
