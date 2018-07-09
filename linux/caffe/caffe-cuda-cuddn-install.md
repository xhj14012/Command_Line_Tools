#xubuntu 17.10.1 cuda 9.2
# 更新源
sudo apt-get update

1.NVIDIA Driver安装相关
	安装驱动共有四种方法：PPA源，附加驱动安装，deb安装，runfile安装。
	为避免一些问题：
		实测官方PPA（测试）源带宽低，科学上网也无明显效果。
		附加驱动由ubuntu等提供，未实测，只觉得自带的要是靠谱也不会有这么多人去挖坑了。
		社区有很多推荐deb安装的，有诸如不需要处理自带驱动等理由，但实测无论是否先安装驱动，deb安装都会遇到依赖冲突，原因大致是cuda和driver都包含有driver，晚点再查具体原因，总之deb没有传说中的那么神就是咯。
	总之下面全部采用runfile离线安装：）

2.卸载原由NVIDIA驱动

#remove original driver installed
sudo apt-get remove --purge nvidia*

#remove original driver installed by runfile:
sudo chmod +x NVIDIA-Linux-x86_64-386.24.run
sudo ./NVIDIA-Linux-x86_64-386.24.run --uninstall

3.禁用nouveau驱动
sudo vim /etc/modprobe.d/blacklist.conf
# 尾部添加
##blacklist nouveau
##options nouveau modeset=0
#重载配置并重启
sudo update-initramfs -u
sudo reboot
执行检查
lsmod | grep nouveau
若无输出则nouveau已禁用

4.禁用X-WINDOWS
图形界面关闭
sudo service lightdm stop
Ctrl-Alt+F1，输入用户名和密码登录。
（如需恢复，执行 sudo service lightdm start ，然后Ctrl-Alt+F7即可）

5.安装NVIDIA驱动
（zubuntu需要额外安装gcc-6/g++-6及配置环境变量）
部分参数：
–no-opengl-files：表示只安装驱动文件，不安装OpenGL文件。这个参数不可省略，否则会导致登陆界面死循环，英语一般称为”login loop”或者”stuck in login”。
–no-x-check：表示安装驱动时不检查X服务，非必需。
–no-nouveau-check：表示安装驱动时不检查nouveau，非必需。
-Z, --disable-nouveau：禁用nouveau。此参数非必需，因为之前已经手动禁用了nouveau。
-A：查看更多高级选项。

sudo chmod +x NVIDIA-Linux-x86_64-384.59.run
sudo ./NVIDIA-Linux-x86_64-384.59.run –no-opengl-files
必选参数解释：因为NVIDIA的驱动默认会安装OpenGL，而Ubuntu的内核本身也有OpenGL、且与GUI显示息息相关，一旦NVIDIA的驱动覆写了OpenGL，在GUI需要动态链接OpenGL库的时候就引起问题。

检测nvidia-smi #若列出GPU的信息列表，表示驱动安装成功
nvidia-settings #若弹出设置对话框，亦表示驱动安装成功

6.安装CUDA
sudo ./cuda_8.0.61_375.26_linux.run --no-opengl-libs

--no-opengl-libs：表示只安装驱动文件，不安装OpenGL文件。必需参数，原因同上。注意：不是-no-opengl-files。
--uninstall (deprecated)：用于卸载CUDA Driver（已废弃）。
--toolkit：表示只安装CUDA Toolkit，不安装Driver和Samples。
--help：查看更多高级选项。

unfinished
