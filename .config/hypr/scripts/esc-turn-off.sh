#!/bin/bash

if pgrep -x "hyprlock" >/dev/null; then
	sleep 0.05; hyprctl dispatch dpms off
else
	true
fi
