CMD_BUILD=docker buildx build --push --platform linux/amd64,linux/arm64

.PHONY: prepare cli nginx all

all: cli prepare cli nginx

prepare:
	docker run --rm --privileged docker/binfmt:820fdd95a9972a5308930a2bdfb8573dd4447ad3
	-docker buildx rm gone-builder
	docker buildx create --name gone-builder
	docker buildx use gone-builder
	docker buildx inspect --bootstrap

build: prepare
	$(CMD_BUILD) -t benzine/mariadb -t ghcr.io/benzine-framework/docker-mariadb .

