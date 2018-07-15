#check device
lspci -vnn | grep VGA -A 12

#block nouveau driver
sudo cp /etc/modprobe.d/blacklist.conf /etc/modprobe.d/blacklist.conf.bak
sudo vim /etc/modprobe.d/blacklist.conf
#add at the end:
blacklist nouveau
options nouveau modeset=0
#run
sudo update-initramfs -u

#close gdm
#for ubuntu17.10
sudo /etc/init.d/gdm3 stop
#for xubuntu
sudo /etc/init.d/lightdm stop
sudo init 3

(linux各发行版，有个通用的系统运行级别。3为标准的多用户模式，5为X Window模式。可以用runlevel命令来查看当前系统运行level。ubuntu17.10桌面版，默认level是5。我们可以通过telinit命令切换运行模式)
sudo telinit 3

#check
lsmod | grep nouveau 

sudo add-apt-repository ppa:graphics-drivers/ppa
sudo apt update

sudo telinit 3
sudo /etc/init.d/gdm3 stop
ubuntu-drivers devices
sudo apt install nvidia-396 nvidia-396-dev

#check driver
sudo lshw -c video|grep configuration

#prepair g++6
#check version
gcc -v
g++ -v
#install g++6
sudo apt-get install gcc-6
sudo apt-get install g++-6
#list g++ installed
ls /usr/bin/gcc*
ls /usr/bin/g++*
#set g++6 as default
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-6 100
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-6 100
sudo update-alternatives --config gcc
sudo update-alternatives --config g++
#check again
gcc -v
g++ -v



#install third part libs
sudo apt-get install freeglut3-dev build-essential libx11-dev libxmu-dev libxi-dev libgl1-mesa-glx libglu1-mesa libglu1-mesa-dev

#install cuda without driver,choose n if asked to install driver
sudo sh cuda_9.2.88_396.26_linux.run --no-opengl-libs

#isntall patch
sudo sh cuda_9.2.88.1_linux.run

#add path
echo 'export PATH=/usr/local/cuda-9.2/bin${PATH:+:${PATH}}' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=/usr/local/cuda-9.2/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}' >> ~/.bashrc

echo 'export PATH=/usr/local/cuda-9.2/bin${PATH:+:${PATH}}' >> ~/.zshrc
echo 'export LD_LIBRARY_PATH=/usr/local/cuda-9.2/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}' >> ~/.zshrc

#test cuda
cd /usr/local/cuda-9.2/samples/1_Utilities/deviceQuery
sudo make
./deviceQuery
cd ../bandwidthTest
sudo make
./bandwidthTest

#install cuddn
#download from https://developer.nvidia.com/rdp/cudnn-download
tar -xzvf cudnn-9.2-linux-x64-v7.1.tgz
sudo cp cuda/include/cudnn.h /usr/local/cuda/include
sudo cp cuda/lib64/libcudnn* /usr/local/cuda/lib64
sudo chmod a+r /usr/local/cuda/include/cudnn.h
sudo chmod a+r /usr/local/cuda/lib64/libcudnn*

#install opencv3
#install the dependencies first and then build the OpenCV 3.x from source
sudo apt-get install --assume-yes build-essential cmake git
sudo apt-get install --assume-yes pkg-config unzip ffmpeg qtbase5-dev python-dev python3-dev python-numpy python3-numpy
sudo apt-get install --assume-yes libopencv-dev libgtk-3-dev libdc1394-22 libdc1394-22-dev libjpeg-dev libpng12-dev libtiff5-dev libjasper-dev
sudo apt-get install --assume-yes libavcodec-dev libavformat-dev libswscale-dev libxine2-dev libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev
sudo apt-get install --assume-yes libv4l-dev libtbb-dev libfaac-dev libmp3lame-dev libopencore-amrnb-dev libopencore-amrwb-dev libtheora-dev
sudo apt-get install --assume-yes libvorbis-dev libxvidcore-dev v4l-utils vtk6
sudo apt-get install --assume-yes liblapacke-dev libopenblas-dev libgdal-dev checkinstall

#Download the latest source archive for OpenCV 3.x 
wget https://github.com/opencv/opencv/archive/3.4.2.zip
unzip 3.4.2.zip
cd opencv-3.4.2/

#build for cuda8 and before
mkdir build
cd build/
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D FORCE_VTK=ON -D WITH_TBB=ON -D WITH_V4L=ON -D WITH_QT=ON -D WITH_OPENGL=ON -D WITH_CUBLAS=ON -D CUDA_NVCC_FLAGS="-D_FORCE_INLINES" -D WITH_GDAL=ON -D WITH_XINE=ON -D BUILD_EXAMPLES=ON ..
make -j $(($(nproc) + 1))

#build for cuda9
mkdir build
cd build/
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D FORCE_VTK=ON -D WITH_TBB=ON -D WITH_V4L=ON -D WITH_QT=ON -D WITH_OPENGL=ON -D WITH_CUBLAS=ON -D CUDA_NVCC_FLAGS="-D_FORCE_INLINES --expt-relaxed-constexpr" -D WITH_GDAL=ON -D WITH_XINE=ON -D BUILD_EXAMPLES=ON ..
make -j $(($(nproc) + 1))

#install opencv
sudo make install
sudo /bin/bash -c 'echo "/usr/local/lib" > /etc/ld.so.conf.d/opencv.conf'
sudo ldconfig
sudo apt-get update

#opencv test
cd ~/opencv-3.4.2/samples/cpp/example_cmake
./opencv_example

#install caffe dependencies
sudo apt-get install -y build-essential cmake git pkg-config
sudo apt-get install -y libprotobuf-dev libleveldb-dev libsnappy-dev libhdf5-serial-dev protobuf-compiler libatlas-base-dev libboost-all-dev libgflags-dev libgoogle-glog-dev liblmdb-dev





sudo apt-get install --no-install-recommends build-essential cmake git gfortran libatlas-base-dev libboost-filesystem-dev libboost-python-dev libboost-system-dev libboost-thread-dev libgflags-dev libgoogle-glog-dev libhdf5-serial-dev libleveldb-dev liblmdb-dev libopencv-dev libsnappy-dev python-all-dev python-dev python-h5py python-matplotlib python-numpy python-opencv python-pil python-pip python-pydot python-scipy python-skimage python-sklearn


# example location - can be customized
export CAFFE_ROOT=~/caffe
git clone https://github.com/NVIDIA/caffe.git $CAFFE_ROOT -b 'caffe-0.15'
sudo apt-get install libssl-dev libffi-dev
sudo pip install -r $CAFFE_ROOT/python/requirements.txt
cat $CAFFE_ROOT/python/requirements.txt | xargs -n1 sudo pip install

cd /usr/local/cuda/include/crt      
sudo subl common_functions.h
commit line 64 "...CUDACC_VER_..."

cd $CAFFE_ROOT
mkdir build
cd build
cmake ..
make -j"$(nproc)"
make install

#read these official doc
#https://docs.nvidia.com/cuda/cuda-quick-start-guide/index.html
#https://github.com/BVLC/caffe/wiki/OpenCV-3.3-Installation-Guide-on-Ubuntu-16.04



