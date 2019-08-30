FROM golang:1.12.9-alpine3.10

LABEL maintainer="Sadlil Rhythom <me@sadlil.com>"

# Update alpine with required dependency
RUN apk update && \
    apk upgrade --update-cache --available

RUN apk add bash git make curl nano \
    libc-dev gcc

# Install golang build and lint tools
RUN go get -mod='' -u golang.org/x/tools/cmd/goimports
RUN go get -mod='' -u github.com/onsi/ginkgo/ginkgo
RUN go get -mod='' -u github.com/vektra/mockery/cmd/mockery
RUN go get -mod='' github.com/golangci/golangci-lint/cmd/golangci-lint
RUN go get -mod='' -u golang.org/x/tools/cmd/cover
RUN go get -mod='' -u github.com/mattn/goveralls
RUN go get -mod='' -u honnef.co/go/tools/cmd/staticcheck

RUN rm -rf /go/src/*

RUN rm -rf /var/cache/apk/*

WORKDIR /modules
