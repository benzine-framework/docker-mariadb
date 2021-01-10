.PHONY: prepare build all

all: build

prepare:
	docker run --rm --privileged docker/binfmt:820fdd95a9972a5308930a2bdfb8573dd4447ad3
	-docker buildx rm benzine-mariadb-builder
	docker buildx create --name benzine-mariadb-builder
	docker buildx use benzine-mariadb-builder
	docker buildx inspect --bootstrap

build: prepare
	docker buildx build \
		--push \
		--platform linux/amd64,linux/arm64 \
		-t benzine/mariadb \
		-t ghcr.io/benzine-framework/docker-mariadb \
		.

