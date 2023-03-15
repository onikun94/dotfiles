typeset -U path PATH
path=(
	/opt/homebrew/bin(N-/)
	/usr/local/bin(N-/)
	$path
)

#anyenv setting
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

# pnpm
export PNPM_HOME="/Users/yamaguchitaiyo/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end
