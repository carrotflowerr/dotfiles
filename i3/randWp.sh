# This script changes your wallpaper from a selection in ~/Downloads/wallpapers on startup

#!/bin/sh

echo "killing swaybg..."
killall swaybg

echo "setting new wallpaper..."
cd ~/Downloads/wallpapers/
amount=$(ls | wc -l)
randWp=$(shuf -i 1-$amount -n 1)
#echo $randWp
#echo "$(ls | sed -n ${randWp}p)"
swaybg -i "$(ls | sed -n ${randWp}p)" -m fill
