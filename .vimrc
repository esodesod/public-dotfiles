" pretty colors
syntax on

" display relative line number
set relativenumber

" identing
set autoindent

" map gd for tag command (a bit tricky on a Norwegian keyboard)
nmap gd <C-]>

" searching
set ignorecase
set showmatch
" show where the pattern, as it was typed so far, matches
set incsearch
" highlight search match
set hlsearch

" paste toogle
set pastetoggle=<F10>

" yank to clipboard
set clipboard=unnamed

" fzf
set rtp+=/opt/homebrew/opt/fzf
