function sss() (
  rm -f log.txt tmp.cpp bundle.cpp submit.cpp
  cat main.cpp | grep '#include' > bundle.cpp
  echo '#ifdef INCLUDED_MAIN' > submit.cpp
  cat main.cpp | grep -v '#include' >> submit.cpp
  echo '\n#else' >> submit.cpp
  oj-bundle bundle.cpp -I ~/projects/competitive/library 2>log.txt > tmp.cpp
  if [ ! $? -eq 0 ]; then
    echo "bundle error"
    cat log.txt | grep DEBUG --color=never
    exit
  fi
  cat tmp.cpp | sed 's/.*line.*//' >> submit.cpp 
  echo '#define INCLUDED_MAIN\n#include __FILE__\n\n#endif' >> submit.cpp
  oj s -y --no-open submit.cpp | grep SUCCESS
  rm -f log.txt tmp.cpp bundle.cpp submit.cpp
)
alias sola='cd $(pwd | sed "s/\(.*atcoder\.jp\/\)\([a-zA-Z0-9]*\).*/\1\2\/\2_a/")'
alias solb='cd $(pwd | sed "s/\(.*atcoder\.jp\/\)\([a-zA-Z0-9]*\).*/\1\2\/\2_b/")'
alias solc='cd $(pwd | sed "s/\(.*atcoder\.jp\/\)\([a-zA-Z0-9]*\).*/\1\2\/\2_c/")'
alias sold='cd $(pwd | sed "s/\(.*atcoder\.jp\/\)\([a-zA-Z0-9]*\).*/\1\2\/\2_d/")'
alias sole='cd $(pwd | sed "s/\(.*atcoder\.jp\/\)\([a-zA-Z0-9]*\).*/\1\2\/\2_e/")'
alias solf='cd $(pwd | sed "s/\(.*atcoder\.jp\/\)\([a-zA-Z0-9]*\).*/\1\2\/\2_f/")'
alias solg='cd $(pwd | sed "s/\(.*atcoder\.jp\/\)\([a-zA-Z0-9]*\).*/\1\2\/\2_g/")'
alias solh='cd $(pwd | sed "s/\(.*atcoder\.jp\/\)\([a-zA-Z0-9]*\).*/\1\2\/\2_h/")'
alias g="/usr/bin/g++ -std=c++20 main.cpp -I ~/projects/competitive/library"
alias p="pbcopy < main.cpp"
alias m='(){oj-prepare https://atcoder.jp/contests/$1; cd ~/projects/competitive/atcoder.jp/$1}'
alias tt='latexmk -pdfdvi -pvc'
