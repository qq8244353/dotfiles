#!/usr/bin/env zsh
set -eux
TMP_DIR=$(mktemp -d)
cd ${TMP_DIR}
trap "rm -rf ${TMP_DIR}" EXIT

# curl -fsSL https://github.com/nodenv/nodenv-installer/raw/HEAD/bin/nodenv-installer | bash
# echo 'export PATH="$HOME/.nodenv/bin:$PATH"' >> ~/.zshrc
# executed
# npm install -g yarn
# install nodebrew
curl -L git.io/nodebrew | perl - setup
nodebrew install v18.18.2
nodebrew use v18.18.2
