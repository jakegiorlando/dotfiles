#!/bin/bash
bash --version &>/dev/null && cp ~/src/jakegiorlando/dotfiles/templates/bashrc ~/.bashrc && echo ".bashrc set"
gvim --version &>/dev/null && cp ~/src/jakegiorlando/dotfiles/templates/gvim ~/.gvimrc && echo ".gvimrc set"
tmux -V &>/dev/null && cp ~/src/jakegiorlando/dotfiles/templates/tmux ~/.tmux.conf && echo ".tmux.conf set"
vim --version &>/dev/null && cp ~/src/jakegiorlando/dotfiles/templates/vim ~/.vimrc && echo ".vimrc set"
