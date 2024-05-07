#!/bin/bash

docker build \
    --progress=plain \
    -f ./dockerfiles/r-dev_4.3.3.dockerfile \
    -t quay.io/giganticdiaper/r-dev_4.3.3:$1 \
    . 2>&1 | \
tee ./build_logs/sunamask_r-dev_4.3.3_$1.log
