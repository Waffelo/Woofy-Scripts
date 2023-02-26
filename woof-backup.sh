#!/bin/sh
# Made bloatedly to be easily customizable, I need to backup my files 
# often, and I change the things I backup often. Wuff!

# Private key
priv_key="contact@waffelo.net"

# Places where files will be copied to
destination_a="$BACKUP" #Main
destination_b="$BACKUP/.local"


# Files to copy
files_a=( "$HOME/.config" "$HOME/.minetest" "$HOME/.gnupg" "$HOME/.password-store" "$HOME/.ssh" "$HOME/.bashrc")
files_b=("$HOME/.local/usr" "$HOME/.local/bin")


# Colors
magentabold="\e[1;35m"
redbold="\e[1;31m"
canc="\e[0m"


printf "$magentabold
###################################
#          Woof ThinkPad          #
#          backup script          #
###################################$canc

This script creates a backup of my woof ThinkPad.
Please make sure you have set the correct directory 
variables in the script.
$redbold
Do not forget to:$canc
  * Backup bookmarks 
  * Publish commits that aren't pushed
  * Check if everything is backed up

"

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

echo "--------------------------------------"

function bkp_pkey {
  printf "\n$magentabold 
Exporting private key!
-----------------------------------------------$canc\n"

  gpg -o $destination/private-key.gpg --export-options backup --export-secret-keys $pmail
  

}

function copy_files {
  printf "\n$magentabold 
Copying files!
-----------------------------------------------$canc\n"
  
  mkdir -p $HOME/.local/

  echo -e "\n$magentabold# A -------$canc"
  cp -rvp ${files_a[*]} $destination_a
  echo -e "\n$magentabold# B -------$canc"
  cp -rvp ${files_b[*]} $destination_b

}



# Executing functions
copy_files
