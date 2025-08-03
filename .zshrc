#color
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

export EDITOR='vim'
export VISUAL='vim'

# Get the aliases and functions
#if [ -f ~/.zsh_aliases ]; then
#	source ~/.zsh_aliases
#fi


if [ -f ${HOME}/Code/jakegiorlando/dotfiles/.mac_aliases ]; then
	. ${HOME}/Code/jakegiorlando/dotfiles/.mac_aliases
fi

if [ -f ${HOME}/.bsshrc ]; then
	. ${HOME}/.bsshrc
fi

if [ -d "${HOME}/bin" ] ; then
        PATH="${HOME}/bin:$PATH"
fi

if [ -d ${HOME}/Code/jakegiorlando/mac-scripts ]; then
        PATH="${HOME}/Code/jakegiorlando/mac-scripts:$PATH"
fi

if [ -d ${HOME}/Code/jakegiorlando/bin ]; then
        PATH="${HOME}/Code/jakegiorlando/bin:$PATH"
fi

if [ -d ${HOME}/Code/jakegiorlando/sbin ]; then
        PATH="${HOME}/Code/jakegiorlando/sbin:$PATH"
fi

setopt share_history
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

# Added by LM Studio CLI (lms)
export PATH="$PATH:${HOME}/.lmstudio/bin"

fpath=(~/.zfunc $fpath)

autoload -Uz compinit
compinit

export PATH="/opt/homebrew/opt/rustup/bin:$PATH"
