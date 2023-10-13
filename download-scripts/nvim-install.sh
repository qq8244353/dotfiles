#!/usr/bin/env bash
set -eux
TMP_DIR=$(mktemp -d)
cd ${TMP_DIR}
trap "rm -rf ${TMP_DIR}" EXIT

wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz
tar xzf nvim-linux64.tar.gz
sudo mv ./nvim-linux64/bin/nvim /usr/bin/nvim
