#!/bin/bash
PROJECT_DIR=$1
IMAGE_NAME="dylanderechte/42_dev_env:latest"
PORT_DOCKER="0"
PORT_HOST="0"

echo "checking if image exists locally and is up to date"

if docker image inspect $IMAGE_NAME > /dev/null 2>&1; then
    echo "image exists locally"
    echo "Checking if image is up to date"
    docker pull dylanderechte/42_dev_env:latest
else
    echo "pulling image from hub"
    docker pull dylanderechte/42_dev_env:latest
    if docker image inspect $IMAGE_NAME > /dev/null 2>&1; then
        echo "Image now locally available"
    else
    echo "Can't pull image please ensure docker engine is running"
        echo "alternatively pull image manually"
        echo "docker pull dylanderechte/42_dev_env:latest"
        exit
    fi
fi

echo "checking if container already exists or is running"
if [ $( docker ps -a | grep env | wc -l) -gt 0 ]; then
    if [ "$( docker container inspect -f '{{.State.Running}}' env )" = "true" ]; then
        echo "container is already running attaching..."
        docker attach env
    else
        echo "You already have a container which is created and bound to a directory."
        read -p "do you want to reset the container to bind it to a new directory? (y/n)" yn
        case $yn in
            [yY] ) echo "resetting container and starting with new directory"
                docker rm env
                if [ -z "$PROJECT_DIR" ]
                then
                    echo "No project path given starting in current directory"
                    PROJECT_DIR=$PWD
                else
                    PROJECT_DIR=$(cd "$(dirname "$PROJECT_DIR")"; pwd)/$(basename "$PROJECT_DIR")
                fi
                read -p "do you want to forward a port to your container? (y/n)" yn
                case $yn in 
                    [yY] ) read -p "please specify the container port: " PORT_DOCKER
                        read -p "Please specify the Host port: " PORT_HOST
                        docker run -p $PORT_HOST:$PORT_DOCKER -ti --name env -v $PROJECT_DIR:/code -v $HOME/.env/root:/root dylanderechte/42_dev_env bash
					;;
                    [nN] ) echo "starting container without port forwarding"
                        docker run -ti --name env -v $PROJECT_DIR:/code -v $HOME/.env/root:/root dylanderechte/42_dev_env bash
					;;
                esac
			;;
            [nN] ) echo "Starting container without resetting"
                docker start env -ai
            ;;
        esac
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
    read -p "do you want to forward a port to your container? (y/n)" yn
    case $yn in 
        [yY] ) read -p "please specify the container port: " PORT_DOCKER
            read -p "Please specify the Host port: " PORT_HOST
            docker run -p $PORT_HOST:$PORT_DOCKER -ti --name env -v $PROJECT_DIR:/code -v $HOME/.env/root:/root dylanderechte/42_dev_env bash
        ;;
		[nN] ) echo "starting container without port forwarding"
            docker run -ti --name env -v $PROJECT_DIR:/code -v $HOME/.env/root:/root dylanderechte/42_dev_env bash
		;;
	esac
fi