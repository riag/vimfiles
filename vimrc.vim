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
