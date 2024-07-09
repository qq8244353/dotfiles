# エディタ起動
alias n='nvim main.cpp'
# 自動コメントアウト
function c() (
  sed -i '' 's/\(^[^\/]*cerr.*\)/\/\/ \1/' main.cpp
)

function rc() (
  sed -i '' 's/^\/\/ //' main.cpp
)

# 提出
function ssss() (
  rm -f log.txt tmp.cpp bundle.cpp submit.cpp
  cat main.cpp | grep '#include' > bundle.cpp
  echo '#ifdef INCLUDED_MAIN\n' > submit.cpp
  cat main.cpp | awk '/^int main\(\)/,/djkflaf/' >> submit.cpp
  echo '\n#else' >> submit.cpp
  oj-bundle bundle.cpp -I ~/Kyopro/library 2>log.txt > tmp.cpp
  if [ ! $? -eq 0 ]; then
    echo "bundle error"
    cat log.txt | grep DEBUG --color=never
    exit
  fi
  cat tmp.cpp | sed 's/.*line.*//' >> submit.cpp 
  python3 ~/.config/dotfiles/kyopro/extract-above-main.py main.cpp >> submit.cpp
  echo '#define INCLUDED_MAIN\n#include __FILE__\n\n#endif' >> submit.cpp
  rm -f log.txt tmp.cpp bundle.cpp
)

# 提出
function sss() (
  rm -f log.txt tmp.cpp bundle.cpp submit.cpp
  cat main.cpp | grep '#include' > bundle.cpp
  echo '#ifdef INCLUDED_MAIN\n' > submit.cpp
  cat main.cpp | awk '/^int main\(\)/,/djkflaf/' >> submit.cpp
  echo '\n#else' >> submit.cpp
  oj-bundle bundle.cpp -I ~/Kyopro/library 2>log.txt > tmp.cpp
  if [ ! $? -eq 0 ]; then
    echo "bundle error"
    cat log.txt | grep DEBUG --color=never
    exit
  fi
  cat tmp.cpp | sed 's/.*line.*//' >> submit.cpp 
  python3 ~/.config/dotfiles/kyopro/extract-above-main.py main.cpp >> submit.cpp
  echo '#define INCLUDED_MAIN\n#include __FILE__\n\n#endif' >> submit.cpp
  oj s -y --no-open submit.cpp | grep SUCCESS
  rm -f log.txt tmp.cpp bundle.cpp submit.cpp
)

# mainファイル内を初期化
fuction reset_main() (
  TEMPLATE_FILES=$(cat ~/.config/dotfiles/oj/prepare.config.toml | dasel -r toml -w json | jq -r '.templates | .[]')
  for TEMPLATE_FILE in ${TEMPLATE_FILES}
  do
    BASENAME=$(basename ${TEMPLATE_FILE})
    PROBLEM_DIRS=($(ls $1))
    for PROBLEM_DIR in ${PROBLEM_DIRS}
    do
      cp ${TEMPLATE_FILE} "$1/${PROBLEM_DIR}/${BASENAME}"
    done
  done
)

function topdf() {
  filein=$1
  opt=${2:-Portrait}  # 長い行のときはLandscapeオプションが便利
  vim ${filein} -c 'colorscheme default | set number | TOhtml | w tmp.html | qa!'
  wkhtmltopdf --page-size B4 -O ${opt} --footer-left "[date] [time] ${filein}" \
    --footer-right "[page]/[topage]" --no-background --margin-top 4 --margin-right 3 \
    --margin-left 4 --margin-bottom 10 tmp.html ${filein}.pdf 
  rm -f tmp.html
}

# エイリアス
alias m='(){ [ ! -d ~/Kyopro/atcoder.jp/$1 ] && oj-prepare --config-file ~/.config/dotfiles/oj/prepare.config.toml https://atcoder.jp/contests/$1; cd ~/Kyopro/atcoder.jp/$1; reset_main ~/Kyopro/atcoder.jp/$1}'
alias sola='cd $(pwd | sed "s/\(.*atcoder\.jp\/\)\([a-zA-Z0-9\-]*\).*/\1\2\/\2_a/")'
alias solb='cd $(pwd | sed "s/\(.*atcoder\.jp\/\)\([a-zA-Z0-9\-]*\).*/\1\2\/\2_b/")'
alias solc='cd $(pwd | sed "s/\(.*atcoder\.jp\/\)\([a-zA-Z0-9\-]*\).*/\1\2\/\2_c/")'
alias sold='cd $(pwd | sed "s/\(.*atcoder\.jp\/\)\([a-zA-Z0-9\-]*\).*/\1\2\/\2_d/")'
alias sole='cd $(pwd | sed "s/\(.*atcoder\.jp\/\)\([a-zA-Z0-9\-]*\).*/\1\2\/\2_e/")'
alias solf='cd $(pwd | sed "s/\(.*atcoder\.jp\/\)\([a-zA-Z0-9\-]*\).*/\1\2\/\2_f/")'
alias solg='cd $(pwd | sed "s/\(.*atcoder\.jp\/\)\([a-zA-Z0-9\-]*\).*/\1\2\/\2_g/")'
alias solh='cd $(pwd | sed "s/\(.*atcoder\.jp\/\)\([a-zA-Z0-9\-]*\).*/\1\2\/\2_h/")'
alias g="/usr/bin/g++ -std=c++20 main.cpp -I ~/Kyopro/library -I ~/Kyopro/library/_include -fsanitize=address -D_GLIBCXX_DEBUG -D_GLIBCXX_DEBUG_PEDANTIC"
alias p="pbcopy < main.cpp"
alias tt='latexmk -pdfdvi -pvc'
alias a='./a.out'
