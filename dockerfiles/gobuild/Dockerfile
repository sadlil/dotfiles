FROM golang:1.15.2-alpine3.12

LABEL maintainer="Sadlil Rhythom <me@sadlil.com>"

# Update alpine with required dependency
RUN apk update && \
    apk upgrade --update-cache --available

RUN apk add bash git make curl nano \
    libc-dev gcc

# Install golang build and lint tools
RUN go get -u golang.org/x/tools/cmd/goimports
RUN go get -u github.com/onsi/ginkgo/ginkgo
RUN wget -O- -nv https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s v1.31.0
RUN go get -u golang.org/x/tools/cmd/cover
RUN go get -u github.com/mattn/goveralls
RUN go get -u honnef.co/go/tools/cmd/staticcheck

RUN rm -rf /go/src/*

RUN rm -rf /var/cache/apk/*

WORKDIR /modules
