#!/bin/bash

# this could be more automated easily.. I suck at bash
# also, this assumes gocart is on $PATH, we should also fix that

git submodule update --init

# grabbing executor's dependencies
pushd ./src/executor
GOPATH=$PWD gocart
popd

#grabbing garden's dependencies
pushd ./src/garden
GOPATH=$PWD gocart
popd