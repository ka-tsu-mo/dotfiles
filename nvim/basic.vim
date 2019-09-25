language message C

" provider
let g:python_host_prog = '/usr/local/bin/python2'
let g:python3_host_prog = '/usr/local/bin/python3'

" File
set noswapfile
set autoread
set hidden
autocmd BufWritePre * :%s/\s\+$//ge

" Appearance
syntax enable
colorscheme molokai
highlight! Normal ctermbg=NONE guibg=NONE
highlight! NonText ctermbg=NONE guibg=NONE
highlight! LineNr ctermbg=NONE guibg=NONE
set number
set ambiwidth=double
set laststatus=2
set list
set listchars=tab:▸-,trail:-
set scrolloff=3

" Tab/Indent
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent
filetype plugin indent on

autocmd FileType sh setlocal tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 noexpandtab

" Search
set ignorecase
set smartcase
set wrapscan
set hlsearch

" Clipboard
set clipboard=unnamed
