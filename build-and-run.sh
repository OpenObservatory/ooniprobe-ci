#!/bin/sh
set -x
TARGET=$1
DOCKERFILE=Dockerfile.$TARGET

if [ -z $TARGET ];then
    echo "ERR: you must specify the target"
    exit 1
fi

if [ ! -f $DOCKERFILE ];then
    echo "ERR: $DOCKERFILE does not exist"
    exit 2 
fi

echo "Building $TARGET ($DOCKERFILE)"

docker build -t ooniprobe/$TARGET -f $DOCKERFILE .
docker run ooniprobe/$TARGET /ooniprobe/run.sh
