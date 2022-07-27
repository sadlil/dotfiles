USER = sadlil
PROJECT = gobuild
VERSION = 1.18.4

ROOT_DIR:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

build:
	docker build -t ${USER}/${PROJECT}:${VERSION} .

push:
	docker push ${USER}/${PROJECT}:${VERSION}

check: build
	@-docker -l fatal rm -f gobuild
	docker run --name gobuild -v ${ROOT_DIR}:/tests -it ${USER}/${PROJECT}:${VERSION} /tests/check.sh
	@-docker -l fatal rm -f gobuild
