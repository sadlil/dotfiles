FROM --platform=linux/amd64 golang:1.18.4-alpine3.15

LABEL maintainer="Sadlil Rhythom <me@sadlil.com>"

# Update alpine with required dependency
RUN apk update && \
    apk upgrade --update-cache --available

RUN apk add bash git make curl nano \
    libc-dev gcc

# Install golang build and lint tools
RUN go install golang.org/x/tools/cmd/goimports@latest
RUN go install github.com/onsi/ginkgo/ginkgo@latest
RUN wget -O- -nv https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s v1.47.2
RUN go install golang.org/x/tools/cmd/cover@latest
RUN go install github.com/mattn/goveralls@latest
RUN go install honnef.co/go/tools/cmd/staticcheck@latest

RUN rm -rf /go/src/*

RUN rm -rf /var/cache/apk/*

WORKDIR /modules
