#!/bin/bash

if pgrep -x "hyprlock" >/dev/null; then
	sleep 0.05
	hyprctl dispatch dpms off
	brightnessctl -sd *::kbd_backlight set 0
else
	true
fi
