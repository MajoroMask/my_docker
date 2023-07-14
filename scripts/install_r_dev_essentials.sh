#!/bin/bash
set -e

URL_RENV=${URL_RENV:-"https://cran.r-project.org/src/contrib/Archive/renv/renv_0.15.4.tar.gz"}
BIOC_REPO=${BIOC_REPO:-"https://mirrors.tuna.tsinghua.edu.cn/CRAN"}

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
    cmake \
    curl \
    pandoc \
    pandoc-citeproc \
    less \
    iputils-ping \
    vim \
    libcurl4-gnutls-dev \
    libgit2-dev \
    zlib1g-dev \
    libudunits2-dev \
    libproj-dev \
    libgdal-dev \
    libbz2-dev \
    liblzma-dev \
    libcairo2-dev \
    libxt6 \
    libxt-dev \
    libmagick++-6.q16-8 \
    libicu-dev \
    libssl-dev \
    libssh2-1-dev \
    libssl1.1 \
    libxml2-dev

R -q -e "install.packages('$URL_RENV', repos = NULL, type = 'source')"
R -q -e "install.packages('BiocManager', repos = '$BIOC_REPO')"

# Clean up
rm -rf /var/lib/apt/lists/*
