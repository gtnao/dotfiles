# +----------------------------------------------------------+
# | zinit                                                    |
# +----------------------------------------------------------+
# https://github.com/zdharma-continuum/zinit?tab=readme-ov-file#manual
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# +----------------------------------------------------------+
# | Plugins                                                  |
# +----------------------------------------------------------+
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light zdharma/history-search-multi-word

# Load starship theme
# line 1: `starship` binary as command, from github release
# line 2: starship setup at clone(create init.zsh, completion)
# line 3: pull behavior same as clone, source init.zsh
zinit ice as"command" from"gh-r" \
          atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
          atpull"%atclone" src"init.zsh"
zinit light starship/starship

# +----------------------------------------------------------+
# | Base                                                     |
# +----------------------------------------------------------+

# ++ History +---------------------------------------------------------+
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=100000
HISTORY_IGNORE="(ls|cd|pwd|zsh|exit|cd ..)"

bindkey -e

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
# autoload -Uz compinit && compinit

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
