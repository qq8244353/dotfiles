#!/usr/bin/env bash
set -eux

mkdir -p binaries
cd binaries
if [ ! -e "lazygit_0.40.2_Linux_x86_64.tar.gz" ]; then
  wget https://github.com/jesseduffield/lazygit/releases/download/v0.40.2/lazygit_0.40.2_Linux_x86_64.tar.gz
fi
tar xzf lazygit_0.40.2_Linux_x86_64.tar.gz lazygit
mkdir -p bin
mv lazygit bin/lazygit
# sudo install lazygit /usr/local/bin
echo 'export PATH=$PATH:~/.config/dotfiles/download-scripts/ubuntu/binaries/bin' >> ~/.zshrc
