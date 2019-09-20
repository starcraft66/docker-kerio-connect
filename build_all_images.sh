#!/bin/bash

for tag in $(git tag); do
    git checkout tags/$tag
    echo "Building tag $tag."
    docker build --tag starcraft66/kerio-connect:$tag --tag docker.pkg.github.com/starcraft66/docker-kerio-connect/kerio-connect:$tag .
    echo "Pushing tag $tag to docker hub."
    docker push starcraft66/kerio-connect:$tag
    echo "Pushing tag $tag to github packages."
    docker push docker.pkg.github.com/starcraft66/docker-kerio-connect/kerio-connect:$tag
done
echo "Done building."
