#!/bin/bash
set -e

URL_RENV=${URL_RENV:-"https://cran.r-project.org/src/contrib/Archive/renv/renv_0.15.4.tar.gz"}
BIOC_REPO=${BIOC_REPO:-"https://mirrors.tuna.tsinghua.edu.cn/CRAN"}
RLIB_PATH=${RLIB_PATH:-"/usr/local/lib/R/library"}  # only root have write priviledge

# a function to install apt packages only if they are not installed
function apt_install() {
    if ! dpkg -s "$@" >/dev/null 2>&1; then
        if [ "$(find /var/lib/apt/lists/* | wc -l)" = "0" ]; then
            apt-get update
        fi
        apt-get install -y --no-install-recommends "$@"
    fi
}

apt_install \
    git \
    pandoc-citeproc \
    libcurl4-gnutls-dev \
    libcairo2-dev \
    libxt-dev \
    libssl-dev \
    libssh2-1-dev \
    libssl1.1 \
    libxml2-dev \
    curl

R -q -e "install.packages('$URL_RENV', lib = '$RLIB_PATH', repos = NULL, type = 'source')"
R -q -e "install.packages('BiocManager', lib = '$RLIB_PATH', repos = '$BIOC_REPO')"

# Clean up
rm -rf /var/lib/apt/lists/*
