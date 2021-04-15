#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

cd "$DIR/.." || exit

docker build \
    -t demos:1.0 \
    -f docker/Dockerfile \
    .
