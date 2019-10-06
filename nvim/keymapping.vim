inoremap jj <ESC>

" curosr movement
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
inoremap <C-p> <UP>
inoremap <C-n> <DOWN>
inoremap <C-a> <HOME>
inoremap <C-e> <END>

" Window/Tab
nnoremap s <Nop>
nnoremap <silent> ss :<C-u>sp<CR>
nnoremap <silent> sv :<C-u>vs<CR>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sr <C-w>r

nnoremap <silent><ESC><ESC> :<C-u>noh<CR>

" Release keymappings for plugin
nnoremap ; <Nop>
