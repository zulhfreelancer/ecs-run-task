#!/bin/bash

mkdir -p dist/linux
mkdir -p dist/darwin

export GIT_TAG=`git describe --tags --candidates=1 --dirty`
GOOS=linux GOARCH=amd64 go build -ldflags "-X main.Version=$GIT_TAG" -o dist/linux/ecs-run-task
GOOS=darwin GOARCH=amd64 go build -ldflags "-X main.Version=$GIT_TAG" -o dist/darwin/ecs-run-task
echo "Done"
