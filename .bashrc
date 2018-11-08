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
# 返却されたjsonを整形する
jsoncurl() {
  curl "${1}" | python -mjson.tool | sed 's/\\\u\(....\)/\&#x\1;/g' | nkf --numchar-input -w
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
  for i in `git branch | grep -v master`
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
# export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH="$HOME/.ndenv/bin:$PATH"
eval "$(ndenv init -)"

# Setting for golang
export GOPATH=$HOME/gocode

# Change display name of terminal
PS1="\t \W $ "

export PHPENV_ROOT=$HOME/.phpenv
export PATH="$PATH:$PHPENV_ROOT/bin"
if which phpenv > /dev/null; then eval "$(phpenv init -)"; fi
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
