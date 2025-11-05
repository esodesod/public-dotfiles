syntax on
set number
set relativenumber

" identing
filetype plugin indent on
set autoindent
set smartindent
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set backspace=indent,eol,start

" yank to clipboard
set clipboard=unnamedplus

" searching
set ignorecase
set showmatch
" show where the pattern, as it was typed so far, matches
set incsearch
" highlight search match
set hlsearch

" paste toogle
set pastetoggle=<F10>

" map gd for tag command, as tricky keycombo on Norwegian keyboards
nmap gd <C-]>

" fzf
set rtp+=/opt/homebrew/opt/fzf
