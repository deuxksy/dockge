#!/usr/bin/env bash

export DOCKER_DEFAULT_PLATFORM=linux/amd64

# echo "${HARBOR_PWD}" | docker login \
#   --username admin \
#   --password-stdin \
#   regi.knou.ac.kr

docker build \
  -f Dockerfile \
  -t regi.knou.ac.kr/jenkins/ci:latest \
  --push \
  --quiet \
  .
