alias be='bundle exec'
exdgrep() {
  grep -rn "${1}" . --exclude-dir={./.git,./tmp,./log,./vendor} | grep -v "^\.\/tags";
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

export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init -)"
export PATH=$HOME/.nodebrew/current/bin:$PATH

# Setting for golang
export GOPATH=$HOME/gocode

# Change display name of terminal
PS1="\t \W $ "

export PHPENV_ROOT=$HOME/.phpenv
export PATH="$PATH:$PHPENV_ROOT/bin"
eval "$(phpenv init -)"
