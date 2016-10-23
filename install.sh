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
