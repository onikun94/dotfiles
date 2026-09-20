.DEFAULT_GOAL := install
BREW ?= $(shell if [ -x /opt/homebrew/bin/brew ]; then printf '%s' /opt/homebrew/bin/brew; elif [ -x /usr/local/bin/brew ]; then printf '%s' /usr/local/bin/brew; else command -v brew 2>/dev/null; fi)

.PHONY: install
install:
	$(MAKE) setup-homebrew
	$(MAKE) setup-dotfile

.PHONY: setup-homebrew
setup-homebrew:
	@if [ -x "$(BREW)" ]; then \
		echo "Homebrew is already available at $(BREW)"; \
	else \
		/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; \
	fi

.PHONY: brew-check
brew-check:
	chezmoi execute-template < "$(CURDIR)/Brewfile.tmpl" | HOMEBREW_NO_AUTO_UPDATE=1 "$(BREW)" bundle check --verbose --file=-

.PHONY: brew-bundle
brew-bundle:
	chezmoi execute-template < "$(CURDIR)/Brewfile.tmpl" | HOMEBREW_NO_AUTO_UPDATE=1 "$(BREW)" bundle --file=-

.PHONY: brew-update
brew-update:
	"$(BREW)" update --force

.PHONY: brew-upgrade
brew-upgrade:
	"$(BREW)" upgrade

.PHONY: setup-dotfile
setup-dotfile:
	$(MAKE) chezmoi-init
	$(MAKE) chezmoi-apply

.PHONY: chezmoi-init
chezmoi-init:
	sh -c "$$(curl -fsLS chezmoi.io/get)" -- init onikun94

.PHONY: chezmoi-apply
chezmoi-apply:
	chezmoi apply

.PHONY: chezmoi-diff
chezmoi-diff:
	chezmoi diff
