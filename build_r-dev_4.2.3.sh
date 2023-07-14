#!/bin/bash

docker build \
  --progress=plain \
  -f ./dockerfiles/r-dev_4.2.3.dockerfile \
  -t r-dev_4.2.3:$1 \
  . 2>&1 | \
tee ./build_logs/r_dev.$1.log
