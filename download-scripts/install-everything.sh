#!/usr/bin/env bash
set -eux
TMP_DIR=$(mktemp -d)
cd ${TMP_DIR}
trap "rm -rf ${TMP_DIR}" EXIT


gsettings set org.gnome.desktop.input-sources xkb-options "['ctrl:nocaps']"
exit
# ------------- already installed ------------- 
sudo apt install curl -y
sudo apt install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3 -y
# caps-lock to ctrl

sudo apt install fcitx-mozc -y
