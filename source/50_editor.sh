# Editing

export EDITOR=$(type nano pico vi vim 2>/dev/null | sed 's/ .*$//;q')
alias q="$EDITOR -w -z"
export VISUAL="$EDITOR"

alias q.='q .'

function qs() {
  pwd | perl -ne"s#^$(echo ~/.dotfiles)## && exit 1" && cd ~/.dotfiles
  q ~/.dotfiles
}
