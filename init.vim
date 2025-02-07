" Zimblo's neovim config
" needs vim-plug
" Compatible with both vim and neovim.
" Plugins

call plug#begin()

  " Behavior
  Plug 'ThePrimeagen/vim-be-good'
  Plug 'mhinz/vim-startify'
  " Plug 'folke/zen-mode.nvim'
  "Plug 'folke/which-key.nvim'
  "Plug 'vimwiki/vimwiki'

  " Movement
  Plug 'easymotion/vim-easymotion'
  "Plug 'justinmk/vim-sneak'

  " Theme
  Plug 'xero/sourcerer.vim'

  " File
  "Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  "Plug 'junegunn/fzf.vim'
  Plug 'tmsvg/pear-tree'
  Plug 'tpope/vim-sensible'
  Plug 'sheerun/vim-polyglot'
  
  " Language server
  Plug 'prabirshrestha/vim-lsp'
  Plug 'mattn/vim-lsp-settings'
  Plug 'prabirshrestha/asyncomplete.vim'
  Plug 'prabirshrestha/asyncomplete-lsp.vim'

call plug#end()

"set guifont=Terminus\ 12
set guifont=Fixedsys\ Excelsior:h16
"set noanti

colorscheme sourcerer
"set background=dark " for the light version
" Airline status bar
let g:airline_theme='one'

" Startify Bookmarks
let g:startify_bookmarks = [ {'t': '~/Documents/notes/todo.txt'},{'v': '~/.config/nvim/init.vim'},{'b': '~/.bashrc'}, {'s': '~/.config/sway/config'} ]

" Bind Ctrl-s to open start page
nnoremap <C-s> :Startify<CR>

" Disable mouse
"set mouse=

" Use this on laptop 
"inoremap jj <ESC>
"inoremap <Tab> <Esc>
"inoremap <CR> <Esc>

" Spell Check (z=)
" zg - add to dictionary
" zw - mark as incorrect
set spell spelllang=en_us

" Bind Ctrl-f to Explore
nnoremap <C-f> :Explore<CR>
" Bind Ctrl-` to open a terminal
set shell=/usr/bin/bash
nnoremap <C-`> :term<CR>

" Bind Ctrl-z to enable/disable Zen Mode
" nnoremap <C-z> :ZenMode<CR>


" Bind Ctrl-t to open a new tab
nnoremap <C-t> :tabnew<CR>
nnoremap <C-q> :tabclose<CR>
nnoremap <Tab> :tabnext<CR>
nnoremap <C-Tab> :tabprevious<CR>

" Bind Alt-L to open new vertical window
" Ctrl-W-W moves between windows
nnoremap <A-l> :vsp<CR>


" Backspace to change in word
nnoremap <BS> ciw

" Return to last edit position when opening files 
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Session saving, this might also work. idk, try it.
"set sessionoptions=blank,buffers,curdir,folds,help,tabpages,winsize,localoptions

" Word splitting
set iskeyword+=-

" Insert timestamp
"nnoremap <C-d> "=strftime("%-l:%M%p")<CR>P
nnoremap <C-d> "=strftime("%F")<CR>P

" Unbind arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Use system clipboard
set nocompatible
set clipboard=unnamedplus

" Newline, if this doesn't work you need a version of vim with gtk. Use newest version possible. 
nmap <CR> o<Esc>k
nmap Ctrl-CR O<Esc>j

" set display     =lastline  " Show as much as possible of the last line.
"set backspace   =indent,eol,start  " Make backspace work as you would expect.
"set nobackup
"set synmaxcol   =200       " Only highlight the first 200 columns.
"set ttyfast                " Faster redrawing.
"set expandtab              " Use spaces instead of tabs.
filetype plugin on
set noreadonly
set autoindent             
set nohlsearch " no highlighting on search"
set cursorline             " Find the current line quickly.
set hidden                 " Switch between buffers without having to save first.
set hlsearch               " Keep matches highlighted.
set incsearch              " Highlight while searching with / or ?.
set laststatus  =2         " Always show statusline.
set lazyredraw             " Only redraw when necessary.
set linebreak
set linespace=0
set number
set report      =1         " Always report changed lines.
set shiftround             " >> indents to next multiple of 'shiftwidth'.
set shiftwidth  =2         " >> indents by 2 spaces.
set showcmd                " Show already typed keys when more are expected.
set showmode               " Show current mode in command-line.
set softtabstop =2         " Tab key indents by 2 spaces.
set splitbelow             " Open new windows below the current window.
set splitright             " Open new windows right of the current window.
set undofile
set updatecount =100
set wrapscan               " Searches wrap around end-of-file.
