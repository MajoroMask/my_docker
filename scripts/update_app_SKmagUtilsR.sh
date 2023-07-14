#!/bin/bash

PROJECT_SOURCE=${PROJECT_SOURCE:-"https://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@github.com/MajoroMask/SKmagUtilsR.git"}
PROJECT_ROOT_CONTAINER=${PROJECT_ROOT_CONTAINER:-"/usr/local/etc/SKmagUtilsR"}
RLIB_PATH=${RLIB_PATH:-"/usr/local/lib/R/library"}

# update app code
cd $PROJECT_ROOT_CONTAINER
# git config --global http.sslverify false
git pull origin main
# git checkout master
# git fetch tmp master
# git reset --hard tmp/master
cd ../

# update installed binary
R --vanilla -q -e "withr::with_libpaths('$RLIB_PATH', devtools::install(pkg = './SKmagUtilsR', reload = FALSE, quick = TRUE, upgrade = 'never'))"
