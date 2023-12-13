#!/usr/bin/env bash

set -e

echo "Installing: dependencies ********************"
sudo apt update && sudo apt install -y ripgrep fd-find busybox universal-ctags fzf

echo "Installing: starship ********************"
sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- --yes
