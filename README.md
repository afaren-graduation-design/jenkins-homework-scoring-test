# Docker in Docker Dome

## Goal
This repository is used for researching how to run **Docker in Docker**.
More detailly, I need a Jenkins container running in local to control its **sibling** containers. [Here is a blog about it.][1]















[1]: https://jpetazzo.github.io/2015/09/03/do-not-use-docker-in-docker-for-ci/


#! /usr/bin/env bash


docker build -t did-jenkins .
docker run -d --name did-jenkins -v /var/run/docker.sock:/var/run/docker.sock \
                -v $(which docker):/usr/bin/docker -p 8080:8080 did-jenkins
