#!/usr/bin/env bash
set -eux

mkdir -p binaries
cd binaries
# wget -P binaries https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz
if [ ! -e "nvim-linux64.tar.gz" ]; then
  wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz
fi
tar xzf nvim-linux64.tar.gz
# sudo update-alternatives --config editor
# sudo update-alternatives --install /usr/bin/editor editor $(which nvim) 50
echo 'export EDITOR=nvim' >> ~/.zshrc
echo 'export PATH=$PATH:~/.config/dotfiles/download-scripts/ubuntu/binaries/nvim-linux64/bin' >> ~/.zshrc

