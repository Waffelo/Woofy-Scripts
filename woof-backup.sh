#!/bin/sh
# Made bloatedly to be easily customizable, I need to backup my files 
# often, and I change the things I backup often. Wuff!

# Private key
priv_key="contact@waffelo.net"

# Places where files will be copied to
destination_a="$HOME/mnt/26-Feb-23" #Main
destination_b="$destination_a/.local"
destination_c="$destination_a/.local/share"

# Files to copy
files_a=( "$HOME/.config" "$HOME/.minetest" "$HOME/.gnupg" "$HOME/.password-store" "$HOME/.ssh" "$HOME/.texmf" "$HOME/.bashrc")
files_b=("$HOME/.local/usr" "$HOME/.local/bin" "$HOME/.local/src")
files_c=("$HOME/.local/share/fonts" "$HOME/.local/share/gajim")

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

  echo -e "\n$magentabold# Exporting private key .gpg -------$canc"
  gpg -o $destination_a/private-key.gpg --export-options backup --export-secret-keys $priv_key

  echo -e "\n$magentabold# Exporting private key .asc -------$canc"
  gpg -o $destination_a/private-key.asc --armor --export-options backup --export-secret-keys $priv_key
}

function copy_files {
  printf "\n$magentabold 
Copying files!
-----------------------------------------------$canc\n"
  
  mkdir -p $destination_b $destination_c

  echo -e "\n$magentabold# A -------$canc"
  #cp -rvp ${files_a[*]} $destination_a
  echo -e "\n$magentabold# B -------$canc"
  #cp -rvp ${files_b[*]} $destination_b
  echo -e "\n$magentabold# C -------$canc"
  cp -rvp ${files_c[1]}  $destination_c
}



# Executing functions
#bkp_pkey
copy_files

echo -e "\n$magentabold# The script has finished.$canc"
