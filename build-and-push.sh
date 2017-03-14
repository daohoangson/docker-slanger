#!/bin/sh

LATEST_VERSION="0.6.0"
IMAGE_NAME="xfrocks/slanger"

docker build --build-arg SLANGER_VERSION="$LATEST_VERSION" \
	-t "$IMAGE_NAME" \
	-t "$IMAGE_NAME:$LATEST_VERSION" \
	.

docker push "$IMAGE_NAME"
docker push "$IMAGE_NAME:$LATEST_VERSION"