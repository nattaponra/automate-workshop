#!/bin/bash
version=$1
if [ "$version" = "" ]; then
    echo -e "Must specify image version"
    exit 1
fi

if [ ! -d "$version" ]; then
    echo -e "Incorrect version number"
    exit 1
fi

docker build -t <your-docker-repository>/git-client:$version $version
docker push <your-docker-repository>/git-client:$version