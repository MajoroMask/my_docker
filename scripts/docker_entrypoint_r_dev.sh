#!/bin/bash

# arguments from docker run -e
DEFAULT_USER=${DEFAULT_USER:-"r"}
RENV_PATHS_ROOT=${RENV_PATHS_ROOT:-/renv_root}

# Renviron
echo "RENV_PATHS_ROOT=$RENV_PATHS_ROOT" > /home/$DEFAULT_USER/.Renviron

# file onwership

chown -R $DEFAULT_USER:$DEFAULT_USER /home/$DEFAULT_USER/.config
chown -R $DEFAULT_USER:$DEFAULT_USER /home/$DEFAULT_USER/.local
chown -R $DEFAULT_USER:$DEFAULT_USER /home/$DEFAULT_USER/.cache
chown $DEFAULT_USER:$DEFAULT_USER /home/$DEFAULT_USER/.Renviron

# exit to CMD ["/init"]
exec "/init"
