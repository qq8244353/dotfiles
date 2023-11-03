#!/usr/bin/env bash
set -eux
TMP_DIR=$(mktemp -d)
cd ${TMP_DIR}
trap "rm -rf ${TMP_DIR}" EXIT

sudo apt-get install ffmpeg -y
# FFmpegをインストールした後、以下を使用してOBS Studioをインストールします。
sudo add-apt-repository ppa:obsproject/obs-studio 
sudo apt update
sudo apt-get update && sudo apt-get install obs-studio
