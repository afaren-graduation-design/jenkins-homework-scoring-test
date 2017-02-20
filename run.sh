#! /usr/bin/env bash


docker build -t did-jenkins .
docker run -d --name did-jenkins -v /var/run/docker.sock:/var/run/docker.sock \
                -v $(which docker):/usr/bin/docker -p 8080:8080 did-jenkins
