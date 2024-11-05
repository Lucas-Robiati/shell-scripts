#!/bin/bash

if [ "$#" -ne 1 ]; then
   echo "Incorect use: ./script.sh <folder path>"
   exit 1
fi

if [ $UID -ne 0 ]; then
    echo "Necessary super user"
    exit 1
fi

path=$1
theme="/boot/grub/theme/"
config="/etc/default/grub"

source progress_bar.sh
setup_scroll_area
if [ -d "$theme" ]; then
    echo "Directory theme exist"
    draw_progress_bar 35
else
    echo "Creating directory theme"
    mkdir $theme
    draw_progress_bar 25
if [ "$?" -ne 0 ]; then 
    echo "Impossible created directory"
    exit 1
fi    
fi

if [ $(echo $1 | awk '{print substr($0, 1, 1)}') != '/' ]; then  
    path=$PWD'/'$path
fi

echo "Copying files to destination..."
cp -r $path $theme
draw_progress_bar 50

for i in $(ls $theme -tc)
  do
       name_dir=$i
       break
  done;

theme=$theme$name_dir
#path final do theme
theme=$(find $theme -name theme.txt)

echo "Update file Grup configuration"
draw_progress_bar 80

#remove o grub_theme usar -i pra moldar o arquivo
sed -i '/^GRUB_THEME/d' $config
echo "GRUB_THEME="$theme >> $config

#$grub-mkconfig -o /boot/grub/grub.cfg
echo "Upgradeble grub"
draw_progress_bar 90
$(update-grub2)

sleep 1
echo "Finish"
draw_progress_bar 100
destroy_scroll_area
