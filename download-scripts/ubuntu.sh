set -ex
sudo apt update
sudo apt upgrade -y
sudo apt install zsh -y
sudo -u ${USER} chsh -s $(which zsh)
DIR=$(echo $(dirname $0))
${DIR}/ubuntu-zsh.sh
exit 0
reboot
