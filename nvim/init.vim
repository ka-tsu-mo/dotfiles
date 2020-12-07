" dein
if &compatible
	set nocompatible
endif

" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
	call dein#begin('~/.cache/dein')

	let s:toml_dir	= $XDG_CONFIG_HOME . '/nvim/toml'
	call dein#load_toml(s:toml_dir . '/dein.toml', {'lazy': 0})
	call dein#load_toml(s:toml_dir . '/dein_lazy.toml', {'lazy': 1})

	call dein#end()
	call dein#save_state()
endif

if dein#check_install()
	call dein#install()
endif

runtime! basic.vim
runtime! keymapping.vim

function! Make4ccls ()
	let l:current_file_extension =	expand('%:e')
	if current_file_extension == 'c'
		let l:command = 'gcc -std=c++14'
	elseif current_file_extension == 'cpp'
		let l:command = 'g++ -std=c++14'
	else
		echo 'Please open C/C++ file'
		return
	endif

	let l:current_file = expand('%:p')
	let l:current_dir = expand('%:h')
	let l:compile_commands = ["{", "\t\"directory\": \"" . l:current_dir . "\",", "\t\"command\": \"" . l:command . "\",", "\t\"file\": \"" . l:current_file . "\"", "}"]
	call writefile(compile_commands, current_dir . '/compile_commands.json')
endfunction
