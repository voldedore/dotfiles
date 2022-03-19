#!/bin/sh

echo "Disabling HiDPI"
xfconf-query -c xfwm4 -p /general/theme -s Default
xfconf-query -c xsettings -p /Xft/DPI -s 96

echo "Done!"

