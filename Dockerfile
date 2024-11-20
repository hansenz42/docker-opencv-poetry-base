FROM python:3.11.10-bookworm
RUN apt-get update && apt-get install -y \
    libpq-dev \
    python3-dev \
    build-essential \
    iputils-ping \
    net-tools \
    cmake \
    ffmpeg libsm6 libxext6 libgl1 \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install poetry numpy setuptools

WORKDIR /app
COPY ./lib/opencv-4.10.0 /app/lib/opencv
COPY ./lib/opencv_contrib-4.10.0/ /app/lib/opencv_contrib

RUN cd /app/lib/opencv && \
    mkdir build && \
    cd build && \
    cmake \
    -D CMAKE_BUILD_TYPE=Release \
    -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules \
    -D OPENCV_ENABLE_NONFREE=ON \
    -D BUILD_EXAMPLES=ON \
    -D CMAKE_INSTALL_PREFIX=/usr/local \
    -D BUILD_DOCS=ON \
    -D BUILD_TESTS=ON \
    -D BUILD_PERF_TESTS=ON \
    -D BUILD_opencv_python2=OFF \
    -D BUILD_opencv_python3=ON \
    -D PYTHON3_EXECUTABLE=$(which python3) \
    -D PYTHON3_INCLUDE_DIR=$(python3 -c "from distutils.sysconfig import get_python_inc; print(get_python_inc())") \
    -D PYTHON3_PACKAGES_PATH=$(python3 -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())") \
    .. && \
    make -j4 && \
    make install
