#!/bin/bash
# Simple PulseAudio/PipeWire dropdown menu for Waybar via wofi

# Requires: pactl, wofi
# Shows: volume up/down, mute, pick output sink, pick input source, open pavucontrol

set -euo pipefail

# Build menu items
CURRENT_SINK="$(pactl get-default-sink || true)"
CURRENT_SOURCE="$(pactl get-default-source || true)"

VOL_RAW="$(pactl get-sink-volume @DEFAULT_SINK@ | awk 'NR==1{print $5}')"
MUTED="$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')"

HEADER="Volume: ${VOL_RAW}  Mute: ${MUTED}"
ITEMS=$(
  printf "%s\n" \
    "🔇 Toggle Mute" \
    "🔉 -5%" \
    "🔊 +5%" \
    "— Outputs —" \
    "$(pactl list short sinks | awk -v cur="$CURRENT_SINK" '
      {id=$1;name=$2; mark=(name==cur)?"[●]":"[ ]"; print "→ "mark" "id" "name }')" \
    "— Inputs —" \
    "$(pactl list short sources | awk -v cur="$CURRENT_SOURCE" '
      $2 !~ /\.monitor$/ {id=$1;name=$2; mark=(name==cur)?"[●]":"[ ]"; print "→ "mark" "id" "name }')" \
    "Open pavucontrol"
)

# Show menu
SELECTION="$(printf "%s\n%s\n" "$HEADER" "$ITEMS" | wofi --dmenu --prompt='Audio' --insensitive --cache-file=/dev/null)"

# No choice
[ -z "${SELECTION:-}" ] && exit 0

# Act on choice
case "$SELECTION" in
  "🔇 Toggle Mute")
    pactl set-sink-mute @DEFAULT_SINK@ toggle
    ;;
  "🔉 -5%")
    pactl set-sink-volume @DEFAULT_SINK@ -5%
    ;;
  "🔊 +5%")
    pactl set-sink-volume @DEFAULT_SINK@ +5%
    ;;
  "Open pavucontrol")
    command -v pavucontrol >/dev/null && pavucontrol &
    ;;
  *)
    if echo "$SELECTION" | grep -q "^→ \[.*\] "; then
      ID="$(echo "$SELECTION" | awk '{print $3}')"
      NAME="$(echo "$SELECTION" | awk '{print $4}')"
      if pactl list short sinks | awk '{print $1}' | grep -qx "$ID"; then
        pactl set-default-sink "$NAME"
        pactl list short sink-inputs | awk '{print $1}' | xargs -r -n1 pactl move-sink-input -- "$NAME"
      elif pactl list short sources | awk '{print $1}' | grep -qx "$ID"; then
        pactl set-default-source "$NAME"
      fi
    fi
    ;;
esac

