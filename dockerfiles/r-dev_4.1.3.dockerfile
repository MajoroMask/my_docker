# from rocker project

# refs:
# https://github.com/rocker-org/rocker-versioned2/blob/master/dockerfiles/r-ver_4.2.3.Dockerfile
# https://github.com/rocker-org/rocker-versioned2/blob/master/dockerfiles/shiny_4.1.3.Dockerfile
# https://github.com/rocker-org/rocker-versioned2/blob/master/dockerfiles/rstudio_4.1.3.Dockerfile

FROM rocker/r-ver:4.1.3

LABEL build.version="0.0.1.9003" \
    build.date="2023-07-14" \
    maintainer="sunamask@gmail.com"

ENV DEFAULT_USER=r
ENV SERVER_SETTINGS="$PWD/server_settings"
ENV UBUNTU_SOURCE="source_list_ubuntu2004_tuna.txt"

# for install_rtudio.sh
ENV S6_VERSION=v2.1.0.2
ENV RSTUDIO_VERSION=2023.03.0+386

# for install_r_dev_essentials.sh
ENV URL_RENV="https://cran.r-project.org/src/contrib/Archive/renv/renv_0.15.4.tar.gz"
ENV BIOC_REPO="https://mirrors.tuna.tsinghua.edu.cn/CRAN"

USER root

# set debian source to aliyun
COPY $SERVER_SETTINGS/$UBUNTU_SOURCE /home/root/debian_sources.list.txt
# scripts for installation from rocker project
COPY scripts /rocker_scripts

RUN mv /etc/apt/sources.list /etc/apt/sources.list.backup \
    && mv /home/root/debian_sources.list.txt /etc/apt/sources.list

RUN bash /rocker_scripts/install_rstudio.sh
RUN bash /rocker_scripts/install_r_dev_essentials.sh

# overwrite rstudio global setting preset
COPY --chown=root $SERVER_SETTINGS/rstudio/XDG_CONFIG_DIRS /etc/rstudio

EXPOSE 8787

CMD ["/init"]
