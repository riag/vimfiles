# vimfiles
## 用到的插件
 * [EasyMotion](https://github.com/Lokaltog/vim-easymotion)
 * [vim-airline](https://github.com/bling/vim-airline)
 * [ctrlp](https://github.com/kien/ctrlp.vim)
 * [vim-expand-region](https://github.com/terryma/vim-expand-region)
 * [vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors)
 * [vim-colors-solarized](https://github.com/altercation/vim-colors-solarized)
 * [vim-golang](https://github.com/jnwhiteh/vim-golang)
 * [vim-pathogen](https://github.com/tpope/vim-pathogen)
 * [vim-session](https://github.com/xolox/vim-session)
 * [neocomplcache.vim](https://github.com/Shougo/neocomplcache.vim)
 * [unite.vim](https://github.com/Shougo/unite.vim)


## 配置
大部分插件都使用默認配置,下面列出的是我定制的配置
如果你想修改配置，请复制 local_vimrc.vim.tpl , 改名为 local_vimrc.vim , 在这个文件里配置

### ctrlp
```
nmap <leader>ff :CtrlP <cr>
nmap <leader>fb :CtrlPBuffer <cr>
nmap <leader>fm :CtrlPMRU <cr>
```
ctrlp 默认缓存数据加快打开速度，所以在查找文件时就存在一点问题，有些新建的文件会找不到，这时可以在 ctrlp 里按 `F5` 更新数据 

### vim-airline
安装了 `powerline font` 字体后，才能使用下面的配置
```
let g:airline_powerline_fonts = 1
```
gvim 还需要设置字体，建议使用 `Ubuntu Mono derivative` 字体, 字体可在这里下载 https://github.com/powerline/fonts
windows下安装字体很简单，双击ttf字体文件就可以了，linux下安装字体见这里 https://powerline.readthedocs.org/en/latest/installation/linux.html#fonts-installation
```
if has('gui')
	if has('win32')
		set guifont=Ubuntu_Mono_derivative_Powerlin:h12:cANSI
	else
		set guifont=Ubuntu\ Mono\ derivative\ Powerline:12
	endif
endif
```
cygwin 下使用 `consolas-font-for-powerline` 字体, 在这里下载 https://github.com/runsisi/consolas-font-for-powerline
mintty 设置使用该字体就可以了

### vim-session 
可以使用下面的配置修改session默认保存的路径
```
let g:session_directory="G:/devel/vim-sessions"
```
vim虽然没有project的概念，但有session，可以把一个sessioin当作project来使用
使用 `SaveSession` 命令保存session，使用 `OpenSession` 命令加载session, 只要加载了session，vim关闭时会自动保存

### unite.vim
部分功能依赖 vimproc.vim 插件，需要编译一个动态库文件，具体的编译可以看这里的说明 https://github.com/Shougo/vimproc.vim
如果使用的是windows系统，可以直接下载二进制文件 https://github.com/Shougo/vimproc.vim/releases
把动态库文件复制到 lib 目录下，也可以直接修改 `g:vimproc#dll_path` 指向动态库文件

`Unite grep` 命令默认使用 `grep` 来搜索文件，建议使用 `ag` 替换原来的 `grep`，具体的编译看这里 https://github.com/ggreer/the_silver_searcher 
把ag可执行文件路径加入到windows的环境变量PATH就可以了

还有一些有用的命令
```
Unite command  查看vim的Ex命令
Unite function 查看vim的内部函数
Unite mapping  查看vim键盘映射配置
```

### scratch.vim
使用默认配置，在普通模式(normal mode)或可视模式(virtual mode)下使用 `gS` 快捷键打开 scratch

### NERDCommenter 
使用默认配置。
```
<leader> cc : 注释选中的文字
<leader> cu : 取消注释 
<leader> c<space>: 注释/取消注释选中的文字
```
