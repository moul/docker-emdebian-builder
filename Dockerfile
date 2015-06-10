FROM debian:jessie
MAINTAINER Manfred Touron <m@42.am> @moul


# Install basic tools
RUN apt-get update \
 && apt-get install -y \
    bc \
    curl \
    git \
    rsync \
    sudo \
    wget \
 && apt-get clean


# Install multistrap
RUN apt-get -y install \
    multistrap \
    gpgv \
 && apt-get clean


COPY multistrap.conf /
CMD multistrap -f /multistrap.conf
VOLUME /chroot


# Install emdebian repository and keyring
#RUN echo deb http://emdebian.org/tools/debian/ jessie main > /etc/apt/sources.list.d/crosstools.list \
# && curl http://emdebian.org/tools/debian/emdebian-toolchain-archive.key | sudo apt-key add - \
# && apt-get update
# && echo deb http://www.emdebian.org/debian jessie main > /etc/apt/sources.list.d/emdebian.list \


# Install build tools
#RUN apt-get install -y \
#    build-essential \
#    kmod \
#    libproc-processtable-perl \
#    ncurses-dev \
#    u-boot-tools


# Install emdebian toolchain
#RUN apt-get install -y \
#    binutils-arm-linux-gnueabihf \
# && ln -s /usr/bin/arm-linux-gnueabihf-gcc-4.7 /usr/bin/arm-linux-gnueabihf-gcc


# Install debootstrap
#RUN apt-get install -y debootstrap
