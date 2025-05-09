set nu
call plug#begin('~/.vim/plugged')
" tab autocomplete
Plug 'ervandew/supertab'
" coc auto complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" vim-airline
Plug 'Vim-airline/vim-airline'
Plug 'Vim-airline/vim-airline-themes'  

" matlab
Plug 'daeyun/vim-matlab'

" ranger file browser
Plug 'kevinhwang91/rnvimr'

" vim-snazzy 主题插件
Plug 'connorholyday/vim-snazzy'

call plug#end()

let g:airline#extensions#tabline#enabled = 1
" 配置 ranger 文件浏览器插件
let g:rnvimr_ex_enable = 1   
" Alt+o 打开 ranger                                       
nnoremap <silent> <M-o> :RnvimrToggle<CR>
"Alt+加号 切换至下一个标签，减号则是切换回上一个
nnoremap <M-+> :bp<CR> 
nnoremap <M--> :bn<CR>

" 配置 vim-snazzy 主题插件
colorscheme snazzy
let g:SnazzyTransparent = 1

" let g:terminal_color_4 = '#ff0000'
" let g:terminal_color_5 = 'green'

set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8

map t :tabnew<CR>

inoremap {<CR> {<CR>}<C-o>O
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap " ""<Esc>i

" for indent
set ts=2
set shiftwidth=2

autocmd BufNewFile *.cpp,*.[ch],*.hpp,*.sh,*.java,*.m,*.plt exec ":call SetTitle()"

func SetTitle()
	if expand("%:e") == 'sh'
		call append(0,"\##########################################################")
		call append(1,"\# File Name: ".expand("%"))
		call append(2,"\# Author: Yang Kuang")
		call append(3,"\# mail: ykuang@gdut.edu.cn")
		call append(4,"\# Created Time: ".strftime("%F"))
		call append(5,"\# brief   ")
		call append(6,"\###########################################################")
		call append(7,"")
		call append(8,"\#!/bin/bash")
		call append(9,"")
	endif
	if expand("%:e") == 'm'
		call append(0,"function = ".expand("%:t:r"))
		call append(1,"% Author: Yang Kuang")
		call append(2,"% mail: ykuang@gdut.edu.cn")
		call append(3,"% Created Time: ".strftime("%F"))
		call append(4,"% ")
		call append(5,"% Usage:") 
		call append(6,"% Input:")
		call append(7,"% Output:")
	endif
	if expand ("%:e") == 'h'
		call append(0,"/**") 
		call append(1,"* Copyright (C) ".strftime("%Y")." All rights reserved.") 
		call append(2,"* @file ".expand("%")) 
		call append(3,"* @brief  ")
		call append(4,"* @author Yang Kuang (ykuang@gdut.edu.cn)") 
		call append(5,"* @date ".strftime("%F"))
		call append(6,"* @return ")
		call append(7,"*/")
		call append(8,"")
		call append(9,"#ifndef __".toupper(expand("%:t:r"))."_H__")
		call append(10,"#define __".toupper(expand("%:t:r"))."_H__")
		call append(11,"")
		call append(12,"")
		call append(13,"")
		call append(14,"#endif ///".toupper(expand("%:t:r"))."_H__")
		call append(11,"")
	endif
	if expand("%:e") == 'cpp'
		call append(0,"/**") 
		call append(1,"* Copyright (C) ".strftime("%Y")." All rights reserved.") 
		call append(2,"* @file ".expand("%")) 
		call append(3,"* @brief  ")
		call append(4,"* @author Yang Kuang (ykuang@gdut.edu.cn)") 
		call append(5,"* @date ".strftime("%F"))
		call append(6,"* @return ")
		call append(7,"*/")
		call append(8,"")
		call append(9,"#include <iostream>")
		call append(10,"using namespace std;")
		call append(11,"")
	endif
	if expand("%:e") == 'c'
		call append(0,"/**") 
		call append(1,"* Copyright (C) ".strftime("%Y")." All rights reserved.") 
		call append(2,"* @file ".expand("%")) 
		call append(3,"* @brief  ")
		call append(4,"* @author Yang Kuang (ykuang@gdut.edu.cn)") 
		call append(5,"* @date ".strftime("%F"))
		call append(6,"* @return ")
		call append(7,"*/")
		call append(8,"")
		call append(9,"#include <stdio.h>")
		call append(10,"")
	endif
	if expand("%:e") == 'plt'
		call append(0,"set terminal epslatex  standalone color  font \",12\" size 5,3.5")
		call append(1,"set output \".tex\"")
		call append(2,"set logscale y")
		call append(3,"set format y '$10^{%T}$'")
		call append(4,"set key box")
		call append(5,"set xlabel ''")
		call append(6,"set ylabel ''")
		call append(8,"plot ")
	endif
endfunc 
