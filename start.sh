#! /bin/bash

# check if there is lib folder, if not create one

if [ -d "lib" ]; then
    echo "lib folder exists"
else
    mkdir lib
    echo "lib folder created"
fi

wget -O opencv.tar.gz https://github.com/opencv/opencv/archive/refs/tags/4.10.0.tar.gz
tar -xzvf opencv.tar.gz
mv opencv-4.10.0 lib
rm opencv.tar.gz

wget -O contrib.tar.gz https://github.com/opencv/opencv_contrib/archive/refs/tags/4.10.0.tar.gz
tar -xzvf contrib.tar.gz
mv opencv_contrib-4.10.0 lib
rm contrib.tar.gz

# start docker build
docker build -t opencv-poetry-base --network host -f Dockerfile .
