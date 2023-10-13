#!/usr/bin/env bash
set -eux
TMP_DIR=$(mktemp -d)
cd ${TMP_DIR}
trap "rm -rf ${TMP_DIR}" EXIT

wget https://github.com/jesseduffield/lazygit/releases/download/v0.40.2/lazygit_0.40.2_Linux_x86_64.tar.gz
tar xzf lazygit_0.40.2_Linux_x86_64.tar.gz lazygit
sudo install lazygit /usr/local/bin
