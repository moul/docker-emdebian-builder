all: multistrap


.PHONY: multistrap docker-image docker-shell build builder-shell release clean re


multistrap: chroot build qemu-arm-static
	docker run -it --privileged --rm -v $(PWD)/chroot:/chroot -v $(PWD)/multistrap.conf:/multistrap.conf moul/emdebian-builder
	mkdir -p chroot/usr/local/bin/
	cp -f qemu-arm-static chroot/usr/local/bin/
	chmod +x chroot/usr/local/bin/qemu-arm-static
	if [ ! -f chroot/bin/sh ]; then ln -s busybox chroot/bin/sh; fi
	du -hs chroot


docker-image: chroot
	echo "FROM scratch" > chroot/Dockerfile
	echo "ADD . /" >> chroot/Dockerfile
	echo "RUN /bin/busybox --install -s" >> chroot/Dockerfile
	echo "CMD /bin/sh" >> chroot/Dockerfile
	docker build -t emdebian chroot


docker-shell: docker-image
	docker run -it --rm emdebian


build:
	docker build -t moul/emdebian-builder .


builder-shell: build
	docker run -it --rm -v $(PWD)/chroot:/chroot -v $(PWD)/multistrap.conf:/multistrap.conf moul/emdebian-builder bash


release: build
	docker push moul/emdebian-builder


clean:
	rm -rf chroot


re: clean multistrap


# file-based
chroot:
	mkdir -p chroot

qemu-arm-static:
	wget --no-check-certificate https://github.com/armbuild/qemu-user-static/raw/master/x86_64/qemu-arm-static -O $@
