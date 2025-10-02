# ~/.bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
elif [ -f /etc/bash.bashrc ]; then
	. /etc/bash.bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
        for rc in ~/.bashrc.d/*; do
                if [ -f "$rc" ]; then
                        . "$rc"
                fi
        done
fi

unset rc

[[ -f ~/.bashrc.local ]] && . ~/.bashrc.local

[[ -f ${HOME}/.bash_aliases ]] && . ${HOME}/.bash_aliases

# git
GITDIR="${HOME}/src"
GITUSER="jakegiorlando"
[[ -d $GITDIR/$GITUSER/bin ]] && PATH="$GITDIR/$GITUSER/bin:$PATH"
[[ -d $GITDIR/$GITUSER/sbin ]] && PATH="$GITDIR/$GITUSER/sbin:$PATH"
[[ -d $GITDIR/$GITUSER/scripts ]] && PATH="$GITDIR/$GITUSER/scripts:$PATH"
[[ -f $GITDIR/$GITUSER/dotfiles/.bash_aliases ]] && . "$GITDIR/$GITUSER/dotfiles/.bash_aliases"
[[ -f "$GITDIR/magicmonty/bash-git-prompt/gitprompt.sh" ]] && GIT_PROMPT_ONLY_IN_REPO=1 && . "$GITDIR/magicmonty/bash-git-prompt/gitprompt.sh"

# use vim as default text editor
export EDITOR="vim"
export VISUAL="vim"

# bash completion
[[ -r /usr/share/bash-completion/bash_completion ]] && . /usr/share/bash-completion/bash_completion

# fix LESS command output so ANSI escape sequences pass through unscathed! makes git diff and git log look like they should!
export LESS="$LESS R"

alias egrep='grep -E --color=auto'
alias fgrep='grep -F --color=auto'
alias grep='grep --color=auto'
if ip --color=auto -V > /dev/null 2>/dev/null ; then
    alias ip='ip --color=auto'
fi

alias ls='ls --color=auto'

if grep -q "Arch Linux" /etc/os-release 2>/dev/null; then
    PS1='[\u@\h \w]\$ '
fi

export GTK_THEME=Adwaita:dark

export GTK2_RC_FILES=/usr/share/themes/Adwaita-dark/gtk-2.0/gtkrc

export QT_STYLE_OVERRIDE=Adwaita-Dark

# ssh-agent
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# ssh-tpm-agent
#export SSH_AUTH_SOCK="$(ssh-tpm-agent --print-socket)"

export PATH
