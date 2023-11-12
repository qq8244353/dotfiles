#!/usr/bin/env bash
set -eux
TMP_DIR=$(mktemp -d)
# cd ${TMP_DIR}
trap "rm -rf ${TMP_DIR}" EXIT

sudo add-apt-repository ppa:boltgolt/howdy
sudo apt update
sudo apt install howdy
