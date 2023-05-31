#!/bin/bash

set -e

npm install
npm run build
zip -r build.zip build
