#!/bin/sh

# install scripts
copyToUserHome(){

  # copy the directory to home as hidden directory
  cp -r . /home/$USER/.ubuntu-500px-wallpaper/

  # make the directory executable
  chmod +x /home/$USER/.ubuntu-500px-wallpaper/

  # install first time
  . ./wallpaper-manager.sh
}


# ask confiuration from USER
read -p "Do you wish to install$1?" yn
case $yn in
    [Yy]* ) copyToUserHome; break;;
    [Nn]* ) return 1; break;;
    * ) return 0;;
esac

# store multiple wallpaper (future...:p )

# [ ! -f /home/$USER/Pictures/ubuntu-500px-wallpaper/.jpg ] && echo "Found" || echo "Not found"

# search_dir=/home/$USER/Pictures/ubuntu-500px-wallpaper
# for file in "$search_dir"/*
# do
#   echo "${file##*/}"
# done
#
# fileUID() {
#   date +"%g-%m-%d-%H-%M-%S-%N"
# }
# timestamp

# setDefaultWallpaper(){
#   [ ! -f /home/$USER/Pictures/ubuntu-500px-wallpaper/.jpg ] && cp wallpaper.png /home/$USER/Pictures/ubuntu-500px-wallpaper
# }

# setDefaultWallpaper
