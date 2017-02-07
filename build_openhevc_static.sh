#!/bin/sh
git submodule update --init
cd ./openhevc/
git checkout hevc_rext
git pull
cmake -DENABLE_STATIC=ON -DENABLE_EXECUTABLE=OFF -DCMAKE_BUILD_TYPE=RELEASE ../openhevc
make || exit 1
cd ..
