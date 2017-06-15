FROM ubuntu:16.04
MAINTAINER R.Doumenc "remi.doumenc@gmail.com"

RUN apt-get update && apt-get -y upgrade

# Install utilities
RUN apt-get install -y \
    gosu

# Install utilities required by Yocto
RUN apt-get install -y \
    build-essential \
    chrpath \
    cpio \
    debianutils \
    diffstat \
    gawk \
    gcc-multilib \
    git-core \
    iputils-ping \
    python \
    python3 \
    python3-pexpect \
    python3-pip \
    socat \
    texinfo \
    unzip \
    wget \
    xz-utils

# Fix error "Please use a locale setting which supports utf-8."
# See https://wiki.yoctoproject.org/wiki/TipsAndTricks/ResolvingLocaleIssues
RUN apt-get install -y locales && \
  dpkg-reconfigure locales && \
  locale-gen en_US.UTF-8 && \
  update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8

ADD scripts/entrypoint.sh /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

# EOF
