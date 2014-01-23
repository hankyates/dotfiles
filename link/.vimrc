set nocompatible
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'jnurmine/Zenburn'
Bundle 'mattn/emmet-vim'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-fugitive'
Bundle 'msanders/snipmate.vim.git'
Bundle 'tpope/vim-surround.git'
Bundle 'tpope/vim-git.git'
Bundle 'kien/ctrlp.vim'
Bundle 'ervandew/supertab.git'
Bundle 'tjennings/git-grep-vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'

"Bundle 'wincent/Command-T.git'
" vim-scripts repos
Bundle 'minibufexpl.vim'
Bundle 'L9'

" non github repos
"Bundle 'git://git.wincent.com/command-t.git'


filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

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
set guioptions+=TlLrRbB
set guioptions-=TlLrRbB

" Command P
let g:ctrlp_cmd = '<Leader>p'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(node_modules|git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" User Mappings
map <Leader><Tab> :NERDTreeToggle<CR>
map <Leader>\ :! 
map <Leader>aa :GitGrep 
map <Leader>as :GitGrep <cword><CR>
map <Leader>] :colors morning<CR>
map <Leader>[ :colors zenburn<CR>

" Sets and Lets
let g:miniBufExplSplitBelow=0
let g:miniBufExplMaxSize=0

" Map ctrl-movement keys to window switching
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>
