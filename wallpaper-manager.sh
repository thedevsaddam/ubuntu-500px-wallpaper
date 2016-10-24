#!/bin/sh

# make a directory if not exist
makeDir(){
  DIRECTORY=/home/$USER/Pictures/ubuntu-500px-wallpaper
  if [ ! -d "$DIRECTORY" ]; then
    mkdir DIRECTORY
  fi
}


# download wallpaper from 500px rss feed
downloadWallpaper(){
  # 500px popular feed url
  # https://support.500px.com/hc/en-us/articles/204910987-What-RSS-feeds-are-available-
  FEED_URL="https://500px.com/search.rss?q=hills-beach&type=photos&categories=Nature&sort=newest"

  # fetch feed list from 500px and store in a text file
  curl -s "$FEED_URL"|grep "<media:content"|awk -Furl'=\"' '{print $2}'|awk -F'"' '{print $1}'> storage.txt

  # max line in storage file
  MAX=$(cat storage.txt | wc -l)

  # getting the image url from index
  IMG=`cat storage.txt|tail -n +$(awk -v min=1 -v max=$MAX 'BEGIN{srand(); print int(min+rand()*(max-min+1))}')|head -n 1`

  # getting image data from url
  curl $IMG -o /home/$USER/Pictures/ubuntu-500px-wallpaper/wallpaper.jpg

  WIDTH=$(identify -format "%w"  /home/$USER/Pictures/ubuntu-500px-wallpaper/wallpaper.jpg)
  HEIGHT=$(identify -format "%h"  /home/$USER/Pictures/ubuntu-500px-wallpaper/wallpaper.jpg)
  if [ ! $HEIGHT -ge 600 ] && [ ! $WIDTH -ge 900 ]; then
    downloadWallpaper
    break
  fi

}

# set wallpaper
setWallpaper(){
  gsettings set org.gnome.desktop.background picture-uri file:///home/thedevsaddam/Pictures/ubuntu-500px-wallpaper/wallpaper.jpg
}


# set default wallpaper
setDefaultWallpaper(){
  [ ! -f /home/$USER/Pictures/ubuntu-500px-wallpaper/wallpaper.jpg ] && cp wallpaper.jpg /home/$USER/Pictures/ubuntu-500px-wallpaper && setWallpaper
}

#download the last photo if internet connection is ok
if ping -q -c 1 -W 1 8.8.8.8 >/dev/null; then
  makeDir
  downloadWallpaper
  setWallpaper
else
  # if no internet connection available then use default numix wallpaper
  setDefaultWallpaper
fi
