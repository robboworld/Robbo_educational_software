#!/bin/bash
echo "This script installs ALL ROBBO Software for ROBBO educational hardware (Roboplatform, Lab, 3D-printer,etc and some extra applications to teach children programming, robotics, 3d-modeling, etc"
user_home=`xdg-user-dir`
current_dir=`pwd`
user_desktop=`xdg-user-dir DESKTOP`

# delete old arduino
echo "please enter your user password and press enter"
echo "пожалуйста введите свой пароль и нажмите enter"
# remove repo arduino
sudo apt-get remove arduino

# add user to dialout group to grant sccess to serial ports
sudo usermod "$USER" -aG dialout
sudo usermod root -aG dialout

# install all packages robboscratch needs to
cd "$current_dir"
sudo dpkg --add-architecture i386
sudo apt-get -qqy update
sudo apt-get -qqy install libgtk2.0-0:i386  libnss3:i386  libssl1.0.0:i386  libasound2:i386  libc6:i386 libgif7:i386  libjpeg8:i386 libpulse0:i386  libx11-6:i386  libxext6:i386  libxi6:i386  libxrender1:i386  libxtst6:i386  libxt6:i386  libasound2-plugins:i386
sudo apt-get -qqy install menu avrdude wmctrl

# bluman is thru for serial bluetooth
sudo apt-get -qqy install blueman >/dev/null
sudo apt-get -qqy purge gnome-bluetooth


# fix Ubuntu 18 and Mint 18 libcurl 3 and 4 bug https://bugs.launchpad.net/ubuntu/+source/curl/+bug/1754294
sudo apt-get -qqy remove libcurl3:i386 libcurl3 libcurl4:i386 libcurl4
sudo add-apt-repository -y ppa:xapienz/curl34
sudo apt-get -qqy update
sudo apt-get -qqy install libcurl4:i386 libcurl3
sudo apt-get -qqy install libcurl4  libcurl3

##remove bellow
#sudo apt-get -qqy remove libcurl3:i386 libcurl3 libcurl4:i386 libcurl4
#sudo add-apt-repository -y --remove ppa:xapienz/curl34
#sudo apt-get -qqy update
#sudo apt-get -qqy install libcurl3:i386


#wget http://security.ubuntu.com/ubuntu/pool/main/libp/libpng/libpng12-0_1.2.54-1ubuntu1.1_i386.deb
#wget http://security.ubuntu.com/ubuntu/pool/main/libp/libpng/libpng12-0_1.2.54-1ubuntu1.1_amd64.deb
sudo apt-get -qqy install ./libpng12-0_1.2.54-1ubuntu1.1_i386.deb
sudo apt-get -qqy install ./libpng12-0_1.2.54-1ubuntu1.1_amd64.deb

#wget http://security.ubuntu.com/ubuntu/pool/universe/libg/libgksu/libgksu2-0_2.0.13~pre1-9ubuntu2_amd64.deb
#wget http://security.ubuntu.com/ubuntu/pool/universe/g/gksu/gksu_2.0.2-9ubuntu1_amd64.deb
sudo apt-get -qqy install ./libgksu2-0_2.0.13~pre1-9ubuntu2_amd64.deb
sudo apt-get -qqy install ./gksu_2.0.2-9ubuntu1_amd64.deb

# robbo soft install
sudo apt-get -qqy install ./robboscratch3.8.0-x64.deb
sudo apt-get -qqy install ./robboscratch2.1.70.deb
sudo apt-get -qqy install ./robbojunior0.0.9-x64.deb
cp -f "$current_dir/robboscratch2s.desktop" "$user_desktop"


# Scratch for Arduino s4a
sudo apt-get -qqy install ./S4A16.deb
cp -f "$current_dir/s4a.desktop" "$user_desktop"

#freecad
sudo add-apt-repository -y ppa:freecad-maintainers/freecad-stable
sudo apt-get -qqy update
sudo apt-get -qqy install freecad

##Install Arduino IDE 1.0.5 /// processing /// gcompris


#uninstall different
cd /opt/arduino-1.6.10/
./uninstall.sh
#
cd "$current_dir"
sudo tar -xvf RRR1.tar.gz -C /opt
cd /opt/processing-3.4/
./install.sh
cd /opt/arduino-1.0.5/
./install.sh

cd "$current_dir"
sudo tar -xvf RRR1.tar.gz -C /opt
cp -f "$current_dir/gcompris.desktop" "$user_desktop"
chmod 700 "$user_desktop/gcompris.desktop"
sudo cp -f "$current_dir/gcompris.desktop" /usr/share/applications/


# copy dir with Ardunio sketch to be uploaded with Scratch4arduino  
cp -rf "$current_dir/Arduino" "$user_desktop/Arduino_S4A"

# Install Ardublock plugin to Arduino 1.0.5

sudo mkdir -p /opt/arduino-1.0.5/tools/ArduBlockTool/tool
sudo cp -f "$current_dir/ardublock-russian-20130810.jar" /opt/arduino-1.0.5/tools/ArduBlockTool/tool

#robbo wallpapers
sudo cp "$current_dir/linuxmint.jpg" /usr/share/backgrounds
sudo cp "$current_dir/robbo-wallpapers.png" /usr/share/backgrounds
gsettings set org.gnome.desktop.background picture-uri "file:///usr/share/backgrounds/robbo-wallpapers.png"
gsettings set org.mate.background picture-filename /usr/share/backgrounds/robbo-wallpapers.png

## fix 
sudo apt-get install -f

##unity (for the future)
#sudo apt-get -qqy install mono-reference-assemblies-3.5
#sudo apt-get -qqy install -f
#sudo apt-get -qqy install ./unity-editor_amd64.deb
## external mono develop
#sudo apt-get -qqy install flatpak
#flatpak -y install --user --from https://download.mono-project.com/repo/monodevelop.flatpakref


echo "переходим на установку Repetierhost для Robbo 3D mini"
./2.sh
