
# README

What are you expecting? A fully documented project?

```bash
git clone https://github.com/MajoroMask/my_docker.git
cd my_docker
```

## Step 1: build image

```bash
# build and see
docker pull rocker/r-ver:4.2.3
bash ./build_r-dev_4.2.3.sh 0.0.1.9000
docker images
```

## Alternative step 1: pull from docker hub

```bash
docker pull sunamask/r-dev_4.2.3:0.0.1.9000
```

## Step 2: run container

```bash
mkdir -p ./server_settings/rstudio/local_share
bash ./run_r-dev_4.2.3.sh
```
