#!/bin/bash
#
# Run JMeter Docker image with options

NAME="jmeter"
IMAGE="justb4/jmeter:5.1.1"


# Finally run
 docker stop ${NAME} > /dev/null 2>&1
 docker rm ${NAME} > /dev/null 2>&1
#sudo docker run --name ${NAME} --env GIT_URL=https://github.com/kamipatel/redwoods-insurance.git --env GIT_PROJECT=redwoods-insurance --env JMX_FILE_NAME=cputest.jmx --env GIT_PROJECT=redwoods-insurance --env OUTPUT_TYPE=CONSOLE -i -v ${PWD}:${PWD} -w ${PWD} ${IMAGE} env 
docker run --name ${NAME} --env GITHUB_TOKEN=7777171721078bbbdb91ea4218864563e7d2d5d9 --env GIT_URL=https://github.com/kamipatel/redwoods-insurance.git --env GIT_PROJECT=redwoods-insurance -i ${IMAGE} env 

#sudo docker run -it --entrypoint bash ${IMAGE}
