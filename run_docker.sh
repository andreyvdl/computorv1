#! /usr/bin/sh

docker build -f ./env.dockerfile -t 42-computorv1-env .
docker run -it 42-computorv1-env
