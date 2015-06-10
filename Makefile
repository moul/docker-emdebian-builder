all: run


.PHONY: run
run: chroot build
	docker run -it --rm -v $(PWD)/chroot:/chroot moul/emdebian


chroot:
	mkdir -p chroot


.PHONY: build
build:
	docker build -t moul/emdebian .
