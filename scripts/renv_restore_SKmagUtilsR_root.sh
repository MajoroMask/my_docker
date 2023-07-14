#!/bin/bash

PROJECT_SOURCE=${PROJECT_SOURCE:-"https://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@github.com/MajoroMask/SKmagUtilsR.git"}
PROJECT_ROOT=${PROJECT_ROOT:-"/usr/local/etc/SKmagUtilsR"}
RENV_ROOT=${RENV_ROOT:-"/renv_root"}
RLIB_PATH=${RLIB_PATH:-"/usr/local/lib/R/library"}  # only root have write priviledge

mkdir -p "$PROJECT_ROOT"
# git config --global http.sslverify false
git clone -b main $PROJECT_SOURCE $PROJECT_ROOT
cd $PROJECT_ROOT
R --vanilla -q -e "Sys.setenv(RENV_PATHS_ROOT = '$RENV_ROOT'); options(renv.config.cache.symlinks = FALSE); renv::load(); renv::restore(library = '$RLIB_PATH')"
