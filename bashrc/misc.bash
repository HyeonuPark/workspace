
export PS1="\[\e[36;1m\]\w \[\e[32m\]$(git-current-branch)\[\e[33m\]\$ \[\e[0m\]"

export CC='clang'
export CXX='clang++'
export VISUAL='nano'
export EDITOR='nano'
export PAGER='less'

alias ls='exa --time-style=iso --git --git-ignore'
alias tr='ls -T'
alias rmf='rm -rf'
alias cpr='cp -r'
alias cl='clear'
alias op='xdg-open'

alias md='mkdir -p'

function mf {
  for file in $@; do
    mkdir -p "$(dirname $file)"
    touch "$file"
  done
}

function mvf {
  if [ $# -ne 2 ]; then
    echo 'Usage: $ mvf path/to/src path/to/dest'
    return 1
  fi

  mv $1 /tmp/__mvf_tmp_path
  rm -r $2
  mkdir -p "$(dirname $2)"
  mv /tmp/__mvf_tmp_path $2
}

alias home='cd ~ && clear'
alias prj="cd $(cat ~/.config/current-prj-dir)"
alias setprj='pwd > ~/.config/current-prj-dir'

alias timesync='tlsdate -H mail.google.com -V'
