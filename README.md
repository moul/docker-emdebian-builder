# docker-emdebian-builder

[![GuardRails badge](https://badges.production.guardrails.io/moul/docker-emdebian-builder.svg)](https://www.guardrails.io)

:whale: build emdebian images in Docker

```console
$ make
mkdir -p chroot
docker build -t moul/emdebian-builder .
Sending build context to Docker daemon 80.38 kB
Sending build context to Docker daemon
Step 0 : FROM debian:jessie
 ---> f5224fc54ad2
Step 1 : MAINTAINER Manfred Touron <m@42.am> @moul
 ---> Using cache
 ---> 612143cfe706
Step 2 : RUN apt-get update  && apt-get install -y     bc     curl     git     rsync     sudo     wget  && apt-get clean
 ---> Using cache
 ---> fc522eb4199c
Step 3 : RUN apt-get -y install     gpgv     multistrap     perl-base  && apt-get clean
 ---> Using cache
 ---> b07c5ba4c813
Step 4 : COPY multistrap.conf /
 ---> 05c04136e187
Removing intermediate container 10e2b6b8027a
Step 5 : CMD multistrap -f /multistrap.conf
 ---> Running in 64b5c6354c82
 ---> d68e4ca18e3e
Removing intermediate container 64b5c6354c82
Step 6 : VOLUME /chroot
 ---> Running in 634f058cc340
 ---> 01b72df679b9
Removing intermediate container 634f058cc340
Successfully built 01b72df679b9
docker run -it --rm -v /Users/moul/Git/moul/docker-emdebian/chroot:/chroot moul/emdebian-builder
Use of uninitialized value $sources{"utils"} in pattern match (m//) at /usr/sbin/multistrap line 1251.
multistrap 2.2.0 using /multistrap.conf
multistrap 2.2.0 using /multistrap.conf
Using foreign architecture: armhf
multistrap building armhf multistrap on 'amd64'
I: Setting /chroot/lib64 -> /chroot/lib symbolic link.
Getting package lists: apt-get  -o Apt::Architecture=armhf -o Dir::Etc::TrustedParts=/chroot/etc/apt/trusted.gpg.d -o Dir::Etc::Trusted=/chroot/etc/apt/trusted.gpg.d/trusted.gpg -o Apt::Get::AllowUnauthenticated=true -o Apt::Get::Download-Only=true -o Apt::Install-Recommends=false -o Dir=/chroot/ -o Dir::Etc=/chroot/etc/apt/ -o Dir::Etc::Parts=/chroot/etc/apt/apt.conf.d/ -o Dir::Etc::PreferencesParts=/chroot/etc/apt/preferences.d/ -o APT::Default-Release=* -o Dir::State=/chroot/var/lib/apt/ -o Dir::State::Status=/chroot/var/lib/dpkg/status -o Dir::Cache=/chroot/var/cache/apt/ update
Get:1 http://ftp.uk.debian.org wheezy-grip InRelease [10.5 kB]
Ign http://ftp.uk.debian.org wheezy-grip InReleased in /chroot/etc/apt/trusted.gpg.d/.
Get:2 http://ftp.uk.debian.org wheezy-grip/main Sources [817 kB]
Get:3 http://ftp.uk.debian.org wheezy-grip/main armhf Packages [764 kB]
Fetched 1592 kB in 1s (1120 kB/s)
Reading package lists... Done
W: GPG error: http://ftp.uk.debian.org wheezy-grip InRelease: Could not execute 'gpgv' to verify signature (is gpgv installed?)
I: Calculating required packages.
apt-get -y  -o Apt::Architecture=armhf -o Dir::Etc::TrustedParts=/chroot/etc/apt/trusted.gpg.d -o Dir::Etc::Trusted=/chroot/etc/apt/trusted.gpg.d/trusted.gpg -o Apt::Get::AllowUnauthenticated=true -o Apt::Get::Download-Only=true -o Apt::Install-Recommends=false -o Dir=/chroot/ -o Dir::Etc=/chroot/etc/apt/ -o Dir::Etc::Parts=/chroot/etc/apt/apt.conf.d/ -o Dir::Etc::PreferencesParts=/chroot/etc/apt/preferences.d/ -o APT::Default-Release=* -o Dir::State=/chroot/var/lib/apt/ -o Dir::State::Status=/chroot/var/lib/dpkg/status -o Dir::Cache=/chroot/var/cache/apt/ install  apt emdebian-archive-keyring
Reading package lists... Done
Building dependency tree... Done
The following extra packages will be installed:
  debian-archive-keyring dpkg gcc-4.7-base gnupg gpgv libapt-pkg4.12 libbz2-1.0 libc-bin libc6 libgcc1 liblzma5
  libreadline6 libselinux1 libstdc++6 libtinfo5 libusb-0.1-4 multiarch-support readline-common tar zlib1g
The following NEW packages will be installed:
  apt debian-archive-keyring dpkg emdebian-archive-keyring gcc-4.7-base gnupg gpgv libapt-pkg4.12 libbz2-1.0 libc-bin
  libc6 libgcc1 liblzma5 libreadline6 libselinux1 libstdc++6 libtinfo5 libusb-0.1-4 multiarch-support readline-common
  tar zlib1g
0 upgraded, 22 newly installed, 0 to remove and 0 not upgraded.
Need to get 7552 kB of archives.
After this operation, 18.9 MB of additional disk space will be used.
WARNING: The following packages cannot be authenticated!
  libc-bin gcc-4.7-base multiarch-support libgcc1 libc6 libbz2-1.0 libstdc++6 zlib1g libapt-pkg4.12 gpgv
  debian-archive-keyring liblzma5 libselinux1 tar dpkg readline-common libtinfo5 libreadline6 libusb-0.1-4 gnupg apt
  emdebian-archive-keyring
Authentication warning overridden.
Get:1 http://ftp.uk.debian.org/emdebian/grip/ wheezy-grip/main libc-bin armhf 2.13-38em1 [987 kB]
Get:2 http://ftp.uk.debian.org/emdebian/grip/ wheezy-grip/main gcc-4.7-base armhf 4.7.2-5em1 [9048 B]
Get:3 http://ftp.uk.debian.org/emdebian/grip/ wheezy-grip/main multiarch-support armhf 2.13-38em1 [4490 B]
Get:4 http://ftp.uk.debian.org/emdebian/grip/ wheezy-grip/main libgcc1 armhf 1:4.7.2-5em1 [52.3 kB]
Get:5 http://ftp.uk.debian.org/emdebian/grip/ wheezy-grip/main libc6 armhf 2.13-38em1 [3802 kB]
Get:6 http://ftp.uk.debian.org/emdebian/grip/ wheezy-grip/main libbz2-1.0 armhf 1.0.6-4em1 [32.4 kB]
Get:7 http://ftp.uk.debian.org/emdebian/grip/ wheezy-grip/main libstdc++6 armhf 4.7.2-5em1 [279 kB]
Get:8 http://ftp.uk.debian.org/emdebian/grip/ wheezy-grip/main zlib1g armhf 1:1.2.7.dfsg-13em1 [48.4 kB]
Get:9 http://ftp.uk.debian.org/emdebian/grip/ wheezy-grip/main libapt-pkg4.12 armhf 0.9.7.9em1 [490 kB]
Get:10 http://ftp.uk.debian.org/emdebian/grip/ wheezy-grip/main gpgv armhf 1.4.12-7em1 [149 kB]
Get:11 http://ftp.uk.debian.org/emdebian/grip/ wheezy-grip/main debian-archive-keyring all 2012.4em1 [25.0 kB]
Get:12 http://ftp.uk.debian.org/emdebian/grip/ wheezy-grip/main liblzma5 armhf 5.1.1alpha+20120614-2em1 [72.6 kB]
Get:13 http://ftp.uk.debian.org/emdebian/grip/ wheezy-grip/main libselinux1 armhf 2.1.9-5em1 [50.7 kB]
Get:14 http://ftp.uk.debian.org/emdebian/grip/ wheezy-grip/main tar armhf 1.26+dfsg-0.1em1 [150 kB]
Get:15 http://ftp.uk.debian.org/emdebian/grip/ wheezy-grip/main dpkg armhf 1.16.10em1 [332 kB]
Get:16 http://ftp.uk.debian.org/emdebian/grip/ wheezy-grip/main readline-common all 6.2+dfsg-0.1em1 [3148 B]
Get:17 http://ftp.uk.debian.org/emdebian/grip/ wheezy-grip/main libtinfo5 armhf 5.9-10em1 [78.1 kB]
Get:18 http://ftp.uk.debian.org/emdebian/grip/ wheezy-grip/main libreadline6 armhf 6.2+dfsg-0.1em1 [112 kB]
Get:19 http://ftp.uk.debian.org/emdebian/grip/ wheezy-grip/main libusb-0.1-4 armhf 2:0.1.12-20+nmu1em1 [13.7 kB]
Get:20 http://ftp.uk.debian.org/emdebian/grip/ wheezy-grip/main gnupg armhf 1.4.12-7em1 [558 kB]
Get:21 http://ftp.uk.debian.org/emdebian/grip/ wheezy-grip/main apt armhf 0.9.7.9em1 [297 kB]
Get:22 http://ftp.uk.debian.org/emdebian/grip/ wheezy-grip/main emdebian-archive-keyring all 2.0.3em1 [5420 B]
Fetched 7552 kB in 3s (1987 kB/s)
Download complete and in download only mode
I: Calculating obsolete packages
Using directory /chroot/ for unpacking operations
I: Extracting apt_0.9.7.9em1_armhf.deb...
Warning: unrecognised value 'no' for Multi-Arch field in apt_0.9.7.9em1_armhf.deb. (Expecting 'same', 'foreign' or 'allowed'.)
 -> Processing conffiles for apt
I: Extracting debian-archive-keyring_2012.4em1_all.deb...
Warning: unrecognised value 'no' for Multi-Arch field in debian-archive-keyring_2012.4em1_all.deb. (Expecting 'same', 'foreign' or 'allowed'.)
 -> Processing conffiles for debian-archive-keyring
I: Extracting dpkg_1.16.10em1_armhf.deb...
Warning: unrecognised value 'no' for Multi-Arch field in dpkg_1.16.10em1_armhf.deb. (Expecting 'same', 'foreign' or 'allowed'.)
 -> Processing conffiles for dpkg
I: Extracting emdebian-archive-keyring_2.0.3em1_all.deb...
Warning: unrecognised value 'no' for Multi-Arch field in emdebian-archive-keyring_2.0.3em1_all.deb. (Expecting 'same', 'foreign' or 'allowed'.)
I: Extracting gcc-4.7-base_4.7.2-5em1_armhf.deb...
Warning: unrecognised value 'no' for Multi-Arch field in gcc-4.7-base_4.7.2-5em1_armhf.deb. (Expecting 'same', 'foreign' or 'allowed'.)
I: Extracting gnupg_1.4.12-7em1_armhf.deb...
Warning: unrecognised value 'no' for Multi-Arch field in gnupg_1.4.12-7em1_armhf.deb. (Expecting 'same', 'foreign' or 'allowed'.)
I: Extracting gpgv_1.4.12-7em1_armhf.deb...
Warning: unrecognised value 'no' for Multi-Arch field in gpgv_1.4.12-7em1_armhf.deb. (Expecting 'same', 'foreign' or 'allowed'.)
I: Extracting libapt-pkg4.12_0.9.7.9em1_armhf.deb...
I: Extracting libbz2-1.0_1.0.6-4em1_armhf.deb...
Warning: unrecognised value 'no' for Multi-Arch field in libbz2-1.0_1.0.6-4em1_armhf.deb. (Expecting 'same', 'foreign' or 'allowed'.)
I: Extracting libc-bin_2.13-38em1_armhf.deb...
Warning: unrecognised value 'no' for Multi-Arch field in libc-bin_2.13-38em1_armhf.deb. (Expecting 'same', 'foreign' or 'allowed'.)
 -> Processing conffiles for libc-bin
I: Extracting libc6_2.13-38em1_armhf.deb...
Warning: unrecognised value 'no' for Multi-Arch field in libc6_2.13-38em1_armhf.deb. (Expecting 'same', 'foreign' or 'allowed'.)
 -> Processing conffiles for libc6
I: Extracting libgcc1_1%3a4.7.2-5em1_armhf.deb...
Warning: unrecognised value 'no' for Multi-Arch field in libgcc1_1%3a4.7.2-5em1_armhf.deb. (Expecting 'same', 'foreign' or 'allowed'.)
I: Extracting liblzma5_5.1.1alpha+20120614-2em1_armhf.deb...
Warning: unrecognised value 'no' for Multi-Arch field in liblzma5_5.1.1alpha+20120614-2em1_armhf.deb. (Expecting 'same', 'foreign' or 'allowed'.)
I: Extracting libreadline6_6.2+dfsg-0.1em1_armhf.deb...
Warning: unrecognised value 'no' for Multi-Arch field in libreadline6_6.2+dfsg-0.1em1_armhf.deb. (Expecting 'same', 'foreign' or 'allowed'.)
I: Extracting libselinux1_2.1.9-5em1_armhf.deb...
Warning: unrecognised value 'no' for Multi-Arch field in libselinux1_2.1.9-5em1_armhf.deb. (Expecting 'same', 'foreign' or 'allowed'.)
I: Extracting libstdc++6_4.7.2-5em1_armhf.deb...
Warning: unrecognised value 'no' for Multi-Arch field in libstdc++6_4.7.2-5em1_armhf.deb. (Expecting 'same', 'foreign' or 'allowed'.)
I: Extracting libtinfo5_5.9-10em1_armhf.deb...
Warning: unrecognised value 'no' for Multi-Arch field in libtinfo5_5.9-10em1_armhf.deb. (Expecting 'same', 'foreign' or 'allowed'.)
I: Extracting libusb-0.1-4_2%3a0.1.12-20+nmu1em1_armhf.deb...
Warning: unrecognised value 'no' for Multi-Arch field in libusb-0.1-4_2%3a0.1.12-20+nmu1em1_armhf.deb. (Expecting 'same', 'foreign' or 'allowed'.)
I: Extracting multiarch-support_2.13-38em1_armhf.deb...
Warning: unrecognised value 'no' for Multi-Arch field in multiarch-support_2.13-38em1_armhf.deb. (Expecting 'same', 'foreign' or 'allowed'.)
I: Extracting readline-common_6.2+dfsg-0.1em1_all.deb...
Warning: unrecognised value 'no' for Multi-Arch field in readline-common_6.2+dfsg-0.1em1_all.deb. (Expecting 'same', 'foreign' or 'allowed'.)
I: Extracting tar_1.26+dfsg-0.1em1_armhf.deb...
Warning: unrecognised value 'no' for Multi-Arch field in tar_1.26+dfsg-0.1em1_armhf.deb. (Expecting 'same', 'foreign' or 'allowed'.)
 -> Processing conffiles for tar
I: Extracting zlib1g_1%3a1.2.7.dfsg-13em1_armhf.deb...
Warning: unrecognised value 'no' for Multi-Arch field in zlib1g_1%3a1.2.7.dfsg-13em1_armhf.deb. (Expecting 'same', 'foreign' or 'allowed'.)
I: Unpacking complete.
I: Tidying up apt cache and list data.
I: Tidying up apt cache and list data.

Multistrap system installed successfully in /chroot/.
```

```console
$ ls -la chroot
total 8
drwxr-xr-x  12 moul  staff  408 Jun 22  2012 .
drwxr-xr-x  10 moul  staff  340 Jun 10 17:52 ..
drwxr-xr-x   3 moul  staff  102 Jan  2  2013 bin
drwxr-xr-x   2 moul  staff   68 Jun 10 17:48 dev
drwxr-xr-x  14 moul  staff  476 Jan  2  2013 etc
drwxr-xr-x   5 moul  staff  170 Jun 22  2012 lib
lrwxr-xr-x   1 moul  staff    5 Jun 10 17:48 lib64 -> ./lib
drwxr-xr-x   4 moul  staff  136 Dec 30  2012 sbin
drwxr-xr-x   2 moul  staff   68 Jun 10  2012 selinux
drwxr-xr-x   2 moul  staff   68 Jun 10 17:49 tmp
drwxr-xr-x   6 moul  staff  204 Jun 22  2012 usr
drwxr-xr-x   5 moul  staff  170 Mar 18  2013 var
$ du -hs chroot
 17M	chroot
```
