.PHONY: install
install:
	make setup-homebrew

.PHONY: setup-homebrew
setup-homebrew:
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	brew update --force && brew upgrade
	brew bundle

.PHONY: setup-dotfile
setup-dotfile:
	sh -c "$(curl -fsLS chezmoi.io/get)" -- init --apply onikun94
	chezmoi cd && chezmoi apply
