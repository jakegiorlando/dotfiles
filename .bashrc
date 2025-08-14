# .bashrc

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

if [ -z "$SSH_AUTH_SOCK" ]; then
        eval "$(ssh-agent -s)" 1>/dev/null
fi

GITDIR="${HOME}/src"

if [ -f $HOME/scripts/add-id-to-agent.sh ]; then
        $HOME/scripts/add-id-to-agent.sh 1>/dev/null
fi

if [ -d ${GITDIR}/jakegiorlando/bin ]; then
        export PATH="${GITDIR}/jakegiorlando/bin:$PATH"
fi

if [ -d ${GITDIR}/jakegiorlando/sbin ]; then
        export PATH="${GITDIR}/jakegiorlando/sbin:$PATH"
fi

if [ -f ${GITDIR}/jakegiorlando/dotfiles/.bash_aliases ]; then
        . ${GITDIR}/jakegiorlando/dotfiles/.bash_aliases
fi

export EDITOR="nvim"
export VISUAL="nvim"

# bash completion
[[ -r /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion


# fix LESS command output so ANSI escape sequences pass through unscathed! makes git diff and git log look like they should!
export LESS="$LESS R"

# git bash prompt
if [ -f "${GITDIR}/magicmonty/bash-git-prompt/gitprompt.sh" ]; then
    GIT_PROMPT_ONLY_IN_REPO=1
    source ${GITDIR}/magicmonty/bash-git-prompt/gitprompt.sh
fi

