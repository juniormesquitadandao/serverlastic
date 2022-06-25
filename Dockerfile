ARG ARG_NODE_VERSION
FROM node:${ARG_NODE_VERSION}-buster-slim

SHELL ["/bin/sh", "-c"]

RUN apt update && \
  apt upgrade -y && \
  apt install -y \
    sudo \
    locales-all \
    bash-completion \
    dh-autoreconf \
    cmake \
    git-core \
    curl \
    wget \
    zip \
    vim && \
  update-alternatives --config editor && \
  apt autoremove --purge && \
  apt autoclean

ARG ARG_LINUX_LOCALE
ENV LC_ALL=$ARG_LINUX_LOCALE LANG=$ARG_LINUX_LOCALE LANGUAGE=$ARG_LINUX_LOCALE

RUN getent passwd '1000' | cut -d: -f1 | { read username; [ -z "$username" ] && exit 0 || deluser --remove-home $username; } && \
  addgroup --gid '1000' user && \
  adduser --disabled-password --gecos '' --uid '1000' --gid '1000' user && \
  passwd -d root && \
  echo 'user ALL=(ALL:ALL) NOPASSWD:ALL' >> /etc/sudoers && \
  chown user:user -R /usr/local

USER user
WORKDIR /home/user

RUN wget -nv 'https://github.com/aws/aws-sam-cli/releases/latest/download/aws-sam-cli-linux-x86_64.zip' && \
  unzip 'aws-sam-cli-linux-x86_64.zip' -d 'sam-installation' && \
  sudo ./sam-installation/install && \
  rm -rf 'aws-sam-cli-linux-x86_64.zip'

RUN wget https://github.com/mikefarah/yq/releases/download/v4.25.1/yq_linux_386.tar.gz -O - |\
  tar xz && mv yq_linux_386 /usr/local/bin/yq

RUN sudo apt install siege

RUN locale && \
  echo "node: `node --version`" && \
  sam --version && \
  yq --version && \
  siege --version
