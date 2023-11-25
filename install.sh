#!/bin/bash

set -eu

wget "https://github.com/gtnao0219/dotfiles/archive/refs/heads/main.tar.gz"
tar -zxvf master.tar.gz
rm -f master.tar.gz
mkdir -p "$HOME/dev/src/github.com/gtnao0219"
mv -f dotfiles-master "$HOME/dev/src/github.com/gtnao0219/dotfiles"

cd "$HOME/dev/src/github.com/gtnao0219/dotfiles"
sudo apt update
sudo apt -y upgrade
sudo apt install software-properties-common
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt -y install ansible
ansible-playbook -v ansible/setup.yml
./deploy.sh
