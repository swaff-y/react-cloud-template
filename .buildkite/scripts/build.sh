#!/bin/bash

set -e

npm run build
zip -r build.zip build
