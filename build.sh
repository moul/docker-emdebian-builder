#!/bin/sh

set -xe

mkdir -p /chroot
mount -t tmpfs tmpfs /chroot
multistrap -f /multistrap.conf
rsync -a /chroot/ /rootfs
umount /chroot
rsync -a /rootfs/ /chroot/
