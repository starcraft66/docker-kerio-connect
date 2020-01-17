#!/bin/bash

echo "Logging into Docker Hub"
docker login --username $DOCKER_HUB_USERNAME --password $DOCKER_HUB_PASSWORD
echo "Logging into GitHub Package Registry"
docker login docker.pkg.github.com --username $GITHUB_PKG_USERNAME --password $GITHUB_PKG_PASSWORD

echo "Building master."
docker build --tag starcraft66/kerio-connect:master --tag docker.pkg.github.com/starcraft66/docker-kerio-connect/kerio-connect:master .
echo "Pushing tag master to docker hub."
docker push starcraft66/kerio-connect:master
echo "Pushing tag master to github packages."
docker push docker.pkg.github.com/starcraft66/docker-kerio-connect/kerio-connect:master
echo "Done building."
