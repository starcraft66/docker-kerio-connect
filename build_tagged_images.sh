#!/bin/bash

echo "Logging into Docker Hub"
docker login --username $DOCKER_HUB_USERNAME --password $DOCKER_HUB_PASSWORD
echo "Logging into GitHub Package Registry"
docker login docker.pkg.github.com --username $GITHUB_PKG_USERNAME --password $GITHUB_PKG_PASSWORD

IS_LATEST=0
for tag in $(git tag --sort=-v:taggerdate); do
    git checkout tags/$tag
    echo "Building tag $tag."
    docker build --tag starcraft66/kerio-connect:$tag --tag docker.pkg.github.com/starcraft66/docker-kerio-connect/kerio-connect:$tag .
    echo "Pushing tag $tag to docker hub."
    docker push starcraft66/kerio-connect:$tag
    echo "Pushing tag $tag to github packages."
    docker push docker.pkg.github.com/starcraft66/docker-kerio-connect/kerio-connect:$tag
    if [ x$IS_LATEST == x"0" ]; then
        # The most recent git tag should be the "latest" docker tag
        docker image tag starcraft66/kerio-connect:$tag starcraft66/kerio-connect:latest
        docker push starcraft66/kerio-connect:latest
        docker image tag docker.pkg.github.com/starcraft66/docker-kerio-connect/kerio-connect:latest:$tag docker.pkg.github.com/starcraft66/docker-kerio-connect/kerio-connect:latest
        docker push docker.pkg.github.com/starcraft66/docker-kerio-connect/kerio-connect:latest
    fi
    IS_LATEST=1
done
echo "Done building."
