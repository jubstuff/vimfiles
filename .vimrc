"ng compatible with good ol' vi
set nocompatible
" " Enable pathogen plugin
call pathogen#infect() 
" " change mapleader from \ to ,
let mapleader=","
" " Let's make it easy to edit this file (mnemonic for the key sequence is
	" " 'e'dit 'v'imrc)
nmap <silent> <leader>ev :e $MYVIMRC<cr>
"
" " And to source this file as well (mnemonic for the key sequence is
	" " 's'ource 'v'imrc)
nmap <silent> <leader>sv :so $MYVIMRC<cr>

" " Don't wrap lines
set nowrap
" " Display line numbers
set number
" " Automatically set the working directory to that of the current file
set autochdir
" " Indent options
set autoindent
set copyindent
" " Set indent size to 4 spaces
set shiftwidth=4
set shiftround
" " number of space char used when displaying TAB
set tabstop=4
set expandtab
" " ignore case if search pattern is all lowecase, case-sensitive otherwise
set smartcase
" " Insert tabs according to shiftwidth
set smarttab
" " Show search matches as you type
set incsearch
" " history
set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak,*.pyc,*.class
" " change the terminal's title
set title
" " Disable backup
set nobackup
set noswapfile
" " Switch to paste mode, disabling autoindenting
set pastetoggle=<F3>
"--------------------------------------------------------------------------
"NERD Tree plugin settings
"--------------------------------------------------------------------------
map <F2> :NERDTreeToggle<CR>

" " Remove menu bars from gvim
set guioptions-=m

" " Remove toolbars from gvim
set guioptions-=T

" " Remove scrollbars from gvim
set guioptions-=r


" Get that filetype stuff happening
filetype on
filetype plugin on
filetype indent on
"
" " Turn on that syntax highlighting
syntax on
"
" " Hides buffers instead of closing them
set hidden
"
" " Don't update the display while executing macros
set lazyredraw
"
" " At least let yourself know what mode you're in
set showmode
"
" " Enable enhanced command-line completion. Presumes you have compiled
" " with +wildmenu.  See :help 'wildmenu'
set wildmenu
"
"Set colorscheme xoria256
colorscheme xoria256

" " Allow to navigate into white space
set virtualedit=all
" Let's make it easy to edit this file (mnemonic for the key sequence is
" 'e'dit 'v'imrc)
nmap <silent> ,ev :e $MYVIMRC<cr>
" And to source this file as well (mnemonic for the key sequence is
" 's'ource 'v'imrc)
nmap <silent> ,sv :so $MYVIMRC<cr>
" When the page starts to scroll, keep the cursor 8 lines from
" the top and 8 lines from the bottom
set scrolloff=8

"autocmd bufneWfile *.html 0r $HOME/.vim/templates/html.tpl
autocmd bufneWfile * silent! 0r $HOME/.vim/templates/%:e.tpl

" If buffer modified, update any 'Last modified: ' in the first 20 lines.
" 'Last modified: ' can have up to 10 characters before (they are retained).
" Restores cursor and window position using save_cursor variable.
function! LastModified()
  if &modified
    let save_cursor = getpos(".")
    let n = min([20, line("$")])
    keepjumps exe '1,' . n . 's#^\(.\{,10}date: \).*#\1' .
          \ strftime('%Y-%m-%d %H:%M:%S') . '#e'
    call histdel('search', -1)
    call setpos('.', save_cursor)
  endif
endfun
autocmd BufWritePre * call LastModified()

autocmd BufLeave,FocusLost * silent! wall

" Compile Markdown
imap <F8> <ESC>:w!<CR>:!./md.sh<CR><CR>a
map <F8> :w!<CR>:!./md.sh<CR><CR>

