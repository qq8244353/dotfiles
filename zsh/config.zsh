alias ls='ls -G'
alias clc='clear'
function pps() {
	paps --separation-lines --header --header-center=$2 --header-left=$3 --hyphens --left-margin=18 --top-margin=18 --right-margin=18 --bottom-margin=18 --landscape --font 8 --columns 2 $1
}
