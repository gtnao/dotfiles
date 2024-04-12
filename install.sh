#!/bin/bash

set -eu

DOTFILES_PARENT_DIR="${HOME}/dev/src/github.com/gtnao"
DOTFILES_DIR="${DOTFILES_PARENT_DIR}/dotfiles"

# apt update and upgrade
sudo apt update
sudo apt -y upgrade

# download dotfiles repository
sudo apt -y install git
mkdir -p "${DOTFILES_PARENT_DIR}"
if [ ! -d "${DOTFILES_DIR}" ]; then
	git clone https://github.com/gtnao/dotfiles.git "${DOTFILES_DIR}"
	ln -sfn "${DOTFILES_DIR}/.gitconfig" ~/.gitconfig
fi
cd "${DOTFILES_DIR}"
git remote set-url origin git@github.com:gtnao/dotfiles.git

# install core packages
sudo apt -y install build-essential unzip

# install nvim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
sudo mv nvim.appimage /usr/bin/nvim

# install zsh
sudo apt -y install zsh
sudo chsh "$USER" -s "$(which zsh)"
echo "zsh is now installed and set as the default shell. Please logout and log back in to apply the changes."

# install tmux
sudo apt -y install tmux

# install asdf
git clone https://github.com/asdf-vm/asdf.git "${HOME}/.asdf" --branch v0.14.0
. "${HOME}/.asdf/asdf.sh"
# install nodejs
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
sudo apt -y install python3 g++ make python3-pip
asdf install nodejs 20.11.1
asdf global nodejs 20.11.1

# generate ssh key
if [ ! -f "${HOME}/.ssh/id_rsa" ]; then
	ssh-keygen -t rsa -b 2048 -f "${HOME}/.ssh/id_rsa" -N ""
	chmod 0600 "${HOME}/.ssh/id_rsa"
	chmod 0644 "${HOME}/.ssh/id_rsa.pub"
fi
echo "Please check your SSH public key with 'cat ~/.ssh/id_rsa.pub' and register it to your GitHub account if you haven't done so already."

# deploy
./deploy.sh

# zsh
zsh

# nvim setup
nvim --headless "+Lazy! sync" +qa
