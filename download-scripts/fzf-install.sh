#!/usr/bin/env bash
set -eux
TMP_DIR=$(mktemp -d)
# cd ${TMP_DIR}
trap "rm -rf ${TMP_DIR}" EXIT

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
