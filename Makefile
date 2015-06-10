all: run


.PHONY: run
run: chroot build
	docker run -it --rm -v $(PWD)/chroot:/chroot moul/emdebian-builder


chroot:
	mkdir -p chroot


.PHONY: build
build:
	docker build -t moul/emdebian-builder .


release: build
	docker push moul/emdebian-builder


clean:
	rm -rf chroot


re: clean run
