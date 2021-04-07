#!/bin/bash

cd ~
ln -s ~/dotfiles/vim/.vimrc
ln -s ~/dotfiles/git/.gitconfig
ln -s ~/dotfiles/git/.gitignore
ln -s ~/dotfiles/zsh/.zshrc

cd ~/.config
ln -s ~/dotfiles/fish
ln -s ~/dotfiles/starship.toml

