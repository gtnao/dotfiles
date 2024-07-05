SHELL := /usr/bin/zsh

node: ## Install nodejs
	sudo apt -y install python3 g++ make python3-pip
	asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
	asdf install nodejs 20.11.1
	asdf global nodejs 20.11.1

rust: ## Install rust
	curl https://sh.rustup.rs -sSf | sh -s -- -y --no-modify-path

go: ## Install go
	wget https://go.dev/dl/go1.22.0.linux-amd64.tar.gz
	sudo rm -rf /usr/local/go
	sudo tar -C /usr/local -xzf go1.22.0.linux-amd64.tar.gz
	rm go1.22.0.linux-amd64.tar.gz*
	source ~/.zshenv

go_tools: go ## Install ghq, peco 
	go install github.com/x-motemen/ghq@latest
	sudo apt -y install peco

ruby: ## Install ruby
	sudo apt -y install autoconf patch build-essential rustc libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libgmp-dev libncurses5-dev libffi-dev libgdbm6 libgdbm-dev libdb-dev uuid-dev
	asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
	asdf install ruby 3.0.6
	asdf global ruby 3.0.6

python: ## Install python
	sudo apt -y install build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev curl libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
	asdf plugin add python https://github.com/asdf-community/asdf-python.git
	asdf install python 3.12.2
	asdf global python 3.12.2

java: ## Install java
	sudo apt -y install coreutils curl unzip jq
	asdf plugin-add java https://github.com/halcyon/asdf-java.git
	asdf install java temurin-21.0.2+13.0.LTS
	asdf global java temurin-21.0.2+13.0.LTS

docker:
	sudo apt-get install ca-certificates curl
	sudo install -m 0755 -d /etc/apt/keyrings
	sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
	sudo chmod a+r /etc/apt/keyrings/docker.asc

  # Replace jammy.
	echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu jammy stable" sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
	sudo apt-get update

	sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

misc:
	asdf plugin add 1password-cli https://github.com/NeoHsu/asdf-1password-cli.git
	asdf install 1password-cli 2.29.0
	asdf global 1password-cli 2.29.0


# TODO:
# Install docker
# Install terraform
