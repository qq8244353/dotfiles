#!/usr/bin/env bash
set -eux
TMP_DIR=$(mktemp -d)
# cd ${TMP_DIR}
trap "rm -rf ${TMP_DIR}" EXIT

# Dependencies
#   - cargo
#   - apt install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3
cargo install alacritty
# terminfo
# infocmp alacritty
# Desktop Entory
# sudo cp target/release/alacritty /usr/local/bin # or anywhere else in $PATH
# sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
# sudo desktop-file-install extra/linux/Alacritty.desktop
# sudo update-desktop-database
