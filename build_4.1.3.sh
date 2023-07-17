#!/bin/bash

docker build \
    --progress=plain \
    -f ./dockerfiles/r-dev_4.1.3.dockerfile \
    -t sunamask/r-dev_4.1.3:$1 \
    . 2>&1 | \
tee ./build_logs/sunamask_r-dev_4.1.3_$1.log
