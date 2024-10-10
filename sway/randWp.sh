# This script changes your wallpaper from a selection in ~/Downloads/wallpapers on startup


#!/bin/sh
cd ~/Downloads/wallpapers/
amount=$(ls | wc -l)
randWp=$(shuf -i 1-$amount -n 1)
echo $wallpaper
swaymsg output "*" bg "$PWD/$wallpaper" fill
