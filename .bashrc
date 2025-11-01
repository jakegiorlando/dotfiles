# ~/src/jakegiorlando/dotfiles/.bashrc

##########################
### GLOBAL DEFINITIONS ###
##########################

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
elif [ -f /etc/bash.bashrc ]; then
    . /etc/bash.bashrc
fi

# bash completion
[[ -r /usr/share/bash-completion/bash_completion ]] && . /usr/share/bash-completion/bash_completion

##########################
### PATH CONFIGURATION ###
##########################

# User specific PATH additions
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi

# Git-related paths
GIT_DIR="${HOME}/git/github.com"
GIT_USR="jakegiorlando"
[[ -d ${GIT_DIR}/${GIT_USR}/bin ]] && PATH="${GIT_DIR}/${GIT_USR}/bin:$PATH"
[[ -d ${GIT_DIR}/${GIT_USR}/sbin ]] && PATH="${GIT_DIR}/${GIT_USR}/sbin:$PATH"
[[ -d ${GIT_DIR}/${GIT_USR}/scripts ]] && PATH="${GIT_DIR}/${GIT_USR}/scripts:$PATH"

###################
### ENVIRONMENT ###
###################

# Default editor
export EDITOR="vim"
export VISUAL="vim"

# Pager settings (optional)
# export SYSTEMD_PAGER=

# Git prompt
[[ -f "${GIT_DIR}/magicmonty/bash-git-prompt/gitprompt.sh" ]] && GIT_PROMPT_ONLY_IN_REPO=1 && . ${GIT_DIR}/magicmonty/bash-git-prompt/gitprompt.sh

# GTK/QT themes
export GTK_THEME=Adwaita:dark
export GTK2_RC_FILES=/usr/share/themes/Adwaita-dark/gtk-2.0/gtkrc
export QT_STYLE_OVERRIDE=Adwaita-Dark

# LESS with ANSI colors (-R), don't quit when you reach the bottom (-+E), and start printing from the top (-c)
export LESS="${LESS} -R -+E -c"

# SSH agent
export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/ssh-agent.socket"

# ssh-tpm-agent (optional)
# export SSH_AUTH_SOCK="$(ssh-tpm-agent --print-socket)"

##############
### PROMPT ###
##############

PS1='[\u@\h \w]\$ '

###############
### ALIASES ###
###############

alias egrep='grep -E --color=auto'
alias fgrep='grep -F --color=auto'
alias grep='grep --color=auto'
if ip --color=auto -V > /dev/null 2>/dev/null ; then
    alias ip='ip --color=auto'
fi
alias ls='ls --color=auto'

###########################
### USER CUSTOM SOURCES ###
###########################

# Source per-file configs
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

[[ -f ${HOME}/.bash_aliases ]] && . ${HOME}/.bash_aliases
[[ -f ${GIT_DIR}/${GIT_USR}/dotfiles/.bash_aliases ]] && . ${GIT_DIR}/${GIT_USR}/dotfiles/.bash_aliases
[[ -f ~/.bashrc.local ]] && . ~/.bashrc.local

#########################
### FINAL PATH EXPORT ###
#########################

export PATH

