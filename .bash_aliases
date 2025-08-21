# sudo works with aliases
alias sudo='sudo '

# output file without comments
sc() {
	grep ^[^#] $1
}

# netcat udp hostname port
alias nc-u='nc -u -zv'

# netcat tcp hostname port
alias nc-t='nc -t -zv'

# cd into git directory
alias cdgit='cd ~/src'

# turn laptop display on
alias laptop-on='hyprctl keyword monitor "eDP-1,preferred,auto,1.5"'

# turn laptop display off
alias laptop-off='hyprctl keyword monitor "eDP-1,disable"'
