node: ## Install nodejs
	sudo apt -y install python3 g++ make python3-pip
	asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
	asdf install nodejs 20.11.1
	asdf global nodejs 20.11.1

rust: ## Install rust
	curl https://sh.rustup.rs -sSf | sh -s -- -y --no-modify-path

go: ## Install go
	wget https://go.dev/dl/go1.22.0.linux-amd64.tar.gz
	sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.22.0.linux-amd64.tar.gz

ruby: ## Install ruby
	sudo apt -y install autoconf patch build-essential rustc libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libgmp-dev libncurses5-dev libffi-dev libgdbm6 libgdbm-dev libdb-dev uuid-dev
	asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
	asdf install ruby 3.3.0
	asdf global ruby 3.3.0

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

# TODO:
# Install docker
# Install terraform
