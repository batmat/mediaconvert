#!/bin/sh

set -eou pipefail

docker build -f Dockerfile-process -t batmat/process-media .
docker build -f Dockerfile-rotate -t batmat/rotate-video .
