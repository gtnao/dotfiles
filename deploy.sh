#!/bin/bash

set -eu

ln -sfn "$(pwd)/.gitconfig" ~/.gitconfig
ln -sfn "$(pwd)/.zshenv" ~/.zshenv
ln -sfn "$(pwd)/.zshrc" ~/.zshrc
ln -sfn "$(pwd)/.tmux.conf" ~/.tmux.conf
mkdir -p ~/.config/nvim
ln -sfn "$(pwd)/init.lua" ~/.config/nvim/init.lua
ln -sfn "$(pwd)/lua" ~/.config/nvim/lua
ln -sfn "$(pwd)/luasnip" ~/.config/nvim/luasnip
ln -sfn "$(pwd)/.tool-versions" ~/.tool-versions
