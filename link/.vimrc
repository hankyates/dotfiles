set nocompatible
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'jnurmine/Zenburn'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git.git'
Bundle 'tpope/vim-surround.git'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'msanders/snipmate.vim.git'
Bundle 'Raimondi/delimitMate'
Bundle 'mattn/emmet-vim'
Bundle 'kien/ctrlp.vim'
Bundle 'tjennings/git-grep-vim'
Bundle 'minibufexpl.vim'
Bundle 'L9'

filetype plugin indent on

augroup AutoReloadVimRC
  au!
  " automatically reload vimrc when it's saved
  au BufWritePost $MYVIMRC so $MYVIMRC
augroup END

" Statusline Settings
set laststatus=2
set statusline=%<%f\ %h%m%r%{SyntasticStatuslineFlag()}%=%-14.(%l,%c%V%)\ %P

" Text settings
syntax enable
set t_Co=256
let g:zenburn_high_Contrast=1
colors zenburn
hi NonText ctermfg=7 guifg=gray
set list listchars=tab:\T\ ,trail:.,extends:>,precedes:<
set hls nu wrap
set softtabstop=2 tabstop=2 shiftwidth=2 expandtab
set foldmethod=indent foldlevel=99
set completeopt=menuone,longest,preview
set omnifunc=syntaxcomplete#Complete

" Gui Options
set guioptions-=TlLrRbB

" Command P
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(node_modules|git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': '',
  \ }

" User Mappings
map <Leader><Tab> :NERDTreeToggle<CR>
map <Leader>\ :! 
map <Leader>aa :GitGrep 
map <Leader>as :GitGrep <cword><CR>
map <Leader>] :colors morning<CR>
map <Leader>[ :colors zenburn<CR>

let g:miniBufExplSplitBelow=0
let g:miniBufExplMaxSize=0

" Map ctrl-movement keys to window switching
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>
