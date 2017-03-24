#!/bin/bash
# This automates setup of building the docker containers and that's pretty much it.   

VERSION=$(head VERSION)

cd tor-proxy
docker build -t torproxy:$VERSION .
docker tag torproxy:$VERSION torproxy:latest

cd ../privoxy
docker build -t privoxy:$VERSION .
docker tag privoxy:$VERSION privoxy:latest

echo "Thanks for taking a step towards a more secure and private world"
