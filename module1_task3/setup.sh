#!/bin/bash

sudo apt-get update
apt-get install -y hugo
apt-get install -y make
make build
2>&1 echo "recipe for target 'build' failed"
exit 255
