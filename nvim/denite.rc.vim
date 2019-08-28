let s:menus = {}
let s:menus.vim = { 'description' : 'Vim' }
let s:menus.vim.file_candidates = [
    \ ['init.vim', '~/dotfiles/nvim/init.vim'],
    \ ['basic.vim', '~/dotfiles/nvim/basic.vim'],
    \ ['keymapping.vim', '~/dotfiles/nvim/keymapping.vim'],
    \ ['denite', '~/dotfiles/nvim/denite.rc.vim'],
    \ ['plugins', '~/dotfiles/nvim/toml/dein.toml'],
    \ ['lazy plugins', '~/dotfiles/nvim/toml/dein_lazy.toml']
    \ ]
let s:menus.zsh = { 'description' : 'Zsh' }
let s:menus.zsh.file_candidates = [
    \ ['.p10k.zsh', '~/dotfiles/zsh/.p10k.zsh'],
    \ ['zshenv', '~/dotfiles/zsh/.zshenv'],
    \ ['zshrc', '~/dotfiles/zsh/.zshrc'],
    \ ['zpreztorc', '~/dotfiles/zsh/.zpreztorc']
    \ ]
call denite#custom#var('menu', 'menus', s:menus)

if executable('rg')
  call denite#custom#var('file/rec', 'command', ['rg', '--files'])
  call denite#custom#var('grep', 'command', ['rg'])
  call denite#custom#var('grep', 'recursive_opts', [])
  call denite#custom#var('grep', 'final_opts', [])
  call denite#custom#var('grep', 'separator', ['--'])
  call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep', '--no-heading'])
endif
