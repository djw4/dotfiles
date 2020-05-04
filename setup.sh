#!/usr/bin/env sh

set -euo pipefail

if [ ! -d "${HOME}/.dotfiles" ]; then
  git clone git@github.com:djw4/dotfiles.git $HOME/.dotfiles
fi

if [ ! -d "${HOME}/.config" ]; then
  mkdir -v $HOME/.config
fi

#cp $HOME/.dotfiles/.zshrc $HOME/.zshrc && source $HOME/.zshrc
