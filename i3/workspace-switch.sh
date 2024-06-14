#!/bin/bash

current=$(i3-msg -t get_workspaces | jq '.[] | select(.focused==true).num')

if [[ $1 == "next" ]]; then
  next=$((current + 1))
else
  next=$((current - 1))
fi

i3-msg workspace number $next
