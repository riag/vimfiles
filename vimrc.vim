set nocompatible

let s:current_path=expand("<sfile>:h")
let s:pathogen_path=s:current_path . "/bundle/vim-pathogen"
execute 'set rtp +=' . s:pathogen_path

let s:pathogen_path=s:current_path . "/bundle/"
execute pathogen#infect(s:pathogen_path . "{}")

filetype plugin indent on
filetype on

nmap <leader>ff :CtrlP <cr>
nmap <leader>fb :CtrlPBuffer <cr>
nmap <leader>fm :CtrlPMRU <cr>

set fileencodings=utf-8,gbk
set encoding=utf-8
set fileencoding=utf-8

let g:ConqueTerm_CodePage=936
let g:ConqueTerm_ReadUnfocused = 1
let g:ConqueTerm_InsertOnEnter = 1
let g:ConqueTerm_CWInsert = 1

syntax enable
set background=dark
colorscheme solarized

language messages en_US.UTF-8 

source $VIMRUNTIME/delmenu.vim  
source $VIMRUNTIME/menu.vim

set laststatus=2
set ruler

"let g:vimproc#dll_path=s:current_path . "/vimproc_win32.dll"
let g:neocomplcache_enable_at_startup = 1
"let g:vimshell_enable_debug = 1

if executable('ag')
	let g:unite_source_grep_command = 'ag'	
	let g:unite_source_grep_default_opts =
		  \ '--line-numbers --nocolor --nogroup --hidden --ignore ' .
		  \  '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
	let g:unite_source_grep_recursive_opt = ''

endif

let g:session_autosave='yes'

let s:local_vimrc_path=s:current_path . "/local_vimrc.vim"
if filereadable(s:local_vimrc_path)
	execute 'source ' . s:local_vimrc_path
endif
