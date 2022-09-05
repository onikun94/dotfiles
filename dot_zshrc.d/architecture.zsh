if [[ "${(L)$( uname -s )}" == darwin ]] && (( $+commands[arch] )); then
  alias brew="arch -arch x86_64 /usr/local/bin/brew"
  alias x64='exec arch -arch x86_64 "$SHELL"'
  alias a64='exec arch -arch arm64e "$SHELL"'
  switch-arch() {
    if  [[ "$(uname -m)" == arm64 ]]; then
      arch=x86_64
    elif [[ "$(uname -m)" == x86_64 ]]; then
      arch=arm64e
    fi
    exec arch -arch $arch "$SHELL"
  }
fi
