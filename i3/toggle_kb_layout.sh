
#!/bin/bash

CURRENT_LAYOUT=$(setxkbmap -query | grep variant | awk '{print $2}')

if [ "$CURRENT_LAYOUT" = "" ]; then
    setxkbmap -layout us dvorak
elif [ "$CURRENT_LAYOUT" = "dvorak" ]; then
    setxkbmap -layout us
fi
