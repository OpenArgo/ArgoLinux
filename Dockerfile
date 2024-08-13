# Dockerfile for build environment

# Pull base image.
FROM ubuntu:20.04

# Set environment variables.
# prevent tzdata from asking for timezone
ARG DEBIAN_FRONTEND=noninteractive

# Install.
# ncurses 5 is needed for xsct, otherwise it fails with a cryptic error message
RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential && \
  apt-get update &&\
  apt-get install -y curl git htop man vim python-setuptools \
                     python3-setuptools locales diffstat \
                     texinfo libncurses5 pkg-config gawk wget \
		     unzip texinfo gcc build-essential chrpath \
		     socat cpio python3 python3-pip python3-pexpect \
		     xz-utils debianutils iputils-ping python3-git \
		     python3-jinja2 python3-subunit zstd liblz4-tool \
		     file locales libacl1 && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

# Set environment variables.
ENV HOME=/home/build

# Define working directory.
WORKDIR /home/build

# Define default command.
CMD ["bash"]

RUN locale-gen en_US && \
    locale-gen en_US.UTF-8 &&\
    update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8


RUN useradd -m build && adduser build sudo && \
    sed -i 's/%sudo\s*ALL=(ALL:ALL) ALL/%sudo ALL=(ALL) NOPASSWD: ALL/' /etc/sudoers && \
    chown -R build:build /home/build

RUN echo "export LANG=en_US.UTF-8 \
          export LANGUAGE=en_US.UTF-8 \
          export LC_ALL=en_US.UTF-8" >> /home/build/.bashrc

ENV LANG=en_US.UTF-8

# Switch to the non-root user
#USER builder
