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

# gparted works with sudo
alias gparted='sudo -E gparted'

