#check device
lspci -vnn | grep VGA -A 12

sudo cp /etc/modprobe.d/blacklist.conf /etc/modprobe.d/blacklist.conf.bak
sudo vim /etc/modprobe.d/blacklist.conf
## add:
## blacklist nouveau
## options nouveau modeset=0
sudo update-initramfs -u

#close
sudo /etc/init.d/gdm3 stop
sudo init 3

2.
linux各发行版，有个通用的系统运行级别。3为标准的多用户模式，5为X Window模式。可以用runlevel命令来查看当前系统运行level。ubuntu17.10桌面版，默认level是5。我们可以通过telinit命令切换运行模式。
sudo telinit 3


#check
lsmod | grep nouveau



sudo add-apt-repository ppa:graphics-drivers/ppa
sudo apt update
sudo apt install nvidia-396 nvidia-396-dev

#check
sudo lshw -c video|grep configuration


export PATH=/usr/local/cuda-9.2/bin${PATH:+:${PATH}}

export PATH=/usr/local/cuda-9.0/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda-9.0/lib64:$LD_LIBRARY_PATH
7.third part libs
sudo apt-get install g++ freeglut3-dev build-essential libx11-dev libxmu-dev libxi-dev libglu1-mesa libglu1-mesa-dev

#before
sudo apt-get install freeglut3-dev build-essential libx11-dev libxmu-dev libxi-dev libgl1-mesa-glx libglu1-mesa libglu1-mesa-dev