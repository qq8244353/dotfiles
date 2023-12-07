#!/bin/zsh
set -eux

DOTDIR=~/.config/dotfiles
TMPDIR=$(mktemp -d)
cd ${TMPDIR}
trap "rm -rf ${TMPDIR}" EXIT

if false; then
  sudo apt install vim curl wget -y
  # nerdfort 
  wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/Hack.zip
  mkdir -p ~/.fonts
  unzip Hack.zip
  cp *.ttf ~/.fonts

  # rust
  curl https://sh.rustup.rs -sSf | sh
  source "$HOME/.cargo/env"

  # alacritty
  sudo apt install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3 -y
  git clone https://github.com/alacritty/alacritty.git
  cd alacritty
  cargo build --release
  sudo cp target/release/alacritty /usr/local/bin # or anywhere else in $PATH
  sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
  sudo desktop-file-install extra/linux/Alacritty.desktop
  sudo update-desktop-database
  cd ..
  mkdir -p ~/.config/alacritty
  ln -s ${DOTDIR}/alacritty.toml ~/.config/alacritty/alacritty.toml

  # p10k
  rm -rf ~/powerlevel10k
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
  echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

  # fzf
  rm -rf ~/.fzf
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install --all

  # neovim
  wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz
  tar xzf nvim-linux64.tar.gz
  sudo cp -r ./nvim-linux64/* /usr/local/
  sudo update-alternatives --config editor
  sudo update-alternatives --install /usr/bin/editor editor $(which nvim) 50
  echo 'export EDITOR=nvim' >> ~/.zshrc
  # neovim plugin
  rm -rf ~/.config/nvim
  git clone https://github.com/qq8244353/nvim_config.git ~/.config/nvim

  # i3
  sudo apt install i3 feh polybar -y
  # font for polybar
  git clone https://github.com/Templarian/MaterialDesign-Font.git
  cd MaterialDesign-Font
  cp *.ttf ~/.fonts/
  mkdir -p ~/.config/polybar
  ln -s ${DOTDIR}/polybar/config ~/.config/polybar/config
  mkdir -p ~/.config/i3
  ln -s ${DOTDIR}/i3/config ~/.config/i3/config
  # i3-lock-color
  sudo apt install autoconf gcc make pkg-config libpam0g-dev libcairo2-dev libfontconfig1-dev libxcb-composite0-dev libev-dev libx11-xcb-dev libxcb-xkb-dev libxcb-xinerama0-dev libxcb-randr0-dev libxcb-image0-dev libxcb-util0-dev libxcb-xrm-dev libxkbcommon-dev libxkbcommon-x11-dev libjpeg-dev -y
  git clone https://github.com/Raymo111/i3lock-color.git
  cd i3lock-color
  ./build.sh
  ./install-i3lock-color.sh
  cd ..
  sudo apt install imagemagick -y
  wget https://raw.githubusercontent.com/betterlockscreen/betterlockscreen/main/install.sh -O - -q | sudo bash -s system
  # mozc
  sudo apt install fcitx-mozc -y
  # tmux
  sudo apt install tmux -y
  ln -s ${DOTDIR}/tmux.conf ~/.tmux.conf
  # glow
  sudo mkdir -p /etc/apt/keyrings
  curl -fsSL https://repo.charm.sh/apt/gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/charm.gpg
  echo "deb [signed-by=/etc/apt/keyrings/charm.gpg] https://repo.charm.sh/apt/ * *" | sudo tee /etc/apt/sources.list.d/charm.list
  sudo apt update && sudo apt install glow
  # aws
  curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
  unzip awscliv2.zip
  sudo ./aws/install
  # gh
  type -p curl >/dev/null || (sudo apt update && sudo apt install curl -y)
  curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
  && sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
  && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
  && sudo apt update \
  && sudo apt install gh -y
  gh auth login
  # gh-dash
  gh extension install dlvhdr/gh-dash
  mkdir -p ~/.config/gh-dash
  ln -s ${DOTDIR}/gh-dash.yml ~/.config/gh-dash/config.yml
  # nodebrew
  curl -L git.io/nodebrew | perl - setup
  echo 'export PATH=$HOME/.nodebrew/current/bin:$PATH' >> ~/.zshrc
  # jq
  sudo apt install jq -y
  # python3 venv
  sudo apt install python3.10-venv -y
  # lazygit
  wget https://github.com/jesseduffield/lazygit/releases/download/v0.40.2/lazygit_0.40.2_Linux_x86_64.tar.gz
  tar xzf lazygit_0.40.2_Linux_x86_64.tar.gz lazygit
  sudo install lazygit /usr/local/bin
  # keepass
  echo 'this take some time. Please wait...'
  sudo snap install keepassxc
  # ranger
  sudo apt install ranger -y
  ln -s ${DOTDIR}/ranger/rc.conf ~/.config/ranger/rc.conf
fi
echo '[[ ! -f ~/.config/dotfiles/zshrc ]] || source ~/.config/dotfiles/zshrc' >> ~/.zshrc
source ~/.zshrc
exit 0

# wget https://github.com/haikarainen/light/archive/refs/tags/v1.2.2.zip
# unzip v1.2.2.zip

