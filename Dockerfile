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


# Install multistrap and dependencies
RUN apt-get -y install \
    gpgv \
    multistrap \
    perl-base \
 && apt-get clean


COPY multistrap.conf /
COPY build.sh /
CMD /build.sh
VOLUME /chroot
