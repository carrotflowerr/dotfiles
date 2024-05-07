colorscheme habamax
set linespace=0

set linebreak

set spell spelllang=en_us

" Auto-complete pairs of parentheses

inoremap        {  {}<Left>
inoremap <expr> }  strpart(getline('.'), col('.')-1, 1) == "}" ? "\<Right>" : "}"

inoremap        (  ()<Left>
inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"

inoremap        [  []<Left>
inoremap <expr> ]  strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"



" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Use system clipboard
set nocompatible
set clipboard=unnamedplus

" Newline, if this doesn't work you need a version of vim with gtk. Use newest version possible. 
"nmap Ctrl-o o<Esc>k
"nmap Ctrl-O O<Esc>j
"nmap <CR> o<Esc>k
"nmap Ctrl-CR O<Esc>j

set autoindent             
set expandtab              " Use spaces instead of tabs.
set softtabstop =2         " Tab key indents by 2 spaces.
set shiftwidth  =2         " >> indents by 2 spaces.
set shiftround             " >> indents to next multiple of 'shiftwidth'.
set number
"set backspace   =indent,eol,start  " Make backspace work as you would expect.
set hidden                 " Switch between buffers without having to save first.
set laststatus  =2         " Always show statusline.
" set display     =lastline  " Show as much as possible of the last line.

set showmode               " Show current mode in command-line.
set showcmd                " Show already typed keys when more are expected.

set incsearch              " Highlight while searching with / or ?.
set hlsearch               " Keep matches highlighted.

"set ttyfast                " Faster redrawing.
"set lazyredraw             " Only redraw when necessary.

"set splitbelow             " Open new windows below the current window.
"set splitright             " Open new windows right of the current window.

set cursorline             " Find the current line quickly.
set wrapscan               " Searches wrap around end-of-file.
set report      =1         " Always report changed lines.
"set synmaxcol   =200       " Only highlight the first 200 columns.

"set nobackup

set updatecount =100
set undofile
set undodir     =$HOME/.vim/files/undo/
