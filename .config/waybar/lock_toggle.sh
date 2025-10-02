#!/bin/bash

STATE_FILE="$HOME/.cache/lockmode.state"

if [ ! -f "$STATE_FILE" ]; then
    echo "normal" > "$STATE_FILE"
fi

STATE=$(cat "$STATE_FILE")

if [[ "$STATE" == "normal" ]]; then
    # Disable DPMS + Hyprland idle lock
    xset s off -dpms
    hyprctl keyword misc:disable_screensaver true
    echo "unlimited" > "$STATE_FILE"
    notify-send "Screen Lock" "Unlimited mode enabled"
else
    # Restore normal behavior
    xset s on +dpms
    hyprctl keyword misc:disable_screensaver false
    echo "normal" > "$STATE_FILE"
    notify-send "Screen Lock" "Normal lock mode restored"
fi

