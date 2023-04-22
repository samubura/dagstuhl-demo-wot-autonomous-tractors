#!/bin/bash

git submodule init
git submodule update

cd ./wot-web-simulator

git checkout e5b202a

cd ../mas-rest-runtime

git submodule init
git submodule update

git checkout fb38487

cd ../intelliot-hypermas-explorer

git checkout b1d6fd5

cd ..
