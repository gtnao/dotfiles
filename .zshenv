# Path
typeset -gx -U path
path=(
  ~/bin(N-/)
  /usr/local/bin(N-/)
  /usr/local/go/bin(N-/)
  "$path[@]"
)

# Rust
if [[ -f "${HOME}/.cargo/env" ]]; then
  . "${HOME}/.cargo/env"
fi

