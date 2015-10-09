#!/bin/sh

set -eou pipefail

docker build -t batmat/process-media process-media
docker build -t batmat/rotate-video  rotate-video
