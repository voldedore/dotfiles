#!/bin/sh

echo "Enabling HiDPI on hi-res monitors"
xfconf-query -c xfwm4 -p /general/theme -s Default-xhdpi
xfconf-query -c xsettings -p /Xft/DPI -s 128

echo "Done!"

