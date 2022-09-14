typeset -U path PATH
path=(
	/opt/homebrew/bin(N-/)
	/usr/local/bin(N-/)
	$path
)

#anyenv setting
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"
