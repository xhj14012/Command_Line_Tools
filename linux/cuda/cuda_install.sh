sudo apt-get install linux-headers-$(uname -r)
lspci -nnk | grep -i nvidia
sudo ls -lh /etc/modprobe.d/blacklist.conf
lspci -vnn | grep VGA -A 12
sudo cp /etc/modprobe.d/blacklist.conf /etc/modprobe.d/blacklist.conf.bak
sudo apt-get install curl wget git zsh vim -y
sudo cp /etc/modprobe.d/blacklist.conf /etc/modprobe.d/blacklist.conf.bak
echo 'blacklist nouveau' >> /etc/modprobe.d/blacklist.conf
echo 'options nouveau modeset=0' >> /etc/modprobe.d/blacklist.conf
sudo update-initramfs -u
lsmod | grep nouveau
sudo apt-get purge nvidia*
sudo add-apt-repository ppa:graphics-drivers
sudo apt-get update
sudo apt-get install screen -y
screen
sudo apt-get install nvidia-430
sudo reboot
# sudo service lightdm stop
mkdir cuda_install
cd cuda_install
# wget
sudo sh cuda_10.0.130_410.48_linux.run
sudo apt-get install freeglut3-dev build-essential libx11-dev libxmu-dev libxi-dev libgl1-mesa-glx libglu1-mesa libglu1-mesa-dev

g++ -v

echo 'export CUDA_HOME=/usr/local/cuda' >> ~/.bashrc
echo 'export PATH=$PATH:$CUDA_HOME/bin' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=/usr/local/cuda-10.0/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}' >> ~/.bashrc

echo 'export CUDA_HOME=/usr/local/cuda' >> ~/.zshrc
echo 'export PATH=$PATH:$CUDA_HOME/bin' >> ~/.zshrc
echo 'export LD_LIBRARY_PATH=/usr/local/cuda-10.0/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}' >> ~/.zshrc

source ~/.zshrc

cd /usr/local/cuda/samples/1_Utilities/deviceQuery
sudo make
./deviceQuery
cd ../bandwidthTest
sudo make
./bandwidthTest
# sudo service lightdm start
sudo reboot

cd cuda_install
tar -xzvf cudnn-10.0-linux-x64-v7.5.0.56.tgz
sudo cp cuda/include/cudnn.h /usr/local/cuda/include/
sudo cp cuda/lib64/libcudnn* /usr/local/cuda/lib64/
sudo cp cuda/NVIDIA_SLA_cuDNN_Support.txt /usr/local/cuda/
sudo chmod a+r /usr/local/cuda/include/cudnn.h
sudo chmod a+r /usr/local/cuda/lib64/libcudnn*
cat /usr/local/cuda/include/cudnn.h | grep CUDNN_MAJOR -A 2

