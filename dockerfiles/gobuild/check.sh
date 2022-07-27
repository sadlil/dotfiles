#!/usr/bin/env bash
set -e

export RETVAL=0

function go::check_version() {
    version=$(go version)
    echo "Installed $version"
    if [[ $version != 'go version go1.18.4 linux/amd64' ]]; then
        echo "go version didn't match"
        exit 1
    fi
}

function main() {
  go::check_version
}

main
echo 'docker image is okay'
exit ${RETVAL}