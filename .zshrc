# +----------------------------------------------------------+
# | Base                                                     |
# +----------------------------------------------------------+

# ++ History +---------------------------------------------------------+
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=100000
HISTORY_IGNORE="(ls|cd|pwd|zsh|exit|cd ..)"

# +----------------------------------------------------------+
# | Options                                                  |
# +----------------------------------------------------------+
setopt AUTO_CD
setopt EXTENDED_GLOB
setopt SHARE_HISTORY 

# +----------------------------------------------------------+
# | Autoload                                                 |
# +----------------------------------------------------------+
autoload -Uz colors && colors
autoload -Uz compinit && compinit

# +----------------------------------------------------------+
# | Alias                                                    |
# +----------------------------------------------------------+
alias ls="ls -alh --color=auto"
alias cp="cp -irf"
alias mv="mv -i"
alias mkdir="mkdir -p"
alias ..="cd .."
if command -v nvim >/dev/null 2>&1; then
  export EDITOR=nvim
  alias vim="nvim"
  alias vi="nvim"
  alias v="nvim"
fi

# +----------------------------------------------------------+
# | Tmux                                                     |
# +----------------------------------------------------------+
if which tmux >/dev/null 2>&1; then
  test -z "${TMUX}" && (tmux attach || tmux new-session)
fi
