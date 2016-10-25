#!/bin/sh

# install scripts
copyToUserHome(){

  # make a directory if not exist
  DIRECTORY=/home/$USER/.ubuntu-500px-wallpaper
  if [ ! -d "$DIRECTORY" ]; then
    mkdir $DIRECTORY
  fi

  # make the directory executable
  chmod +x /home/$USER/.ubuntu-500px-wallpaper/

  # copy the directory to home as hidden directory
  # cp -r . /home/$USER/.ubuntu-500px-wallpaper/

  # copy essential files to home directory for future use
  cp wallpaper-manager.sh $DIRECTORY/
  cp storage.txt $DIRECTORY/
  cp wallpaper.jpg $DIRECTORY/

  # create wallpaper directory
  WALLPAPER_DIR=/home/$USER/Pictures/ubuntu-500px-wallpaper
  if [ ! -d "$WALLPAPER_DIR" ]; then
    mkdir $WALLPAPER_DIR
    chmod +x $WALLPAPER_DIR
  fi
  # install first time
  . ./wallpaper-manager.sh
}
# sudo update-rc.d writer.sh defaults


# ask confiuration from USER
read -p "Do you wish to install$1?" yn
case $yn in
    [Yy]* ) copyToUserHome; break;;
    [Nn]* ) return 1; break;;
    * ) return 0;;
esac
