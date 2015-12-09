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
set ff=unix

syntax enable
set background=dark
colorscheme solarized

language messages en_US.UTF-8 

source $VIMRUNTIME/delmenu.vim  
source $VIMRUNTIME/menu.vim

set laststatus=2
set ruler

"  解决 vim-multiple-cursors 在gvim下不能正常工作的问题
if has("gui")
	set selection=inclusive
endif

" vimproc.vim
" Global options definition. "{{{
" Set the default of g:vimproc_dll_path by judging OS "{{{
if vimproc#util#is_windows()
  let s:vimproc_dll_basename = has('win64') ?
        \ 'vimproc_win64.dll' : 'vimproc_win32.dll'
elseif vimproc#util#is_cygwin()
  let s:vimproc_dll_basename = 'vimproc_cygwin.dll'
elseif vimproc#util#is_mac()
  let s:vimproc_dll_basename = 'vimproc_mac.so'
elseif glob('/lib*/ld-linux*64.so.2',1) != ''
  let s:vimproc_dll_basename = 'vimproc_linux64.so'
elseif glob('/lib*/ld-linux*.so.2',1) != ''
  let s:vimproc_dll_basename = 'vimproc_linux32.so'
elseif system('uname -s') =~? '^.\+BSD\n$'
  let s:vimproc_dll_basename = system(
        \ 'uname -sm | tr "[:upper:]" "[:lower:]"'
        \ .' | sed -e "s/ /_/" | xargs -I "{}" echo vimproc_{}.so')[0 : -2]
else
  let s:vimproc_dll_basename = 'vimproc_unix.so'
endif
"}}}

let s:vimpro_dll_path=s:current_path . "/lib/" . s:vimproc_dll_basename
" 只有文件存在才设置 g:vimproc#dll_path
if executable(s:vimpro_dll_path)
	let g:vimproc#dll_path=s:vimpro_dll_path
endif


" neocomplcache.vim
let g:neocomplcache_enable_at_startup = 1

" vim-airline
let g:airline_theme='bubblegum'
"let g:airline_solarized_bg='light'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' ' 
"let g:airline#extensions#tabline#left_alt_sep = '|'

let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline#extensions#tabline#show_tab_nr = 1

"unite.vim
call unite#custom#profile('default', 'context', {
\   'start_insert': 1,
\   'prompt-focus': 1,
\   'keep_focus': 1,
\   'prompt': '>>>',
\   'winheight': 10,
\   'direction': 'botright',
\ })

call unite#custom#profile('source/grep', 'context', {
		\   'no_quit' : 1,
		\ })

nmap <leader>fg :Unite grep 

if executable('ag')
	let g:unite_source_grep_command = 'ag'	
	let g:unite_source_grep_default_opts =
		  \ '--line-numbers --nocolor --nogroup --hidden --ignore ' .
		  \  '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
	let g:unite_source_grep_recursive_opt = ''
endif

" vim-session 
let g:session_autosave='yes'
let g:session_autoload='no'

let g:scratch_autohide = 1



let s:local_vimrc_path=s:current_path . "/vimrc.vim.local"
if filereadable(s:local_vimrc_path)
	execute 'source ' . s:local_vimrc_path
endif
