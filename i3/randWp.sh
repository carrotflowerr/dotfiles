# This script changes your wallpaper from a selection in ~/Downloads/wallpapers on startup


#!/bin/sh
cd ~/Downloads/wallpapers/
amount=$(ls | wc -l)
randWp=$(shuf -i 1-$amount -n 1)
feh --no-fehbg --bg-center "$(ls | sed -n ${randWp}p)"
