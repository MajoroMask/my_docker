#!/bin/bash

IMAGE_VERSION=${1:-0.0.1.9000}
PORT_RSTUDIO=8788
DEFAULT_USER="r"
CONTAINER_NAME="r-dev_4.2.3"

docker run \
  --name $CONTAINER_NAME \
  --rm -detach \
  -p $PORT_RSTUDIO:8787 \
  --mount type=bind,source=$HOME/renv_root,target=/renv_root \
  --mount type=bind,source="$(pwd)"/server_settings/rstudio/XDG_CONFIG_HOME/,target=/home/$DEFAULT_USER/.config/rstudio \
  --mount type=bind,source="$(pwd)"/server_settings/rstudio/local_share/,target=/home/$DEFAULT_USER/.local/share/rstudio \
  --mount type=bind,source="$(pwd)"/scripts/docker_entrypoint_r_dev.sh,target=/home/$DEFAULT_USER/.config/docker_entrypoint.sh \
  -e ROOT=true \
  -e DISABLE_AUTH=true \
  -e PASSWORD=1234 \
  -e USERID=`id -u $USER` \
  -e GROUPID=`id -g $USER` \
  -e RENV_PATHS_ROOT=/renv_root \
  --entrypoint /home/$DEFAULT_USER/.config/docker_entrypoint.sh \
  r-dev_4.2.3:$IMAGE_VERSION
