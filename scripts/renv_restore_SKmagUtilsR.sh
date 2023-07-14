#!/bin/bash

THE_USER=${THE_USER:-"r"}
PROJECT_SOURCE=${PROJECT_SOURCE:-"/home/$THE_USER/proj/SKmagUtilsR_tmp/"}
PROJECT_ROOT=${PROJECT_ROOT:-"/home/$THE_USER/proj/SKmagUtilsR"}
RENV_ROOT=${RENV_ROOT:-"/renv_root"}

mkdir -p "$PROJECT_ROOT"
# git config --global http.sslverify false
git clone -b master $PROJECT_SOURCE $PROJECT_ROOT
cd $PROJECT_ROOT
R --vanilla -q -e "Sys.setenv(RENV_PATHS_ROOT = '$RENV_ROOT'); renv::load(); renv::restore(); renv::isolate()"
