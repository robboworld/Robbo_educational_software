#!/bin/bash
# this script install repitierhost x64 and all copy all setting for Robbo3dmini
user_home=`xdg-user-dir`
user_desktop=`xdg-user-dir DESKTOP`
user=$SUDO_USER
current_dir=`pwd`

if [[ "$USER" == "root" ]]
then
	echo "Ok, starting";
else
	echo "Please, start this script with sudo: sudo ./2.sh";
	exit;
fi


if [ "/$SUDO_USER" != "/root" ]
then
	if [ "/$SUDO_USER" != "/" ]
	then
		user_home=/home/$SUDO_USER
        user_desktop="${user_home}/Рабочий стол"
	else
		user="root"
	fi
fi



echo $SUDO_USER
echo $user
echo $user_home
echo $user_desktop 


# delete old repitierhost install
# echo "please enter your user password and press enter"
# echo "пожалуйста введите свой пароль и нажмите enter"

# delete old mono settings
sudo rm -rf $user_home/.mono
# delete old Slic3r settings
sudo rm -rf $user_home/.Slic3r
# delete old repitierhost settings
sudo rm -rf $user_home/.Slic3rPE

sudo rm -rf /opt/RepetierHost

sudo rm -f "$user_desktop/repetier-RepetierHost.desktop"

sudo tar -xvf repetierhost.tar.gz -C /opt

cd $current_dir
sudo rm -rf ~/.local/share/RepetierHost/

sudo apt-get -qqy install mono-complete 
sudo apt-get -qqy install freeglut3

cd /opt/RepetierHost
sudo bash ./configureFirst.sh

# add user to dialout group to grant sccess to serial ports
sudo usermod "$user" -aG dialout
sudo usermod root -aG dialout

sudo rm -rf /plugins/CuraEngine
sudo mv ./repetier-RepetierHost.desktop "$user_desktop"

cd $current_dir

sudo tar -xvf repetierhost.dotfiles.slic3rpe.tar.gz -C $user_home
echo "extracted repetierhost.dotfiles.slic3rpe.tar.gz to $user_home-------------------------------------------------------------------"
sudo tar -xvf repetierhost.dotfiles.slic3r.tar.gz -C $user_home
echo "extracted repetierhost.dotfiles.slic3r.tar.gz to $user_home-------------------------------------------------------------------"
sudo tar -xvf repetierhost.dotfiles.mono.tar.gz -C $user_home
echo "extracted repetierhost.dotfiles.mono.tar.gz to $user_home-------------------------------------------------------------------"
sudo chmod -R 777 "$user_home/.Slic3r"
sudo chmod -R 777 "$user_home/.Slic3rPE"
sudo chmod -R 777 "$user_home/.mono"
echo "rights on .mono and .SlicerSlic3r and .SlicerSlic3rPE are 777-------------------------------------------------------------------"

find $user_home/.Slic3r -type f -name '*' -exec sed -i -r 's/robboclub/'$USER'/g' {} \;
find $user_home/.Slic3rPE -type f -name '*' -exec sed -i -r 's/robboclub/'$USER'/g' {} \;
find $user_home/.mono -type f -name '*' -exec sed -i -r 's/robboclub/'$USER'/g' {} \;

cd $current_dir

#copy PrusaSlicer and config for Protos
#cp -r ./PrusaSlicer ~/ 
#sudo chmod -R 777 $user_home/PrusaSlicer

##копируем конфигбандлы в домашнюю директорию, чтобы в случае проблем с .slic3r и .slic3rpe можно было загрузить пресеты из бандлов
#copy settings for Protos
sudo cp -r PrusaSlicer_config_bundle  $user_home/     
sudo chmod -R 777 $user_home/PrusaSlicer_config_bundle  

#copy settings for ROBBO MINI
sudo cp -r Slic3r_config_bundle  $user_home/          
sudo chmod -R 777 $user_home/Slic3r_config_bundle       

new_dir="$user_home/.local/share/RepetierHost"

sudo tar -xvf slic3r-1.3.0-linux-x64.tar.bz2 -C /opt/RepetierHost/
sudo tar -xvf PrusaSlicer-2.0.0+linux64-201905201652.tar.bz2 -C /opt/RepetierHost/
chmod -R 777 "/opt/RepetierHost"

sudo mkdir $user_home/.local/share/RepetierHost/
sudo tar -xvf Slic3r_local.tar.gz -C "$new_dir"
sudo chmod -R 777 "$new_dir"

#для установки рабочего конфига .mono ставим пакет xmlstarlet, чтобы отредактировать xml таблицу в папке .mono
sudo apt install xmlstarlet


cd $user_home/.mono/registry/CurrentUser/software/repetier
sudo xmlstarlet ed --inplace -u "/values/value[5]" -v "$new_dir" values.xml

cd $current_dir
tar -xvf $current_dir/Printer_Settings.tar.gz -C "$user_desktop"

chmod 777 "$user_desktop/repetier-RepetierHost.desktop"
chmod 777 "$user_desktop/Printer Settings"

echo "CONGRATULATIONS!!! FINISHED!!!"
