set nocompatible
filetype off                   " required!

set rtp+=$HOME/.vim/bundle/Vundle.vim/
call vundle#begin('$HOME/.vim/bundle/')

Plugin 'VundleVim/Vundle.vim'
Plugin 'jnurmine/Zenburn'
Plugin 'nanotech/jellybeans.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-git.git'
Plugin 'tpope/vim-surround.git'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
"Plugin 'msanders/snipmate.vim.git'
Plugin 'Raimondi/delimitMate'
Plugin 'mattn/emmet-vim'
Plugin 'kien/ctrlp.vim'
Plugin 'heavenshell/vim-jsdoc'
Plugin 'itchyny/lightline.vim'
Plugin 'tjennings/git-grep-vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'marijnh/tern_for_vim'
Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'
Plugin 'lepture/vim-jinja'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'editorconfig/editorconfig-vim'
"Plugin 'Quramy/tsuquyomi'
Plugin 'leafgarland/typescript-vim'
"Plugin 'nvie/vim-pyunit'
"Plugin 'minibufexpl.vim'
Plugin 'L9'

call vundle#end()
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
set guifont=Consolas:h14
let g:zenburn_high_Contrast=1
colors jellybeans
hi NonText ctermfg=7 guifg=gray
set list listchars=tab:\T\ ,trail:.,extends:>,precedes:<
set hls nu nowrap
set softtabstop=2 tabstop=2 shiftwidth=2 expandtab
set foldmethod=indent foldlevel=99
set completeopt=menuone,longest,preview
set omnifunc=syntaxcomplete#Complete
let g:jsdoc_default_mapping=0

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%120v.\+/

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
map <Leader>[ :colors jellybeans<CR>
map <Leader>] :colors morning<CR>
map <Leader>gt :YcmCompleter GetType<CR>
map <Leader>fi :YcmCompleter FixIt<CR>
map <Leader>dec :YcmCompleter GoToDeclaration<CR>
map <Leader>def :YcmCompleter GoToDefinition<CR>
map <Leader>t :YcmCompleter GoToType<CR>
map <Leader>ref :YcmCompleter GoToReferences<CR>

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

" Fugitive stuff
map <Leader>ga :Gwrite<cr>
map <Leader>gc :Gcommit<cr>
map <Leader>gb :Gblame<cr>
map <Leader>gd :Gdiff<cr>
map <Leader>gs :Gstatus<cr>

set backspace=indent,eol,start

" UltiSnips
let g:UltiSnipsExpandTrigger="<C-J>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Macros
" letder>cl :%s/class=/className=/gc<cr>
map <Leader>tt :%s/<%=\ name %>/ @f='ifunction
set ffs=dos,unix
set encoding=utf-8
set softtabstop=2 tabstop=2 shiftwidth=2 expandtab
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_auto_trigger = 1
let g:ycm_python_binary_path = 'python'
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_python_pylint_args = '--rcfile=~\.pylintrc'
set noswapfile
set nobackup
set nowritebackup
