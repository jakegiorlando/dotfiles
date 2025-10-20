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
GITDIR="${HOME}/src"
GITUSER="jakegiorlando"
[[ -d $GITDIR/$GITUSER/bin ]] && PATH="$GITDIR/$GITUSER/bin:$PATH"
[[ -d $GITDIR/$GITUSER/sbin ]] && PATH="$GITDIR/$GITUSER/sbin:$PATH"
[[ -d $GITDIR/$GITUSER/scripts ]] && PATH="$GITDIR/$GITUSER/scripts:$PATH"

###################
### ENVIRONMENT ###
###################

# Default editor
export EDITOR="vim"
export VISUAL="vim"

# Pager settings (optional)
# export SYSTEMD_PAGER=

# Git prompt
[[ -f "$GITDIR/magicmonty/bash-git-prompt/gitprompt.sh" ]] && GIT_PROMPT_ONLY_IN_REPO=1 && . "$GITDIR/magicmonty/bash-git-prompt/gitprompt.sh"

# GTK/QT themes
export GTK_THEME=Adwaita:dark
export GTK2_RC_FILES=/usr/share/themes/Adwaita-dark/gtk-2.0/gtkrc
export QT_STYLE_OVERRIDE=Adwaita-Dark

# LESS with ANSI colors and don't quit on scroll/arrow keys
export LESS="$LESS -R -+E"

# SSH agent
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

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
[[ -f $GITDIR/$GITUSER/dotfiles/.bash_aliases ]] && . "$GITDIR/$GITUSER/dotfiles/.bash_aliases"
[[ -f ~/.bashrc.local ]] && . ~/.bashrc.local

#########################
### FINAL PATH EXPORT ###
#########################

export PATH

