## neovim
https://github.com/neovim/neovim/releases/
### Procedure
- Download nvim-linux64.tar.gz
- Extract `tar xzvf nvim-linux64.tar.gz`
- Run `./nvim-linux64/bin/nvim`
##
lazygit
(install command benkyou nin aru)
https://github.com/jesseduffield/lazygit

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
