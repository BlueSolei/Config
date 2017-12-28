#!/bin/bash

# install vim 8
sudo add-apt-repository ppa:jonathonf/vim
sudo apt update
sudo apt install vim
sudo apt install python-tk # gui for python
sudo apt install python3-tk # gui for python3

# how to add gui to bash at windows 10
# 	https://www.pcworld.com/article/3055403/windows/windows-10s-bash-shell-can-run-graphical-linux-applications-with-this-trick.html
# 	In windows CMD: curl -o Xming-6-9-0-31-setup.exe https://iweb.dl.sourceforge.net/project/xming/Xming/6.9.0.31/Xming-6-9-0-31-setup.exe
export DISPLAY=:0

