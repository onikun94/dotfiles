#ディレクトリ移動
#documents
alias cdd='cd ~/Documents'
#home
alias cdh='cd ~'
#saji
alias cdsj='cd ~/Documents/saji'
#python
alias cdpy='cd ~/Documents/python'
#jupyter
alias cdjp='cd ~/Documents/python/jupyter'
#Next
alias cdnx='cd ~/Documents/next'
#TypeScript
alias cdts='cd ~/Documents/TypeScript'
#Javascript
alias cdjs='cd ~/Documents/Javascript'
#React
alias cdr='cd ~/Documents/React'
#Downloads
alias cddw='cd ~/Downloads'
#フォルダ作成
alias m='mkdir'
#削除(ファイル)
alias r='rm -i'
#削除(フォルダ)
alias rd='rm -i -r'
#出力のコピー
alias cp1='pbcopy'
#コピー
alias cp='cp -i'
#クリア
alias cl='clear'
#ls
alias ll='ls -al'
#cat
alias c='cat'
#cd
alias ..='cd ..'
#internet speed
alias ns='networkQuality -s'
#jupyternotebook
alias jn='jupyter notebook' 
#Atcoder
alias gpm='g++ main.cpp'
alias accpy='acc submit main.py'
alias acccpp='acc submit main.cpp'
alias pym='python main.py'

function accp(){
  command acc new $1 --template python3
}
function ojtcpp(){
  command oj t -d /Users/yamaguchitaiyo/Documents/Atcoder/$1/$2/tests/
}
function ojtpy(){
  command oj t -c "python3 /Users/yamaguchitaiyo/Documents/Atcoder/$1/$2/main.py" -d /Users/yamaguchitaiyo/Documents/Atcoder/$1/$2/tests/
}
function g(){
  g++ $1.cpp -o $1.out
}
function g.(){
  ./$1.out
}

#application
function start(){
  open -a $1;
}

function stop(){
  osascript -e "quit app \"${1}\"";
}


#zshrc
alias zs='nvim ~/.zshrc'
alias zss='source ~/.zshrc'
