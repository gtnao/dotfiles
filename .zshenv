# +----------------------------------------------------------+
# | PATH                                                     |
# +----------------------------------------------------------+
typeset -gx -U path
path=(
  ~/bin(N-/)
  /usr/local/bin(N-/)
  /usr/local/go/bin(N-/)
  "$path[@]"
)


# +----------------------------------------------------------+
# | Languages                                                |
# +----------------------------------------------------------+

# ++ asdf +------------------------------------------------------------+
if [[ -f "${HOME}/.asdf/asdf.sh" ]]; then
  . "${HOME}/.asdf/asdf.sh"
fi

# ++ Rust +------------------------------------------------------------+
if [[ -f "${HOME}/.cargo/env" ]]; then
  . "${HOME}/.cargo/env"
fi

# ++ Golang +----------------------------------------------------------+
export GOPATH="${HOME}/dev"
export GOBIN="${GOPATH}/bin"
if [[ -d "${GOPATH}/bin" ]]; then
  path+=("${GOPATH}/bin")
fi

export GPG_TTY=$(tty)

# The next line updates PATH for the Google Cloud SDK.
if [ -f "${HOME}/google-cloud-sdk/path.zsh.inc" ]; then . "${HOME}/google-cloud-sdk/path.zsh.inc"; fi
