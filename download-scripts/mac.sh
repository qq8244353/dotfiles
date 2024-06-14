set -xe
TMP_DIR=$(mktemp -d)
cd ${TMP_DIR}
trap "rm -rf ${TMP_DIR}" EXIT

# done
if false; then
	# rust
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  source "$HOME/.cargo/env"
	# alacrittty
	git clone https://github.com/alacritty/alacritty.git
	cd alacritty
	make app
	cp -r target/release/osx/Alacritty.app /Applications/
	# wget
	brew install wget
	# nvim
	wget https://github.com/neovim/neovim/releases/latest/download/nvim-macos.tar.gz
	tar xzf nvim-macos.tar.gz
	sudo cp -r ./nvim-macos/* /usr/local/
	echo 'export EDITOR=nvim' >> ~/.zshrc
  # instll hack nerd font
  wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/Hack.zip
  mkdir -p ~/Library/Fonts
  unzip Hack.zip
  cp *.ttf ~/Library/Fonts
  # yabai
  brew install koekeishiya/formulae/yabai
  # skhd
  brew install koekeishiya/formulae/skhd
  # improve key-repetation
  defaults write -g InitialKeyRepeat -int 12 # normal minimum is 15 (225 ms)
  defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)
  # neovim
  wget https://github.com/neovim/neovim/releases/download/stable/nvim-macos.tar.gz
  xattr -c nvim-macos.tar.gz
  tar xzf nvim-macos.tar.gz
  sudo cp -r ./nvim-macos/* /usr/local/
  echo 'export EDITOR=nvim' >> ~/.zshrc
  # fix some error
  sudo chown quack ~/.local/state
  sudo chown quack ~/.local/state/nvim
  sudo chown quack ~/.local/state/nvim/shada
  sudo chown quack ~/.local/state/nvim/shada/main.shada
  sudo chown quack ~/.local/state/nvim/swap
  # workaround for generating nvim-log every dirs
  mkdir -p ~/.cache/nvim
  # create config file for neovim
  git clone git@github.com:qq8244353/nvim_config ~/.config/nvim
  # powerlocel-10k
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
  echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc
  # glow
  brew install glow
  # lazygit
  brew install jesseduffield/lazygit/lazygit
  # install python and pip
  brew install python3
  # install online-judge-tools
  pip3 install online-judge-tools
  pip3 install online-judge-template-generator
  pip3 install online-judge-verify-helper
  # install fzf
  brew install fzf
  # To install useful key bindings and fuzzy completion:
  $(brew --prefix)/opt/fzf/install
  # tmux
  brew install tmux
  ln -s ~/.config/dotfiles/tmux.conf ~/.tmux.conf
  # Kyopro config
  echo '# read common zshrc' >> ~/.zshrc
  echo '[ -f ~/.config/dotfiles/zshrc ] && source ~/.config/dotfiles/zshrc' >> ~/.zshrc
  mkdir -p ~/Kyopro
  git clone git@github.com:qq8244353/library ~/Kyopro/library
  # gcc
  brew install gcc
  sudo ln -s /opt/homebrew/bin/g++-13 /usr/local/bin/g++
  sudo ln -s /opt/homebrew/bin/gcc-13 /usr/local/bin/gcc
  # tree
  brew install tree
  # nodebrew
  curl -L git.io/nodebrew | perl - setup
  echo 'export PATH=$HOME/.nodebrew/current/bin:$PATH' >> ~/.zshrc
  # tex
  brew install --cask mactex
  ln -s ~/.config/dotfiles/latexmkrc ~/.latexmkrc
  # jq, yq, dasel
  brew install jq
  brew install yq
  brew install dasel
fi
