#!/usr/bin/env bash

rm hello-world
CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o hello-world src/main.go
docker build -t sadlil/hello-world:2.0 .
rm hello-world
docker push sadlil/hello-world:2.0