set nocompatible

let s:current_path=expand("<sfile>:h")
let s:pathogen_path=s:current_path . "/bundle/vim-pathogen"
execute 'set rtp +=' . s:pathogen_path

let s:pathogen_path=s:current_path . "/bundle/"
execute pathogen#infect(s:pathogen_path . "{}")

filetype plugin indent on
filetype on

nmap <leader>fb :FufBuffer<cr>
nmap <leader>ff :FufFile<cr>

syntax enable
set background=dark
colorscheme solarized



