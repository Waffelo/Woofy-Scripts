#!/bin/sh
# Script that sets up my ThinkPad.
# Do not judge, you dinguses. Im learning mwwrr QwQ


magentabold="\e[1;35m"
redbold="\e[1;31m"
canc="\e[0m"

user="waffelo"
backup="$HOME/meow" #!!! Make sure NOT to add "/" to the end!!!

packages_tool=("xorg" "xorg-init" "sx" "htop" "mpd" "mpc" "trash-cli" "tlp" "exa" "ranger" "zathura" "pass" "gnupg" "neovim" "gajim" "librewolf-bin" "libreoffice" "gimp" "inkscape" "sxiv" "feh" "mpv" "calcurse" "keepassxc" "ncmpcpp" "cmus" "pulsemixer" "maim" "ffmpeg" "unrar-free" "unzip" "p7zip")


printf "$magentabold
#############################
#         Waffelo's         #
#     Post-Installation     #
#          script           #
#############################$canc

This script automates setting up my ThinkPad after
reinstallation of my operating system.
$magentabold
This script will:$canc
  * Install yay
  * Install packages
  * Move backed up files to proper directories
  * Build Suckless software
  * Install vim-plug
  * Fix Java applications in wmc
  * Add user to uucp group
$redbold
Make sure you:$canc
  * Have selected the correct directory
  * Have configured the script properly

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

function install_yay {
  printf "\n$magentabold 
Installing yay!
-----------------------------------------------$canc\n"
  cd
  sudo pacman -S --needed git base-devel
  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -si
  cd
  rm -rf yay
  echo " "
}

function install_packages {
  printf "\n$magentabold 
Installing packages!
-----------------------------------------------$canc\n"
  yay -S ${packages[*]}
}

function copy_files {
  printf "\n$magentabold 
Copying files!
-----------------------------------------------$canc\n"
  cp -rvp $backup/* $HOME
}

function install_suckless {
  printf "\n$magentabold 
Moving files!
-----------------------------------------------$canc\n"
  echo -e "\n$magentabold# DWM ------$canc"
  cd $HOME/.local/src/dwm/
  sudo make clean install
  echo -e "\n$magentabold# DWMBlocks ------$canc"
  cd $HOME/.local/src/dwmblocks/
  sudo make clean install
  echo -e "\n$magentabold# Slock ------$canc"
  cd $HOME/.local/src/slock/
  sudo make clean install
  echo -e "\n$magentabold# St ------$canc"
  cd $HOME/.local/src/st/
  sudo make clean install
  echo -e "\n$magentabold# DMenu ------$canc"
  cd $HOME/.local/src/dmenu/
  sudo make clean install
  cd
}

function install_vimplug {
  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
}

function fix_java_apps {
  wname LG3D

}

function usb_privs {
  sudo useradd -G uucp $user
}


# Executing functions
install_yay
install_packages
copy_files
install_suckless
install_vimplug
fix_java_apps
usb_privs
