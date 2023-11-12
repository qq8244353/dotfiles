set -xe
# rust
# curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# alacrittty
git clone https://github.com/alacritty/alacritty.git
cd alacritty
make app
cp -r target/release/osx/Alacritty.app /Applications/
