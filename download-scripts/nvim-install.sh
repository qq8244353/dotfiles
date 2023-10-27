#!/usr/bin/env bash
set -eux
TMP_DIR=$(mktemp -d)
cd ${TMP_DIR}
trap "rm -rf ${TMP_DIR}" EXIT

# wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz
# tar xzf nvim-linux64.tar.gz
# sudo cp -r ./nvim-linux64/* /usr/
# sudo update-alternatives --config editor
# sudo update-alternatives --install /usr/bin/editor editor $(which nvim) 50
echo 'export EDITOR=nvim' >> ~/.zshrc
