#!/bin/bash
PROJECT_DIR=$1
IMAGE_NAME="dylanderechte/42_dev_env:latest"

echo "checking if image exists locally"

if docker image inspect $IMAGE_NAME > /dev/null 2>&1; then
	echo "image exists locally"
else
	echo "pulling image from hub"
	docker pull dylanderechte/42_dev_env:latest
	if docker image inspect $IMAGE_NAME > /dev/null 2>&1; then
		echo "Image nov locally available"
	else
		echo "error please manually pull image"
		echo "docker pull dylanderechte/42_dev_env:latest"
		exit
	fi
fi

echo "checking if container already exists or is runnung"
if [ $( docker ps -a | grep env | wc -l) -gt 0 ]; then
	if [ "$( docker container inspect -f '{{.State.Running}}' env )" = "true" ]; then
		echo "container is already running attaching..."
		docker attach env
	else
		echo "container already exists starting and attaching..."
		docker start env -ai
	fi
else
	echo "starting container"
	if [ -z "$PROJECT_DIR" ]
	then
    	echo "No project directory given starting container to current directory"
		PROJECT_DIR=$PWD
	else
		PROJECT_DIR=$(cd "$(dirname "$PROJECT_DIR")"; pwd)/$(basename "$PROJECT_DIR")
	fi
	docker run -ti --name env -v $PROJECT_DIR:/code -v $HOME/.env:/root dylanderechte/42_dev_env bash
fi
