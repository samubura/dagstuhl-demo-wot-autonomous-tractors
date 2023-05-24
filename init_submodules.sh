#!/bin/bash

git submodule init
git submodule update --remote

cd ./wot-web-simulator

git checkout e5b202a

cd ../mas-rest-runtime

git submodule init
git submodule update

git checkout fb38487

cd ../intelliot-hypermas-explorer

git checkout 3455be7

cd ..
