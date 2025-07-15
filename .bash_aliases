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

# view aliases
alias aliases='grep -Ev "^[[:space:]]*(#|$)" ~/.aliases'

# set vi and vim to nvim
alias vi='nvim'

alias vim='nvim'
