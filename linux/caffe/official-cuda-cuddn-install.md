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


echo 'export PATH=/usr/local/cuda-9.2/bin${PATH:+:${PATH}}' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=/usr/local/cuda-9.2/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}' >> ~/.bashrc

echo 'export PATH=/usr/local/cuda-9.2/bin${PATH:+:${PATH}}' >> ~/.zshrc
echo 'export LD_LIBRARY_PATH=/usr/local/cuda-9.2/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}' >> ~/.zshrc

//third part libs
//sudo apt-get install g++ freeglut3-dev build-essential libx11-dev libxmu-dev libxi-dev libglu1-mesa libglu1-mesa-dev

#install lib
sudo apt-get install freeglut3-dev build-essential libx11-dev libxmu-dev libxi-dev libgl1-mesa-glx libglu1-mesa libglu1-mesa-dev
#install cuda without driver,choose n if asked to install driver
sudo sh cuda_9.2.88_396.26_linux.run --no-opengl-libs
#isntall patch
sudo sh cuda_9.2.88.1_linux.run
#test cuda
cd /usr/local/cuda-9.2/samples/1_Utilities/deviceQuery
sudo make
./deviceQuery
cd ../bandwidthTest
sudo make
./bandwidthTest

#cuddn
#download from https://developer.nvidia.com/rdp/cudnn-download
tar -xzvf cudnn-9.2-linux-x64-v7.1.tgz
sudo cp cuda/include/cudnn.h /usr/local/cuda/include
sudo cp cuda/lib64/libcudnn* /usr/local/cuda/lib64
sudo chmod a+r /usr/local/cuda/include/cudnn.h
sudo chmod a+r /usr/local/cuda/lib64/libcudnn*

#read this official doc
#https://docs.nvidia.com/cuda/cuda-quick-start-guide/index.html
#过来人的忠告：少看网上乱七八糟的教程，nvidia两个官方文档可以解决所有问题：）
