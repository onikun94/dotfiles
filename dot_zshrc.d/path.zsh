# BUN
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# POETRY
export PATH="$HOME/.local/bin:$PATH"

# mise
eval "$(~/.local/bin/mise activate zsh)"

# go
export PATH=$PATH:$HOME/go/bin

# MySQL
export PATH="/opt/homebrew/opt/mysql@8.0/bin:$PATH"

# tmux pbw
source ~/.config/tmux/president-boss-workers/pbw-aliases.zsh

# nodebrew (disabled)
# export PATH=$HOME/.nodebrew/current/bin:$PATH
