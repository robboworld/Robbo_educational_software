#!/bin/bash
echo "This script installs ALL ROBBO Software for ROBBO educational hardware (Roboplatform, Lab, 3D-printer,etc and some extra applications to teach children programming, robotics, 3d-modeling, etc"
user_home=`xdg-user-dir`
current_dir=`pwd`
user_desktop=`xdg-user-dir DESKTOP`
homedir=$( getent passwd "$SUDO_USER" | cut -d: -f6 );

echo "$user_home ; $current_dir ; $user_desktop ; $homedir ; $HOME";

if [[ "$USER" == "root" ]]
then
	echo "Ok, starting";
else
	echo "Please, start this script with sudo: sudo ./1.sh";
	exit;
fi

ping -w 3 8.8.8.8
if [[ $? -ne 0 ]]
then
	echo "No internet connection!!!";
	exit;
fi



# exit;

# delete old arduino
#echo "please enter your user password and press enter"
#echo "пожалуйста введите свой пароль и нажмите enter"
# remove repo arduino
sudo apt-get remove arduino
echo "Old arduino was removed-------------------------------------------------------------------"
# exit;

# add user to dialout group to grant sccess to serial ports
sudo usermod "$SUDO_USER" -aG dialout
sudo usermod root -aG dialout
echo "added root and user to dialout-------------------------------------------------------------------"
# exit;

# install all packages robboscratch needs to
cd "$current_dir"
sudo dpkg --add-architecture i386
echo "add architecture i386-------------------------------------------------------------------"
sudo apt-get -qqy update
sudo apt-get -qqy install libgtk2.0-0:i386  libnss3:i386  libssl1.0.0:i386  libasound2:i386  libc6:i386 libgif7:i386  libjpeg8:i386 libpulse0:i386  libx11-6:i386  libxext6:i386  libxi6:i386  libxrender1:i386  libxtst6:i386  libxt6:i386  libasound2-plugins:i386
sudo apt-get -qqy install menu avrdude wmctrl
echo "installed menu avrdude wmctrl-------------------------------------------------------------------"
# exit;

# bluman is thru for serial bluetooth
sudo apt-get -qqy install blueman >/dev/null
sudo apt-get -qqy purge gnome-bluetooth
echo "installed blueman, purged gnome-bluetooth-------------------------------------------------------------------"
# exit;


# fix Ubuntu 18 and Mint 18 libcurl 3 and 4 bug https://bugs.launchpad.net/ubuntu/+source/curl/+bug/1754294
# don't need this since mint 19.2
#sudo apt-get -qqy remove libcurl3:i386 libcurl3 libcurl4:i386 libcurl4
#sudo add-apt-repository -y ppa:xapienz/curl34
#sudo apt-get -qqy update
#sudo apt-get -qqy install libcurl4:i386 libcurl3
#sudo apt-get -qqy install libcurl4  libcurl3

##remove bellow
#sudo apt-get -qqy remove libcurl3:i386 libcurl3 libcurl4:i386 libcurl4
#sudo add-apt-repository -y --remove ppa:xapienz/curl34
#sudo apt-get -qqy update
#sudo apt-get -qqy install libcurl3:i386


#wget http://security.ubuntu.com/ubuntu/pool/main/libp/libpng/libpng12-0_1.2.54-1ubuntu1.1_i386.deb
#wget http://security.ubuntu.com/ubuntu/pool/main/libp/libpng/libpng12-0_1.2.54-1ubuntu1.1_amd64.deb
sudo apt-get -qqy install ./libpng12-0_1.2.54-1ubuntu1.1_i386.deb
sudo apt-get -qqy install ./libpng12-0_1.2.54-1ubuntu1.1_amd64.deb
echo "installed libpng12-0_1.2.54*-------------------------------------------------------------------"
# exit;

#wget http://security.ubuntu.com/ubuntu/pool/universe/libg/libgksu/libgksu2-0_2.0.13~pre1-9ubuntu2_amd64.deb
#wget http://security.ubuntu.com/ubuntu/pool/universe/g/gksu/gksu_2.0.2-9ubuntu1_amd64.deb
sudo apt-get -qqy install ./libgksu2-0_2.0.13~pre1-9ubuntu2_amd64.deb
sudo apt-get -qqy install ./gksu_2.0.2-9ubuntu1_amd64.deb
echo "installed libgksu2... gksu_2.0.2...-------------------------------------------------------------------"
# exit;

# robbo soft install
sudo apt-get -qqy install ./robboscratch3.22.0-x64.deb
sudo apt-get -qqy install ./robboscratch2.1.70.deb
sudo apt-get -qqy install ./robbojunior0.0.10-x64-nwjs.deb
echo "installed robboscratches-------------------------------------------------------------------"
cp -f "$current_dir/robboscratch2s.desktop" "$homedir/Desktop"
chmod 777 $homedir/Desktop/robboscratch2s.desktop
echo "chmod 777 robboscratch2s.desktop-------------------------------------------------------------------"
# exit;

# Scratch for Arduino s4a
sudo apt-get -qqy install ./S4A16.deb
echo "installed S4A16.deb-------------------------------------------------------------------"
cp -f "$current_dir/s4a.desktop" "$homedir/Desktop"
chmod 777 $homedir/Desktop/s4a.desktop
echo "chmod 777 $homedir/Desktop/s4a.desktop-------------------------------------------------------------------"
# exit;

#freecad
sudo add-apt-repository -y ppa:freecad-maintainers/freecad-stable
sudo apt-get -qqy update
sudo apt-get -qqy install freecad
echo "installed freecad-------------------------------------------------------------------"
# exit;

##Install Arduino IDE 1.0.5 /// processing /// gcompris


#uninstall different
cd /opt/arduino-1.6.10/
./uninstall.sh
#
cd "$current_dir"
sudo tar -xvf RRR1.tar.gz -C /opt
echo "extracted RRR1.tar.gx to /opt -------------------------------------------------------------------"
cd /opt/processing-3.4/
echo "installing processing-3.4-------------------------------------------------------------------"
./install.sh
cd /opt/arduino-1.0.5/
echo "installing arduino -------------------------------------------------------------------"
./install.sh

cd "$current_dir"
sudo tar -xvf RRR1.tar.gz -C /opt
cp -f "$current_dir/gcompris.desktop" "$homedir/Desktop"
chmod 777 "$homedir/Desktop/gcompris.desktop"
sudo cp -f "$current_dir/gcompris.desktop" /usr/share/applications/
echo "I don't understand what is it but is's about gcompris.desktop-------------------------------------------------------------------"

# copy dir with Ardunio sketch to be uploaded with Scratch4arduino  
cp -rf "$current_dir/Arduino" "$homedir/Desktop/Arduino_S4A"
echo "cp -rf \"$current_dir/Arduino\" \"$homedir/Desktop/Arduino_S4A\"-------------------------------------------------------------------"

# Install Ardublock plugin to Arduino 1.0.5

sudo mkdir -p /opt/arduino-1.0.5/tools/ArduBlockTool/tool
sudo cp -f "$current_dir/ardublock-russian-20130810.jar" /opt/arduino-1.0.5/tools/ArduBlockTool/tool
echo "ardublock-russian-20130810.jar-------------------------------------------------------------------"

#robbo wallpapers
sudo cp "$current_dir/linuxmint.jpg" /usr/share/backgrounds
sudo cp "$current_dir/robbo-wallpapers.png" /usr/share/backgrounds
gsettings set org.gnome.desktop.background picture-uri "file:///usr/share/backgrounds/robbo-wallpapers.png"
gsettings set org.mate.background picture-filename /usr/share/backgrounds/robbo-wallpapers.png

## fix
sudo apt-get install -qqyf

##unity (for the future)
#sudo apt-get -qqy install mono-reference-assemblies-3.5
#sudo apt-get -qqy install -f
#sudo apt-get -qqy install ./unity-editor_amd64.deb
## external mono develop
#sudo apt-get -qqy install flatpak
#flatpak -y install --user --from https://download.mono-project.com/repo/monodevelop.flatpakref


echo "переходим на установку Repetierhost для Robbo 3D mini"
./2.sh
