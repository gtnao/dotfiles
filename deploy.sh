#!/bin/bash

set -eu

ln -sfn "$(pwd)/.gitconfig" ~/.gitconfig
ln -sfn "$(pwd)/.tmux.conf" ~/.tmux.conf
ln -sfn "$(pwd)/.zshenv" ~/.zshenv
ln -sfn "$(pwd)/.zshrc" ~/.zshrc
mkdir -p ~/.config/nvim
ln -sfn "$(pwd)/init.lua" ~/.config/nvim/init.lua
ln -sfn "$(pwd)/lua" ~/.config/nvim/lua
ln -sfn "$(pwd)/luasnip" ~/.config/nvim/luasnip
ln -sfn "$(pwd)/.config/git" ~/.config/git
ln -sfn "$(pwd)/.config/starship.toml" ~/.config/starship.toml
ln -sfn "$(pwd)/.config/wezterm" ~/.config/wezterm
ln -sfn "$(pwd)/.config/zsh" ~/.config/zsh
