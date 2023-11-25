alias ll="ls -lah"

setopt AUTO_CD
setopt EXTENDED_GLOB

autoload -Uz compinit
compinit

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

[[ -f "$HOME/.asdf/asdf.sh" ]] && . $HOME/.asdf/asdf.sh
