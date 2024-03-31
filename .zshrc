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

zinit ice wait"1" lucid from"gh-r" as"program" pick"ripgrep*/rg"
zinit light @BurntSushi/ripgrep
zinit ice wait"1" lucid from"gh-r" as"program" pick"eza" atload"source ~/.config/zsh/plugins/eza_atload.zsh"
zinit light "eza-community/eza"
zinit ice wait'1' lucid from"gh-r" as"program" pick"bat*/bat" atload"source ~/.config/zsh/plugins/bat_atload.zsh"
zinit light @sharkdp/bat
zinit ice wait'1' lucid from"gh-r" as"program" pick"fd*/fd"
zinit light @sharkdp/fd

# +----------------------------------------------------------+
# | Base                                                     |
# +----------------------------------------------------------+

# ++ History +---------------------------------------------------------+
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=100000
HISTORY_IGNORE="(ls|cd|pwd|zsh|exit|cd ..|v|vi|vim|nvim|tig)"

# +----------------------------------------------------------+
# | Keybinds                                                 |
# +----------------------------------------------------------+
bindkey -e

_peco-src() {
  local selected_dir=$(ghq list -p | peco --query "${LBUFFER}")
  if [ -n "${selected_dir}" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N _peco-src
bindkey '^]' _peco-src

# +----------------------------------------------------------+
# | Options                                                  |
# +----------------------------------------------------------+
setopt APPEND_HISTORY
setopt AUTO_CD
setopt EXTENDED_GLOB
setopt EXTENDED_HISTORY 
setopt HIST_IGNORE_ALL_DUPS 
setopt HIST_IGNORE_SPACE 
setopt HIST_NO_STORE 
setopt HIST_REDUCE_BLANKS 
setopt SHARE_HISTORY 

# +----------------------------------------------------------+
# | fpath                                                    |
# +----------------------------------------------------------+
# ++ asdf +------------------------------------------------------------+
if [[ -d "${HOME}/.asdf/completions" ]]; then
  fpath=("${HOME}/.asdf/completions" $fpath)
fi

# +----------------------------------------------------------+
# | Autoload                                                 |
# +----------------------------------------------------------+
fpath=("${HOME}/.asdf/completions" $fpath)
autoload -Uz colors && colors
autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit

# +----------------------------------------------------------+
# | Completion                                               |
# +----------------------------------------------------------+
# ++ aws +-------------------------------------------------------------+
if [[ -e /usr/local/bin/aws_completer ]]; then
  complete -C '/usr/local/bin/aws_completer' aws
fi
if which saml2aws >/dev/null 2>&1; then
  eval "$(saml2aws --completion-script-zsh)"
fi
if which kubectl >/dev/null 2>&1; then
  source <(kubectl completion zsh)
fi

# +----------------------------------------------------------+
# | Alias                                                    |
# +----------------------------------------------------------+
alias ls="ls -alh --color=auto"
alias cp="cp -irf"
alias mv="mv -i"
alias mkdir="mkdir -p"
alias history="history -d"
alias ..="cd .."
if which nvim >/dev/null 2>&1; then
  export EDITOR=nvim
  alias vim="nvim"
  alias vi="nvim"
  alias v="nvim"
fi
if which kubectl >/dev/null 2>&1; then
  alias k="kubectl"
fi

# +----------------------------------------------------------+
# | Tmux                                                     |
# +----------------------------------------------------------+
if which tmux >/dev/null 2>&1; then
  test -z "${TMUX}" && (tmux attach || tmux new-session)
fi
