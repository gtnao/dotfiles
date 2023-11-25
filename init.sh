#!/bin/bash

sudo apt update
sudo apt -y upgrade

sudo apt install software-properties-common
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt -y install ansible
ansible-playbook -v ansible/setup.yml
