apt install zsh vim curl wget -y
# p10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all
# neovim
wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz
tar xzf nvim-linux64.tar.gz
cp -r ./nvim-linux64/* /usr/
update-alternatives --config editor
update-alternatives --install /usr/bin/editor editor $(which nvim) 50
echo 'export EDITOR=nvim' >> ~/.zshrc
# neovim plugin
git clone https://github.com/qq8244353/nvim_config.git ~/.config/nvim
# 
