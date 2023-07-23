.PHONY: install
install:
	make install-homebrew

.PHONY: setup-homebrew
setup-homebrew:
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	brew update --force && brew upgrade
	brew bundle
	

