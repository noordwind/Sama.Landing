#!/bin/bash
DOCKER_ENV=''
DOCKER_TAG=''
case "$TRAVIS_BRANCH" in
  "master")
    DOCKER_ENV=production
    DOCKER_TAG=latest
    ;;
  "develop")
    DOCKER_ENV=development
    DOCKER_TAG=dev
    ;;    
esac

docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD
docker build -t sama.landing:$DOCKER_TAG .
docker tag sama.landing:$DOCKER_TAG $DOCKER_USERNAME/sama.landing:$DOCKER_TAG
docker push $DOCKER_USERNAME/sama.landing:$DOCKER_TAG