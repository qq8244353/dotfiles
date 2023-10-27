## neovim
https://github.com/neovim/neovim/releases/
### Procedure
- Download nvim-linux64.tar.gz
- Extract `tar xzvf nvim-linux64.tar.gz`
- Run `./nvim-linux64/bin/nvim`
## lazygit
lazygit
(install command benkyou nin aru)
https://github.com/jesseduffield/lazygit
## node
```
echo 'eval "$(nodenv init - zsh)"' >> ~/.zshrc
```
とかして、
```
nodenv install -l
nodenv install 18.18.2
nodenv shell 18.18.2
```

# Checksum example
```
sha256sum -c nvim-linux64.tar.gz.sha256sum
```
# Computer detail
```
lsb_release -a
uname -a
sudo lshw -class processor
lspci | grep -i nvidia
```

