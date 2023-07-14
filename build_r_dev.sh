#!/bin/bash

docker build \
  --progress=plain \
  -f ./dockerfiles/r_dev_$1.dockerfile \
  -t r-dev:$1 \
  . 2>&1 | \
tee ./build_logs/r_dev.$1.log
