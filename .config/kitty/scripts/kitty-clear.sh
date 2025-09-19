#!/bin/bash

# If inside tmux, just send Ctrl+L
if [ -n "$TMUX" ]; then
    printf "\x0c"
else
    # Outside tmux, clear terminal + scrollback, then send Ctrl+L
    printf "\033[3J\033c\x0c"
fi

