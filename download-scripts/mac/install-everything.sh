set -xe
TMP_DIR=$(mktemp -d)
cd ${TMP_DIR}
trap "rm -rf ${TMP_DIR}" EXIT

# done
if false; then
	echo hello
	rust
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
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
fi
