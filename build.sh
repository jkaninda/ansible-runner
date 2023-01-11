#!/bin/bash
if [ $# -eq 0 ]
  then
    tag='latest'
  else
    tag=$1
fi
 docker build -f ./src/docker/Dockerfile  -t jkaninda/ansible-runner:$tag .
 