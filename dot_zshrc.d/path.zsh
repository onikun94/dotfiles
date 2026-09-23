# Bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# User-installed Python tools
export PATH="$HOME/.local/bin:$PATH"

# mise
if command -v mise >/dev/null 2>&1; then
  eval "$(mise activate zsh)"
fi

# mise activation can rebuild PATH from the inherited environment.
if [[ -d "$HOME/.nix-profile/bin" ]]; then
  export PATH="$HOME/.nix-profile/bin:$PATH"
fi

# Go user binaries
export PATH="$HOME/go/bin:$PATH"

# nodebrew (disabled)
# export PATH=$HOME/.nodebrew/current/bin:$PATH

# browser-use
#export PATH="$HOME/.browser-use/bin:$HOME/.browser-use-env/bin:$PATH"

# meet-transcribe
export PATH="$HOME/bin:$PATH"

# Avoid duplicate PATH entries.
typeset -U path
