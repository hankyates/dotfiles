# Load npm_globals, add the default node into the path.
source ~/.dotfiles/source/50_devel.sh

if [[ ! "$(type -P nvm)" ]]; then
  sh ~/.dotfiles/libs/nvm/install.sh
  source ~/.nvm/nvm.sh
fi
nvm install 0.10
nvm alias default 0.10
npm_globals=(grunt-cli grunt-init bower node-inspector yo forever)
npm install -g ${npm_globals[*]}

# Install Ruby.
if [[ "$(type -P rbenv)" ]]; then
  versions=(2.0.0-p247)

  list="$(to_install "${versions[*]}" "$(rbenv whence ruby)")"
  if [[ "$list" ]]; then
    e_header "Installing Ruby versions: $list"
    for version in $list; do rbenv install "$version"; done
    [[ "$(echo "$list" | grep -w "${versions[0]}")" ]] && rbenv global "${versions[0]}"
    rbenv rehash
  fi
fi

# Install Gems.
if [[ "$(type -P gem)" ]]; then
  gems=(bundler)

  list="$(to_install "${gems[*]}" "$(gem list | awk '{print $1}')")"
  if [[ "$list" ]]; then
    e_header "Installing Ruby gems: $list"
    gem install $list
    rbenv rehash
  fi
fi

# Vundle Install for vim
if [[ "$(type -P vim)" ]]; then
  if [ ! -d ~/.vim/bundle ]; then
    mkdir ~/.vim/bundle
  fi
  git clone git@github.com:gmarik/vundle.git ~/.dotfiles/libs/vundle
  rsync -avz ~/.dotfiles/libs/vundle ~/.vim/bundle/
  e_header "Installing Vundle Packages"
  vim +BundleInstall +qall
fi
