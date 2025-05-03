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
## Assuming in dotfiles folder
SetupBash() {
    SetupWithDelete ${PWD}/bash           ~/.config/bash
    SetupWithDelete ~/.config/bash/bashrc ~/.bashrc
}
################################################################################
## Assuming in dotfiles folder
SetupGit() {
    SetupWithDelete ${PWD}/git                     ~/.config/git
    SetupWithDelete ~/.config/git/gitconfig        ~/.gitconfig
    SetupWithDelete ~/.config/git/gitignore_global ~/.gitignore_global
}
################################################################################
SetupVim
SetupNeoVim
SetupTmux
SetupI3
SetupBash
SetupGit
################################################################################
