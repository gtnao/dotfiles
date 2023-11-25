alias ll="ls -lah"

setopt AUTO_CD
setopt EXTENDED_GLOB

autoload -Uz compinit
compinit

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

if which tmux >/dev/null 2>&1; then
  test -z "$TMUX" && (tmux attach || tmux new-session)
fi

[[ -f "$HOME/.asdf/asdf.sh" ]] && . $HOME/.asdf/asdf.sh

