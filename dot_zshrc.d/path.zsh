#BUN
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

#POETRY
export PATH="$HOME/.local/bin:$PATH"

# bun completions
[ -s "/Users/s19306/.bun/_bun" ] && source "/Users/s19306/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/s19306/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
#
#mise
eval "$(~/.local/bin/mise activate zsh)"

#go
export PATH=$PATH:$HOME/go/bin

