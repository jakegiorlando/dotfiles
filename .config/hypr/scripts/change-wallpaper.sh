#!/bin/bash

WALLPAPER_DIRECTORY=~/src/dharmx/walls/minimal

# pick a random wallpaper, excluding README.md
WALLPAPER=$(find "$WALLPAPER_DIRECTORY" -type f ! -name 'README.md' | shuf -n 1)

# preload the wallpaper once
hyprctl hyprpaper preload "$WALLPAPER"

# loop through each active monitor and set wallpaper
for MONITOR in $(hyprctl monitors | awk '/Monitor/ {print $2}'); do
    hyprctl hyprpaper wallpaper "$MONITOR,$WALLPAPER"
done

sleep 1

# unload unused wallpapers
hyprctl hyprpaper unload unused

