language message C

" provider
let g:python_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

let g:tex_conceal='admgs'
set conceallevel=2

" File
set noswapfile
set autoread
set hidden
autocmd! BufWritePre * :%s/\s\+$//ge

" Tab/Indent
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent
filetype plugin indent on

augroup indent
  autocmd!
  autocmd FileType sh setlocal tabstop=4 shiftwidth=4 softtabstop=4
  autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4
  autocmd FileType java setlocal tabstop=4 shiftwidth=4 softtabstop=4
augroup END

" Appearance
syntax enable
set termguicolors
set number
set ambiwidth=double
set laststatus=2
set list
set listchars=tab:▸-,trail:-
set scrolloff=4

" Search
set ignorecase
set smartcase
set wrapscan
set hlsearch

" Clipboard
set clipboard=unnamed

" lsp
augroup ccls
  autocmd!
  autocmd BufEnter *.c,*.cpp call Make4ccls()
augroup END

" command
command! Init :source ~/dotfiles/nvim/init.vim
