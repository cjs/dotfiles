#!/usr/bin/env bash

set -e

echo "Installing: dependencies ********************"
sudo apt update && sudo apt install -y fuse ripgrep fd-find busybox universal-ctags fzf

echo "Installing: starship ********************"
sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- --yes

# Set up neovim
# echo "Installing: nvim ********************"
# pip3 install --user pynvim
# chmod u+x nvim.appimage
# ./nvim.appimage --appimage-extract
# ./squashfs-root/AppRun --version
# sudo mv squashfs-root / && ln -s /squashfs-root/AppRun $HOME/.local/bin/nvim
