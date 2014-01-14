set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

filetype plugin indent on     " required!

" change mapleader from \ to ,
let mapleader=","

" Let's make it easy to edit this file (mnemonic for the key sequence is
" 'e'dit 'v'imrc)
nmap <silent> <leader>ev :e $MYVIMRC<cr>

" And to source this file as well (mnemonic for the key sequence is
" 's'ource 'v'imrc)
nmap <silent> <leader>sv :so $MYVIMRC<cr>

" " Automatically set the working directory to that of the current file
set autochdir
" " Indent options
set autoindent
set copyindent

" no backup files
set nobackup

" no write backup
set nowritebackup

" no swap file
set noswapfile

" command history
set history=1000
set undolevels=1000
" " Don't update the display while executing macros
set lazyredraw

" always show cursor
set ruler

" show incomplete commands [?]
set showcmd

" incremental search
set hlsearch
set incsearch

" ignore case in search
set smartcase

" clear search buffer [?]
:nnoremap § :nohlsearch<cr>

" make sure undo history is kept for files in buffer
set hidden

" disable folding
set nofoldenable

" turn word wrap off
set nowrap

" scroll with context
set scrolloff=10

" allow backspace to delete end of line, indent and start of line char
set backspace=indent,eol,start

" convert tabs to spaces
set expandtab

" set tab size
set tabstop=4

" set the number of spaces per TAB
set shiftwidth=4

" turn on line numbers
set number

" highlight trailing whitespaces
set list listchars=tab:\ \ ,trail:·


" get rid of the delay when pressing O (for example)
" "
" http://stackoverflow.com/questions/2158516/vim-delay-before-o-opens-a-new-line
set timeout timeoutlen=1000 ttimeoutlen=100

" always show the status bar
set laststatus=2

" set the status line to something useful
set statusline=%f\ %=L:%l/%L\ %c\ (%p%%)

" hide the toolbar
set guioptions-=T

" utf encoding
set encoding=utf-8

" autoload files that have changed outside of vim
set autoread

" jump to last cursor [?]
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

" set-up ctrlp to include hidden files in its search
let g:ctrlp_show_hidden=1

" disable ctrlp's feature where it tries to intelligently work out the
" current working directory to search within
let g:ctrlp_working_path_mode=0

" don't let ctrlp take over the screen!
let g:ctrlp_max_height=30

" lets make sure we don't show these files
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*.,*/.DS_Store

" remove whitespace on save [?]
autocmd BufWritePre * :%s/\s\+$//e

"Set colorscheme xoria256
colorscheme xoria256

" " Allow to navigate into white space
set virtualedit=all

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

Bundle 'kien/ctrlp.vim'

Bundle 'vim-scripts/The-NERD-tree'
Bundle 'vim-scripts/IndexedSearch'

" allows us to more easily work with markdown files [?]
Bundle 'tpope/vim-markdown'

" allows us to comment/uncomment lines and content [?]
Bundle 'tpope/vim-commentary.git'

"--------------------------------------------------------------------------
""NERD Tree plugin settings
"--------------------------------------------------------------------------
map <F2> :NERDTreeToggle<CR>
