#!/usr/bin/env bash
set -eux
TMP_DIR=$(mktemp -d)
# cd ${TMP_DIR}
trap "rm -rf ${TMP_DIR}" EXIT

# sudo apt-get update
# sudo apt-get upgrade -y
# sudo apt update
# sudo apt upgrade -y
wget https://github.com/haikarainen/light/archive/refs/tags/v1.2.2.zip
unzip v1.2.2.zip
exit
# ------------- already installed ------------- 
sudo apt install imagemagick -y
sudo apt install gh -y
sudo snap install keepassxc
sudo apt install curl -y
# dependencies for alacritty (?)
sudo apt install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3 -y
sudo snap install slack
# caps-lock to ctrl doesnt work with fcitx
# gsettings set org.gnome.desktop.input-sources xkb-options "['ctrl:nocaps']"

sudo apt install fcitx-mozc -y

# google drive sync
sudo add-apt-repository ppa:alessandro-strada/ppa
sudo apt-get update
sudo apt-get install google-drive-ocamlfuse

# glow
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://repo.charm.sh/apt/gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/charm.gpg
echo "deb [signed-by=/etc/apt/keyrings/charm.gpg] https://repo.charm.sh/apt/ * *" | sudo tee /etc/apt/sources.list.d/charm.list
sudo apt update && sudo apt install glow
# multipass
sudo snap install multipass -y
# jq
sudo apt install jq -y
sudo apt install python3.10-venv -y
# card-leader
sudo apt-get install libpcsclite-dev pcscd pcsc-tools -y
