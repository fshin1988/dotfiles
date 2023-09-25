#!/bin/sh
# make links to dotfiles
ln -sf ~/dotfiles/.bashrc ~/.bashrc
ln -sf ~/dotfiles/.gitignore_global ~/.gitignore_global
ln -sf ~/dotfiles/.pryrc ~/.pryrc
ln -sf ~/dotfiles/.rubocop.yml ~/.rubocop.yml
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.bash_profile ~/.bash_profile
ln -sf ~/dotfiles/.tmux.conf  ~/.tmux.conf

# setting for prompt
if [ ! -e ~/.git-prompt.sh ]; then
  wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -O ~/.git-prompt.sh
fi

# install Dein.vim
if [ ! -e ~/.cache/dein ]; then
  sh -c "$(wget -O- https://raw.githubusercontent.com/Shougo/dein-installer.vim/master/installer.sh)"
fi

# tmux
if ! which tmux > /dev/null; then
  brew install tmux
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  tmux source ~/.tmux.conf
fi
