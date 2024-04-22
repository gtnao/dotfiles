#!/bin/bash

set -eu

DOTFILES_PARENT_DIR="${HOME}/dev/src/github.com/gtnao"
DOTFILES_DIR="${DOTFILES_PARENT_DIR}/dotfiles"

# Check if Homebrew is installed
if ! command -v brew &>/dev/null; then
	echo "Homebrew is not installed. Installing Homebrew..."
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
	echo "Homebrew is already installed."
fi

# Add Homebrew initialization to .zprofile if not already added
if ! grep -q '/opt/homebrew/bin/brew shellenv' "$HOME/.zprofile"; then
	echo "Adding Homebrew initialization to .zprofile..."
	echo "eval \"$(/opt/homebrew/bin/brew shellenv)\"" >>"$HOME/.zprofile"
	eval "$(/opt/homebrew/bin/brew shellenv)"
else
	echo "Homebrew initialization is already added to .zprofile."
fi

# Download dotfiles repository
mkdir -p "${DOTFILES_PARENT_DIR}"
if [ ! -d "${DOTFILES_DIR}" ]; then
	git clone https://github.com/gtnao/dotfiles.git "${DOTFILES_DIR}"
	ln -sfn "${DOTFILES_DIR}/.gitconfig" ~/.gitconfig
fi
cd "${DOTFILES_DIR}"
git remote set-url origin git@github.com:gtnao/dotfiles.git

# Install by Brewfile
brew bundle install --file=Brewfile

# Install nodejs
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs 20.11.1
asdf global nodejs 20.11.1

# Generate ssh key
if [ ! -f "${HOME}/.ssh/id_rsa" ]; then
	ssh-keygen -t rsa -b 2048 -f "${HOME}/.ssh/id_rsa" -N ""
	chmod 0600 "${HOME}/.ssh/id_rsa"
	chmod 0644 "${HOME}/.ssh/id_rsa.pub"
fi

# deploy
# ./deploy.sh

# nvim setup
# nvim --headless "+Lazy! sync" +qa

echo "Please check your SSH public key with 'cat ~/.ssh/id_rsa.pub' and register it to your GitHub account if you haven't done so already."
