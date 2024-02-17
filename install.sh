#!/bin/bash

set -eu

DOTFILES_PARENT_DIR="${HOME}/dev/src/github.com/gtnao0219"
DOTFILES_DIR="${DOTFILES_PARENT_DIR}/dotfiles"

sudo apt update
sudo apt -y upgrade

sudo apt -y install git
mkdir -p "${DOTFILES_PARENT_DIR}"
git clone https://github.com/gtnao0219/dotfiles.git "${DOTFILES_DIR}"
cd "${DOTFILES_DIR}"

sudo apt -y install software-properties-common
sudo apt-add-repository -y --update ppa:ansible/ansible
sudo apt -y install ansible
ansible-playbook -v ansible/setup.yml

git remote set-url origin git@github.com:gtnao0219/dotfiles.git

./deploy.sh
