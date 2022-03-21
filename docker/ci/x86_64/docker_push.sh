#!/bin/bash

DOCKER_TAGS=""

for TAG in "$@"
do
	DOCKER_TAGS="$DOCKER_TAGS -t avx1024/stash:$TAG"
done

echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

# must build the image from dist directory
docker buildx build --platform linux/amd64,linux/arm64 --push $DOCKER_TAGS -f docker/ci/x86_64/Dockerfile dist/

