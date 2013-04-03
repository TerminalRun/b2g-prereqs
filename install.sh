#! /bin/bash

echo "Checking Operating System"
echo "#########################"
OS= sed -n 's/^NAME=//p' /etc/*-release
echo $OS
echo "Installing Packages"
echo "#########################"
sudo apt-get install gcc-4.6 g++-4.6 autoconf2.13 bison bzip2 ccache curl flex gawk g++-4.6-multilib git ia32-libs lib32ncurses5-dev lib32z1-dev libgl1-mesa-dev libX11-dev ln -s /usr/lib/i386-linux-gnu/libX11.so.6 /usr/lib/i386-linux-gnu/libX11.so ln -s /usr/lib/i386-linux-gnu/mesa/libGL.so.1 /usr/lib/i386-linux-gnu/libGL.so   make -y
echo "making directory"
mkdir ~/firefox_os
cd firefox_os
echo "Setting cache size"
echo "#########################"
ccache --max-size 3GB
echo "Cloning Project"
echo "#########################"
git clone git://github.com/mozilla-b2g/B2G.git
echo "Configuring Build"
echo "#########################"
cd B2G/
./config.sh emulator
echo "Building"
echo "#########################"
./build.sh

exit 0

