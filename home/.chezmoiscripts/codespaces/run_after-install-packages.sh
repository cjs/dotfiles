#!/usr/bin/env bash

# check if brew is installed
if ! command -v brew &>/dev/null; then
	echo "brew could not be found, installing"
	/bin/bash -c "NONINTERACTIVE=1 $(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" &&
		eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
	test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
	test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
	echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >>~/.bashrc
fi

brew_install() {
	printf "\nInstalling %s" "$1"
	if brew list "$1" &>/dev/null; then
		echo "${1} is already installed"
	else
		brew install "$1" && echo "$1 is installed"
	fi
}

brew_install "fzf"
brew_install "ripgrep"
brew install "rbenv"
brew_install "neovim"

# nvim +'PlugInstall --sync' +qa
