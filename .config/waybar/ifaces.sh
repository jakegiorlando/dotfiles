#!/bin/bash
# Show active interfaces and their IPv4 addresses like: wlan0: 192.168.1.100/24 eth0: 10.0.0.5/24

# get list of UP interfaces that have an IPv4
mapfile -t lines < <(ip -o -4 addr show up 2>/dev/null)

# if none, say Disconnected
if [ ${#lines[@]} -eq 0 ]; then
  echo "Disconnected"
  exit 0
fi

# build "ifname: ip/prefix" pairs
out=""
for line in "${lines[@]}"; do
  # extract interface and addr/prefix
  # example: 2: wlan0    inet 192.168.1.100/24 brd 192.168.1.255 scope global dynamic noprefixroute wlan0
  ifname=$(awk '{print $2}' <<< "$line")
  cidr=$(awk '{print $4}' <<< "$line")
  # append
  if [ -n "$out" ]; then
    out="$out "
  fi
  out="$out$ifname: $cidr"
done

echo "$out"
