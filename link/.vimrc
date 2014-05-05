set nocompatible
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'jnurmine/Zenburn'
Bundle 'nanotech/jellybeans.vim'
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
Bundle 'heavenshell/vim-jsdoc'
Bundle 'itchyny/lightline.vim'
Bundle 'tjennings/git-grep-vim'
Bundle 'Valloric/YouCompleteMe'
Bundle 'marijnh/tern_for_vim'
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
"set statusline=%<%f\ %h%m%r%{SyntasticStatuslineFlag()}%=%-14.(%l,%c%V%)\ %P

" Text settings
syntax enable
set t_Co=256
set guifont=Ubuntu\ Mono\ 14
let g:zenburn_high_Contrast=1
colors jellybeans
hi NonText ctermfg=7 guifg=gray
set list listchars=tab:\T\ ,trail:.,extends:>,precedes:<
set hls nu wrap
set softtabstop=2 tabstop=2 shiftwidth=2 expandtab
set foldmethod=indent foldlevel=99
set completeopt=menuone,longest,preview
set omnifunc=syntaxcomplete#Complete
let g:jsdoc_default_mapping=0

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%96v.\+/

" Gui Options
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

" Command P
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,.git,node_modules,dist,build
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '',
  \ 'file': '\v\.(exe|so|dll|ico|png|jpg)$',
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

let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ }

map <Leader>ga :Gwrite<cr>
map <Leader>gc :Gcommit<cr>
map <Leader>gb :Gblame<cr>
map <Leader>gd :Gdiff<cr>
map <Leader>gs :Gstatus<cr>

set backspace=indent,eol,start

ino <C-J> <c-r>=TriggerSnippet()<cr>
snor <C-J> <esc>i<right><c-r>=TriggerSnippet()<cr>
