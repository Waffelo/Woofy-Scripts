#!/bin/sh
# Made bloatedly to be easily customizable, I need to backup my files 
# often, and I change the things I backup often. Wuff!

# Private key
pmail="contact@waffelo.net"

# Place where the files are copied to
destination="/home/waffelo/woof"

# Directories to copy
dir1="$HOME/.local/usr"
dir2="$HOME/.texmf"
dir3="$HOME/.config"
dir4="$HOME/.gpg"
dir5="$HOME/.minetest"
dir6="$HOME/.local/share/gajim"
dir7="$HOME/.password-store"

# Files to copy
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
echo -e "$redbold "
echo -e "DO NOT FORGET TO: $canc"
echo " * Backup bookmarks"
echo " * Publish unpublished commits"
echo " * Check if everything is backed up"

while true; do
  echo -e "\e[1m"
  read -p "Do you want to proceed? (y\n) " yn

  echo -e "\e[0m"
  case $yn in 
	  y ) 
		  break;;
	  n ) 
		  exit;;
  	* ) 
  esac
done

# Script actually doing crap #################################

echo ""
echo "----------------------------------------"
echo ""
sleep 0.5

if [ -d "$destination" ]; then 
    
    # Backing up private key
    gpg -o $destination/private-key.gpg --export-options backup --export-secret-keys $pmail

    # Copying files
    cp -rvp $dir1 $dir2 $dir3 $dir4 $dir5 $dir6 $dir7 $dir8 $dir9 $dir10 $destination
    cp -v $fil1 $fil2 $fil3 $fil4 $fil5 $destination

    echo -e "$magentabold"
    echo -e "The script has finished! $canc"
    echo " "

  else
    echo -e "$redbold"
    echo -e "Destination directory does not exist!$canc"
    echo " "
  
    

fi



