alias ls='ls -G'
alias clc='clear'
function pps() {
	paps --separation-lines --header --header-center=$2 --header-left=$3 --hyphens --left-margin=18 --top-margin=18 --right-margin=18 --bottom-margin=18 --landscape --font 8 --columns 2 $1
}
function ppsv() {
	paps --separation-lines --header --header-center=$2 --header-left=$3 --hyphens --left-margin=18 --top-margin=18 --right-margin=18 --bottom-margin=18 --font 8 $1
}
alias ganbaruzo='nohup ~/.config/dotfiles/script/notify.sh 1500 "25分経過〜お疲れ様！" "ポモドーロ" &'
alias kyuukei='nohup ~/.config/dotfiles/script/notify.sh 300 "休憩終了〜切り替えて頑張ろう！" "ポモドーロ" &'
alias sagyoumae='nohup ~/.config/dotfiles/script/notify.sh 900 "作業開始しよう！" "ポモドーロ" &'
