
let s:current_path=expand("<sfile>:h")

let g:session_directory="G:/devel/vim-sessions"

" widnows 下安装 https://github.com/runsisi/consolas-font-for-powerline
" 这些字体
" mitty 使用 该字体后 zsh也能使用 powerline 效果
"if has ('win32') 
"	set guifont=Powerline_Consolas:h9:cANSI 
"else 
"	set guifont=Powerline\ Consolas\ 10 
"endif
if has('gui')
	if has('win32')
		set guifont=Ubuntu_Mono_derivative_Powerlin:h12:cANSI
	else
		set guifont=Ubuntu\ Mono\ derivative\ Powerline:12
	endif
endif
let g:airline_powerline_fonts = 1

