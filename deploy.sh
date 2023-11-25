#!/bin/bash

ln -sfn $(pwd)/.gitconfig ~/.gitconfig
ln -sfn $(pwd)/.tmux.conf ~/.tmux.conf
ln -sfn $(pwd)/.zshenv ~/.zshenv
ln -sfn $(pwd)/.zshrc ~/.zshrc
mkdir -p ~/.config/nvim
ln -sfn $(pwd)/init.lua ~/.config/nvim/init.lua
ln -sfn $(pwd)/lua ~/.config/nvim/lua
