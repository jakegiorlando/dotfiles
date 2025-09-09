#color
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

export EDITOR='vim'
export VISUAL='vim'

GH_USERNAME="jakegiorlando"


# Get the aliases and functions
#if [ -f ~/.zsh_aliases ]; then
#	source ~/.zsh_aliases
#fi


if [ -f ${HOME}/Code/${GH_USERNAME}/dotfiles/.mac_aliases ]; then
	. ${HOME}/Code/${GH_USERNAME}/dotfiles/.mac_aliases
fi

if [ -f ${HOME}/.bsshrc ]; then
	. ${HOME}/.bsshrc
fi

if [ -d "${HOME}/bin" ] ; then
        PATH="${HOME}/bin:$PATH"
fi

if [ -d ${HOME}/Code/${GH_USERNAME}/mac-scripts ]; then
        PATH="${HOME}/Code/${GH_USERNAME}/mac-scripts:$PATH"
fi

if [ -d ${HOME}/Code/${GH_USERNAME}/bin ]; then
        PATH="${HOME}/Code/${GH_USERNAME}/bin:$PATH"
fi

if [ -d ${HOME}/Code/${GH_USERNAME}/sbin ]; then
        PATH="${HOME}/Code/${GH_USERNAME}/sbin:$PATH"
fi

setopt share_history
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

# Added by LM Studio CLI (lms)
export PATH="$PATH:${HOME}/.lmstudio/bin"

fpath=(~/.zfunc $fpath)

autoload -Uz compinit
compinit

export PATH="/opt/homebrew/opt/rustup/bin:$PATH"
