#!/bin/bash

wifi="Wi-Fi"
# "WenShi_Office_5G"
# proxy=192.168.7.113
# local=127.0.0.1
# local_port=8080
# http_port=8888
# https_port=8888
# socks_port=8889


gsettings set com.deepin.wrap.gnome.system.proxy.http host 127.0.0.1
gsettings set com.deepin.wrap.gnome.system.proxy.http port 8080
#gsettings set com.deepin.wrap.gnome.system.proxy.http enabled

gsettings set com.deepin.wrap.gnome.system.proxy.https host 127.0.0.1
gsettings set com.deepin.wrap.gnome.system.proxy.https port 8080
#gsettings set com.deepin.wrap.gnome.system.proxy.https enabled

gsettings set com.deepin.wrap.gnome.system.proxy.socks host 127.0.0.1
gsettings set com.deepin.wrap.gnome.system.proxy.socks port 8080
#gsettings set com.deepin.wrap.gnome.system.proxy.socks enabled
