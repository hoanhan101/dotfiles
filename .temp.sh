#!/bin/sh

git pull origin master
docker rm $(docker ps -aq)
docker rmi -f $(docker images -q)
docker build -t dev .
docker run -ti dev
