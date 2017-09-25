alias ssh=~/bin/ssh-host-color
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
export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init -)"
