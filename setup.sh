#!/usr/bin/env bash
################################################################################
SetupWithDelete() {
    rm ${2}
    ln -s ${1} ${2}
}
################################################################################
## Assuming in dotfiles folder
SetupVim() {
    SetupWithDelete ${PWD}/vim          ~/.config/vim
    SetupWithDelete ~/.config/vim/      ~/.vim
    SetupWithDelete ~/.config/vim/vimrc ~/.vimrc
}
################################################################################
## Assuming in dotfiles folder
SetupNeoVim() {
    SetupWithDelete ${PWD}/nvim ~/.config/nvim
}
################################################################################
## Assuming in dotfiles folder
SetupTmux() {
    SetupWithDelete ${PWD}/tmux              ~/.config/tmux
    SetupWithDelete ~/.config/tmux/          ~/.tmux
    SetupWithDelete ~/.config/tmux/tmux.conf ~/.tmux.conf
}
################################################################################
## Assuming in dotfiles folder
SetupI3() {
    SetupWithDelete ${PWD}/i3 ~/.config/i3
}
################################################################################
SetupVim
SetupNeoVim
SetupTmux
SetupI3
################################################################################
