#theme="/boot/grub/theme"
#t="/etc/default/grub"
#name_dir=$(ls $theme -tc)

#name_dir
#for i in $(ls $theme -tc)
#do
 #      name_dir=$i
 #      break
#done;
#theme=$theme'/'$name_dir
#name_arq=$(find $theme -name theme.txt)                                                                                                               
#echo $name_arq

#sed "/theme/! echo foi" "/home/luckfish/codigos/codigos-c/shell/test.sh"
#
#sed "/^GRUB_THEEME/d"
grub-mkconfig -o /boot/grub/grub.cfg
