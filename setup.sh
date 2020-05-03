#!/usr/bin/env sh

[ ! -d $HOME/.dotfiles ] && git clone git@github.com:djw4/dotfiles.git $HOME/.dotfiles && $HOME/.dotfiles

cp .zshrc $HOME/.zshrc && source $HOME/.zshrc
