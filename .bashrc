alias be='bundle exec'
exdgrep() {
  grep -rn "${1}" . --exclude-dir={./.git,./tmp,./log,./vendor} | grep -v "^\.\/tags";
}
exdgrepl() {
  grep -rl "${1}" . --exclude-dir={./.git,./tmp,./log,./vendor} | grep -v "^\.\/tags";
}
# crontab -r を封印する
function crontab() {
  local opt
  for opt in "$@"; do
    if [[ $opt == -r ]]; then
      echo 'crontab -r is sealed!'
      return 1
    fi
  done
  command crontab "$@"
}
# URLデコード
urldecode() {
  echo "${1}" | nkf -w --url-input
}
# git関連
gpush() {
  git push origin `git rev-parse --abbrev-ref HEAD`
}
# remoteに存在しないローカルブランチの削除
cleanbranch() {
  if [[ $1 = "-h" ]]; then
    echo "usage: cleanbranch -D"
    return 0
  fi

  git remote prune origin
  for i in `git branch | grep -v master | grep -v "*"`
  do
    git branch -r | awk '{print substr($1, 8)}' | grep -x $i > /dev/null
    if [ $? = 1 ]; then
      if [[ $1 = "-D" ]]; then
        git branch -D $i
      else
        echo $i
      fi
    fi
  done
}

export PATH=$HOME/.rbenv/bin:$PATH
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
export PATH="$HOME/.ndenv/bin:$PATH"
eval "$(ndenv init -)"

# Setting for golang
export GOPATH=$HOME/gocode
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
eval "$(goenv init -)"
export PATH="$GOPATH/bin:$PATH"

# Change display name of terminal
source ~/.git-prompt.sh
PS1='[\t \W$(__git_ps1 " (%s)")]\$ '

# direnv
export EDITOR=vim
eval "$(direnv hook bash)"

# anyenv
eval "$(anyenv init -)"

export BASH_SILENCE_DEPRECATION_WARNING=1
