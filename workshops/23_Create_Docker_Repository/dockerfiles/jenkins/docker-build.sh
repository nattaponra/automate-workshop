#!/bin/bash
version=$1

echo -e "Build and tag jenkins $version."

if [ "$version" = "" ]; then
    echo -e "Must specify image version"
    exit 1
fi

if [ ! -d "$version" ]; then
    echo -e "Incorrect version number"
    exit 1
fi

docker build -t <your-docker-repository>/jenkins:$version $version
docker push <your-docker-repository>/jenkins:$version
