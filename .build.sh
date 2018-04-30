#!/bin/sh

git pull origin master
docker rm -f $(docker ps -aq)
docker rmi -f $(docker images -q)
docker build -t dev-setup .
docker run -ti dev-setup
