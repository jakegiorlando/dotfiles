#!/bin/bash
bash --version &>/dev/null && cp ~/src/jakegiorlando/dotfiles/.bashrc.template ~/.bashrc && echo ".bashrc set"
gvim --version &>/dev/null && cp ~/src/jakegiorlando/dotfiles/.gvimrc.template ~/.gvimrc && echo ".gvimrc set"
tmux -V &>/dev/null && cp ~/src/jakegiorlando/dotfiles/.tmux.conf.template ~/.tmux.conf && echo ".tmux.conf set"
vim --version &>/dev/null && cp ~/src/jakegiorlando/dotfiles/.vimrc.template ~/.vimrc && echo ".vimrc set"
