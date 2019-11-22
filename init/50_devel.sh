# Load npm_globals, add the default node into the path.
source ~/.dotfiles/source/50_devel.sh

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
