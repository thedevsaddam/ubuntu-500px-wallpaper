#!/bin/bash

### BEGIN INIT INFO
# Provides:          Ubuntu-500px-wallpaper
# Required-Start:    $local_fs $network
# Required-Stop:     $local_fs
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Start ubuntu-500px-wallpaper at boot time
# Description:       Start ubuntu-500px-wallpaper at boot time
### END INIT INFO


date > /root/disk_space_report.txt
du -sh /home/ >> /root/disk_space_report.txt
