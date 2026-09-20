.DEFAULT_GOAL := install
BREW ?= $(shell if [ -x /opt/homebrew/bin/brew ]; then printf '%s' /opt/homebrew/bin/brew; elif [ -x /usr/local/bin/brew ]; then printf '%s' /usr/local/bin/brew; else command -v brew 2>/dev/null; fi)
NIX ?= nix
NIX_FLAKE ?= $(CURDIR)
NIX_FLAGS ?= --extra-experimental-features 'nix-command flakes'

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

.PHONY: nix-check
nix-check:
	@command -v "$(NIX)" >/dev/null 2>&1 || { echo "Nix is not installed; run the official installer first." >&2; exit 2; }
	"$(NIX)" $(NIX_FLAGS) flake check --no-build "$(NIX_FLAKE)"

.PHONY: nix-lock
nix-lock:
	@command -v "$(NIX)" >/dev/null 2>&1 || { echo "Nix is not installed; run the official installer first." >&2; exit 2; }
	"$(NIX)" $(NIX_FLAGS) flake lock "$(NIX_FLAKE)"

.PHONY: nix-build
nix-build:
	@command -v "$(NIX)" >/dev/null 2>&1 || { echo "Nix is not installed; run the official installer first." >&2; exit 2; }
	"$(NIX)" $(NIX_FLAGS) build "$(NIX_FLAKE)#cli"

.PHONY: nix-install
nix-install:
	@command -v "$(NIX)" >/dev/null 2>&1 || { echo "Nix is not installed; run the official installer first." >&2; exit 2; }
	"$(NIX)" $(NIX_FLAGS) profile install "$(NIX_FLAKE)#cli"

.PHONY: nix-upgrade
nix-upgrade:
	@command -v "$(NIX)" >/dev/null 2>&1 || { echo "Nix is not installed; run the official installer first." >&2; exit 2; }
	"$(NIX)" $(NIX_FLAGS) profile upgrade cli

.PHONY: nix-update
nix-update:
	@command -v "$(NIX)" >/dev/null 2>&1 || { echo "Nix is not installed; run the official installer first." >&2; exit 2; }
	"$(NIX)" $(NIX_FLAGS) flake update "$(NIX_FLAKE)"
