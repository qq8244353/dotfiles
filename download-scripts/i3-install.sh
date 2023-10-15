#!/usr/bin/env bash
set -eux
TMP_DIR=$(mktemp -d)
# cd ${TMP_DIR}
trap "rm -rf ${TMP_DIR}" EXIT

sudo apt install i3 -y
