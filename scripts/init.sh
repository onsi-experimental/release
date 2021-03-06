#!/bin/bash

# this could be more automated easily.. I suck at bash
# also, this assumes gocart is on $PATH, we should also fix that
# also, to really nail this, we'll need to be able to tell gocart to skip "test-only" packages
# also, gocart needs to not remove things from the .lock (or have a mode where it doesn't do that)

git submodule update --init

# grabbing executor's dependencies
pushd ./src/executor
cp ../workspace/Cartridge.lock ./Cartridge.lock
GOPATH=$PWD
gocart
    pushd ./src/github.com/onsi-experimental/executor
        cp ../../../../../workspace/Cartridge.lock ./Cartridge.lock
        gocart
    popd
popd

#grabbing garden's dependencies
pushd ./src/garden
cp ../workspace/Cartridge.lock ./Cartridge.lock
GOPATH=$PWD
gocart
    pushd ./src/github.com/onsi-experimental/garden
        cp ../../../../../workspace/Cartridge.lock ./Cartridge.lock
        gocart
    popd
popd