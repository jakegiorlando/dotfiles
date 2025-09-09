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
export PATH

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

# git
GITDIR="${HOME}/src"
GITUSER="jakegiorlando"
if [ -d ${GITDIR}/${GITUSER}/bin ]; then
        export PATH="${GITDIR}/${GITUSER}/bin:$PATH"
fi

if [ -d ${GITDIR}/${GITUSER}/sbin ]; then
        export PATH="${GITDIR}/${GITUSER}/sbin:$PATH"
fi

if [ -d ${GITDIR}/${GITUSER}/scripts ]; then
        export PATH="${GITDIR}/${GITUSER}/scripts:$PATH"
fi
if [ -f ${GITDIR}/${GITUSER}/dotfiles/.bash_aliases ]; then
        . ${GITDIR}/${GITUSER}/dotfiles/.bash_aliases
fi


# use vim as default text editor
export EDITOR="vim"
export VISUAL="vim"

if [ -f ${HOME}/.bash_aliases ]; then
	. ${HOME}/.bash_aliases
fi

# bash completion
[[ -r /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion


# fix LESS command output so ANSI escape sequences pass through unscathed! makes git diff and git log look like they should!
export LESS="$LESS R"

# git bash prompt
if [ -f "${GITDIR}/magicmonty/bash-git-prompt/gitprompt.sh" ]; then
    GIT_PROMPT_ONLY_IN_REPO=1
    . ${GITDIR}/magicmonty/bash-git-prompt/gitprompt.sh
fi

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


# >>> persistent ssh-agent setup >>>
if [ -z "$SSH_AUTH_SOCK" ]; then
    eval "$(ssh-agent -s)" 1>/dev/null
fi

if [ -f "$HOME/scripts/add-id-to-agent.sh" ]; then
    "$HOME/scripts/add-id-to-agent.sh" 1>/dev/null
fi
# <<< persistent ssh-agent setup <<<

export GTK_THEME=Adwaita:dark

export GTK2_RC_FILES=/usr/share/themes/Adwaita-dark/gtk-2.0/gtkrc

export QT_STYLE_OVERRIDE=Adwaita-Dark


# tat: tmux attach
function tat {
  name=$(basename `pwd` | sed -e 's/\.//g')

  if tmux ls 2>&1 | grep "$name"; then
    tmux attach -t "$name"
  elif [ -f .envrc ]; then
    direnv exec / tmux new-session -s "$name"
  else
    tmux new-session -s "$name"
  fi
}
