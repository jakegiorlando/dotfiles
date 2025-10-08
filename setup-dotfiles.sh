#!/bin/bash
set -euo pipefail

TEMPLATE_DIR="$HOME/src/jakegiorlando/dotfiles/templates"

check_and_copy() {
    local cmd="$1"
    local template="$2"
    local target="$3"

    if command -v "$cmd" &>/dev/null; then
        if [[ -f "$target" ]]; then
            if cmp -s "$template" "$target"; then
                echo "$(basename "$target") already set"
            else
                mv "$target" "${target}.local"
                cp "$template" "$target"
                echo "$(basename "$target") updated (old saved as $(basename "${target}.local"))"
            fi
        else
            cp "$template" "$target"
            echo "$(basename "$target") set"
        fi
    fi
}

check_and_copy bash "$TEMPLATE_DIR/bashrc" "$HOME/.bashrc"
check_and_copy gvim "$TEMPLATE_DIR/gvim" "$HOME/.gvimrc"
check_and_copy tmux "$TEMPLATE_DIR/tmux" "$HOME/.tmux.conf"
check_and_copy vim "$TEMPLATE_DIR/vim" "$HOME/.vimrc"

