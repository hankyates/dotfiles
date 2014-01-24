export PATH

if [[ ! "$(type -P nvm)" ]]; then
  source ~/.dotfiles/libs/nvm/install.sh
fi
nvm install 0.10
nvm alias default 0.10
npm_globals=(grunt-cli grunt-init bower node-inspector yo forever)
npm install -g ${npm_globals[*]}

# rbenv init
PATH=$(path_remove ~/.dotfiles/libs/rbenv/bin):~/.dotfiles/libs/rbenv/bin
PATH=$(path_remove ~/.dotfiles/libs/ruby-build/bin):~/.dotfiles/libs/ruby-build/bin

if [[ "$(type -P rbenv)" && ! "$(type -t _rbenv)" ]]; then
  eval "$(rbenv init -)"
fi
