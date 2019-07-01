sudo apt-get install build-essential cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev -y
sudo apt-get install python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev -y
sudo apt-get install freeglut3-dev mesa-common-dev  libgtkglext1 libgtkglext1-dev -y
sudo apt-get install checkinstall yasm libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev libv4l-dev libtbb-dev libqt4-dev libgtk2.0-dev libmp3lame-dev libtheora-dev libvorbis-dev libxvidcore-dev x264 v4l-utils -y
sudo apt-get install libxtst-dev -y
sudo apt-get install cmake
cd ~
git clone https://github.com/opencv/opencv.git
cd opencv
git checkout 2.4
mkdir build
cd build
cmake \
    -D CMAKE_BUILD_TYPE=RELEASE \
    -D CMAKE_INSTALL_PREFIX=/usr/local \
    -D BUILD_PERF_TESTS=OFF \
    -D BUILD_TESTS=OFF \
    -D WITH_CUDA=OFF \
    -D WITH_CUBLAS=OFF \
    -D CUDA_FAST_MATH=OFF \
    -D WITH_CUFFT=OFF \
    -D WITH_NVCUVID=OFF \
    -D WITH_V4L=ON \
    -D WITH_LIBV4L=ON \
    -D WITH_OPENGL=ON \
    -D WITH_FFMPEG=ON \
    -D INSTALL_C_EXAMPLES=OFF \
    -D BUILD_EXAMPLES=OFF \
    ..
make -j $(($(nproc) + 1))
sudo make install
sudo /bin/bash -c 'echo "/usr/local/lib" > /etc/ld.so.conf.d/opencv.conf'
sudo ldconfig
