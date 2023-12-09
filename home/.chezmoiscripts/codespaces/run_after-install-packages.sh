#!/usr/bin/env bash

# check if brew is installed
if ! command -v brew &>/dev/null; then
	echo "brew could not be found"
	exit 1
fi

brew_install() {
	echo "\nInstalling $1"
	if brew list $1 &>/dev/null; then
		echo "${1} is already installed"
	else
		brew install $1 && echo "$1 is installed"
	fi
}

brew_install "fzf"
brew_install "ripgrep"
brew_install "neovim"

# nvim +'PlugInstall --sync' +qa
