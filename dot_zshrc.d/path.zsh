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

# MySQL is optional; do not add a dead path when it is not installed.
MYSQL_BIN="/opt/homebrew/opt/mysql@8.0/bin"
if [[ -d "$MYSQL_BIN" ]]; then
  export PATH="$MYSQL_BIN:$PATH"
fi

# nodebrew (disabled)
# export PATH=$HOME/.nodebrew/current/bin:$PATH

# browser-use
#export PATH="$HOME/.browser-use/bin:$HOME/.browser-use-env/bin:$PATH"

# meet-transcribe
export PATH="$HOME/bin:$PATH"

# Remove stale inherited entries after all optional PATH contributors ran.
typeset -U path
for stale_path in \
  "/opt/homebrew/opt/mysql@8.0/bin" \
  "/opt/homebrew/Caskroom/miniforge/base/bin"; do
  [[ -d "$stale_path" ]] || path=(${path:#$stale_path})
done
