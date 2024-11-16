#!/bin/bash

set -eu

ln -sfn "$(pwd)/.gitconfig" ~/.gitconfig
ln -sfn "$(pwd)/.tmux.conf" ~/.tmux.conf
ln -sfn "$(pwd)/.zshenv" ~/.zshenv
ln -sfn "$(pwd)/.zshrc" ~/.zshrc
ln -sfn "$(pwd)/.config/git" ~/.config/git
ln -sfn "$(pwd)/.config/nvim" ~/.config/nvim
ln -sfn "$(pwd)/.config/starship.toml" ~/.config/starship.toml
ln -sfn "$(pwd)/.config/wezterm" ~/.config/wezterm
ln -sfn "$(pwd)/.config/zsh" ~/.config/zsh
