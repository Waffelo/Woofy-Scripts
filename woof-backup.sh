#!/bin/sh

# Needed variables ###############################################

dir1="$HOME/.local/usr/"
dir2="$HOME/.texmf"
dir3="$HOME/.config"
dir4="$HOME/.gpg"
dir5="$HOME/.minetest"
dir6="$HOME/.local/share/gajim"

fil1="/etc/hosts"
fil2="$HOME/.bashrc"


# Script variables ##############################################
magentabold="\e[1;35m"
redbold="\e[1;31m"
canc="\e[0m"



echo ""
echo -e "$magentabold########################################"
echo "#            Woof Thinkpad             #"
echo "#            backup script             #"
echo "########################################"
echo -e "$canc"
echo "This script creates a backup of the Woofie Thinkpad"
echo "Please make sure you have set the correct directory"
echo "variables in the script."

echo " "
read -p "Please Enter Destination Path: " r1
destination=$(dirname "$r1")


while true; do
echo -e "\e[1m"
read -p "Do you want to proceed? (y\n) " yn

echo -e "\e[0m"
case $yn in 
	y ) echo "";
		break;;
	n ) echo "";
		exit;;
	* ) echo "";;
esac

done

# Script actually doing crap #################################

echo ""
echo "----------------------------------------"
echo ""
sleep 0.5

if [ -d "$destination" ]; then 
    cp -rvp $dir1 $dir2 $dir3 $dir4 $dir5 $dir6 $destination
    cp -v $fil1 $fil2 $destination

    echo -e "$magentabold"
    echo -e "The script has finished! $canc"
    echo " "

  else
    echo -e "$redbold"
    echo -e "Destination directory does not exist!$canc"
    echo " "
  
    

fi



