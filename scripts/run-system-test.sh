#!/usr/bin/env bash

set -e

imagename=${IMAGENAME:-todo}
version=${GO_PIPELINE_LABEL:-dev}

repository_prefix=${REPOSITORY_PREFIX}

mode="--fast"
if [ $# -eq 1 ]; then
    mode=$1
fi

# Instant
if [ "${mode}" = "--fast" ]; then
#    docker run --rm --mount type=bind,src=${GOOGLE_APPLICATION_CREDENTIALS},dst=${GOOGLE_APPLICATION_CREDENTIALS} -e GOOGLE_APPLICATION_CREDENTIALS=${GOOGLE_APPLICATION_CREDENTIALS} ${imagename}:${version} ./runtest --fast
    docker run --rm -v ${GOOGLE_APPLICATION_CREDENTIALS}:${GOOGLE_APPLICATION_CREDENTIALS} -e GOOGLE_APPLICATION_CREDENTIALS=${GOOGLE_APPLICATION_CREDENTIALS} ${repository_prefix}/${imagename}:${version} ./runtest --fast
fi