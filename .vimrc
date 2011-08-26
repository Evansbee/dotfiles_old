"Make the cool stuff happen by breaking compatbility
set nocompatible

" Line numbers rock
set number

" show what's being typed
set showcmd

" enable syntax highlighting
filetype on
filetype plugin on
syntax enable

"auto indent stuff
set autoindent

"spaces>tabs
set expandtab
set smarttab

"better spacing
set shiftwidth=3
set softtabstop=3

"ignore case on searches (or do smartcase)
set ignorecase
set smartcase

"make "jj" leave insert mode -- awesome
inoremap jj <Esc>

"inc search starts the search while you tuype
set incsearch

"highlight search results
set hlsearch

"Status line gnarliness
hi StatusLine term=reverse ctermbg=darkgrey ctermfg=white
set laststatus=2
set statusline=%F\ [%M%R]%=%y\ [%l/%L]

au InsertEnter * hi StatusLine term=reverse ctermbg=yellow ctermfg=black
au InsertLeave * hi StatusLine term=reverse ctermfg=white ctermbg=darkgrey

"remap the search so that the line jumps to center
map n nzz 
map N Nzz

"killer colorsheme
colorscheme xoria256
