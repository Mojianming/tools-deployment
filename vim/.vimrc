"""" my vim setting """"
" 定义快捷键的前缀，即 <Leader>
let mapleader=";"

" 开启文件类型侦测
filetype on
" 根据侦测到的不同类型加载对应的插件
filetype plugin on

" 定义快捷键到行首和行尾
nmap LB 0
nmap LE $

" 设置paste模式快捷键
set pastetoggle=<F2>
" 设置快捷键将选中文本块复制至系统剪贴板
vnoremap <Leader>y "+y
" 设置快捷键将系统剪贴板内容粘贴至vim
nmap <Leader>p "+p

" 定义快捷键关闭当前分割窗口
nmap <Leader>q :q<CR>
" 定义快捷键保存当前窗口内容
nmap <Leader>w :w<CR>
" 定义快捷键保存所有窗口内容并退出 vim
nmap <Leader>WQ :wa<CR>:q<CR>
" 不做任何保存，直接退出 vim
nmap <Leader>Q :qa!<CR>

" 设置快捷键遍历子窗口
" 依次遍历
nnoremap nw <C-W><C-W>
" 跳转至右方的窗口
nnoremap <Leader>lw <C-W>l
" 跳转至方的窗口
nnoremap <Leader>hw <C-W>h
" 跳转至上方的子窗口
nnoremap <Leader>kw <C-W>k
" 跳转至下方的子窗口
nnoremap <Leader>jw <C-W>j

" 定义快捷键在结对符之间跳转
nmap <Leader>c %

" 输入%%，自动展开为活动缓冲区所在目录的路径
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" >> 让配置变更立即生效 <<
autocmd BufWritePost $MYVIMRC source $MYVIMRC

" >>>> 插件安装 <<<<
" vundle 环境设置
filetype off
" 插件列表必须位于 plug#begin() 和 plug#end() 之间
call plug#begin('~/.vim/plugged')

" 自定义主题
Plug 'mojianming/molokai'

" 自动匹配html标签，支持在标签间跳转
Plug 'Valloric/MatchTagAlways'

" 快速编写html
Plug 'mattn/emmet-vim'

" 自动闭合hmtl标签
Plug 'alvan/vim-closetag'

" 多光标操作
Plug 'terryma/vim-multiple-cursors'

" 颜色显示
Plug 'gko/vim-coloresque'

" 快速给单词添加 单引号，双引号，中括号等
Plug 'tpope/vim-surround'

" 书签可视化的插件
Plug 'kshenoy/vim-signature'

" js 语法高亮
Plug 'othree/yajs.vim'

" 去除空格
Plug 'bronson/vim-trailing-whitespace'

" 快速注释
Plug 'scrooloose/nerdcommenter'

" 文件大纲outline
Plug 'majutsushi/tagbar'

" 目录树
Plug 'scrooloose/nerdtree'

" 目录树 git 插件
Plug 'Xuyuanp/nerdtree-git-plugin'

" 主题相关
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'

" tabline git 插件
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" 文件搜索
Plug 'Yggdroot/LeaderF'

" 窗口选择
Plug 't9md/vim-choosewin'

" 快捷键选中 <>、[]、{} 中间的内容
Plug 'gcmt/wildfire.vim'

" 缩进指示线
Plug 'Yggdroot/indentLine'

" 快速移动
Plug 'easymotion/vim-easymotion'

" 自动插入和格式化括号
Plug 'jiangmiao/auto-pairs'

" 语法检测
Plug 'vim-syntastic/syntastic'

" vue 语法高亮
Plug 'posva/vim-vue'

" 自动补全
Plug 'Valloric/YouCompleteMe'

" 插件列表结束
call plug#end()
filetype plugin indent on

" >>>> 插件设置 <<<<
"
" >> MatchTagAlways <<
nnoremap <leader>! :MtaJumpToOtherTag<cr>

" >> emmet-vim <<
let g:user_emmet_leader_key = '<C-e>'
let g:user_emmet_expandabbr_key = '<C-e><C-e>'

" >> vim-multiple-cursors <<
" 关闭默认映射键
let g:multi_cursor_use_default_mapping = 0
" 修改触发
let g:multi_cursor_next_key='<C-p>'
let g:multi_cursor_prev_key='<C-o>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" >> nerdcommenter <<
" 在注释符默认添加空格
let g:NERDSpaceDelims = 1
" 设置语言默认使用备用定界符
let g:NERDAltDelims_python = 1
" 启用时修整尾随空格注释
let g:NERDTrimTrailingWhitespace = 1
" 快速注释,_表示/
map <C-_> <plug>NERDCommenterToggle
" map <C-/> <plug>NERDCommenterToggle
" 添加自定义格式或覆盖默认值。
" let g:NERDCustomDelimiters = { 'html': { 'left': '/**','right': '*/' } }
" 允许注释和转换空行
" let g:NERDCommentEmptyLines = 1

" >> tagbar <<
" 配置快捷键打开tagbar窗口
nnoremap <silent> <leader>o :TagbarToggle<CR>
" 设置打开 tagbar 光标不跳转
let g:tagbar_autofocus = 0
" 设置 tagbar 窗口的宽度
let g:tagbar_width = 27
let g:tagbar_compact = 1
let g:tagbar_indent = 1
" 折叠级别
let g:tagbar_foldlevel = 2
" 不排序
let g:tagbar_sort = 0
" 设置 tagbar 子窗口的位置出现在主编辑区的左边
let tagbar_left=1

" >> nerdtree <<
" 打开vim启动NERDTree,光标不跳转
" autocmd vimenter * NERDTree
" wincmd w
autocmd vimenter * wincmd w
" open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" 配置快捷键
map <C-n> :NERDTreeToggle<CR>
nmap <leader>t :NERDTreeFind<CR>
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" 修改默认箭头
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
" 将nerdtree 的窗口设置在vim窗口的右边
let NERDTreeWinPos = "rigth"
let NERDTreeWinSize = 26
" 当打开NERDTree窗口时,自动显示bookmarks
let NERDTreeShowBookmarks = 0
" 设置忽略文件类型"
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1
" 不显示隐藏文件
let NERDTreeShowHidden=0

" >> nerdtree-git-plugin <<
let g:NERDTreeShowIgnoredStatus = 1
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

" 设置状态栏主题风格
" 顶部tabline显示方式
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" >> vim-airline <<
" 是否启用顶部tabline
let g:airline#extensions#tabline#enabled = 1
" 启用修改检测
let g:airline_detect_modified = 1
let g:airline_left_sep='>'
let g:airline_right_sep='<'
" 主题
let g:airline_theme='dark'
" 使用缓存
let g:airline_highlighting_cache = 0
" 关闭自加载扩展模块
let g:airline#extensions#disable_rtp_load = 1
let g:airline_extensions = ['branch', 'tabline', 'hunks']
" vim-fugitive
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#empty_message = ''
let g:airline#extensions#branch#format = 2
let g:airline#extensions#branch#sha1_len = 4
let g:airline#extensions#branch#vcs_priority = ["git"]
" vim-gitgutter
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#hunks#non_zero_only = 0
let g:airline#extensions#hunks#hunk_symbols = ['+', '~', '-']
" airline-tabline
let g:airline#extensions#tabline#buffers_label = 'B'
let g:airline#extensions#tabline#tabs_label = 'T'
" 显示标签页序号
let g:airline#extensions#tabline#tab_nr_type = 2

let g:airline#extensions#tabline#show_close_button = 0

" 设置标签页码，同<leader>number跳转
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab

" >> vim-choosewin <<
" 窗口选择配置
nmap <leader>m <Plug>(choosewin)
" 窗口显示窗口号
let g:choosewin_overlay_enable = 1

" >> wildfire.vim <<
" 快捷键选中 <>、[]、{} 中间的内容
" This selects the next closest text object.
map <leader><Space> <Plug>(wildfire-fuel)
" This selects the previous closest text object.
vmap <C-Space> <Plug>(wildfire-water)
nmap <leader>s <Plug>(wildfire-quick-select)

" 缩进指示线 Yggdroot/indentLine
let g:indentLine_char = '┊'
let g:indentLine_faster = 1


" >> easymotion <<
" 关闭默认的映射
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
nmap <Space>f <Plug>(easymotion-f)
nmap <Space>F <Plug>(easymotion-F)
nmap <Space>t <Plug>(easymotion-t)
nmap <Space>T <Plug>(easymotion-T)
map <Space>w <Plug>(easymotion-w)
map <Space>W <Plug>(easymotion-W)
map <Space>b <Plug>(easymotion-b)
map <Space>B <Plug>(easymotion-B)
map <Space>e <Plug>(easymotion-e)
map <Space>E <Plug>(easymotion-E)
map <Space>ge <Plug>(easymotion-ge)
map <Space>gE <Plug>(easymotion-gE)
map <Space>j <Plug>(easymotion-j)
map <Space>k <Plug>(easymotion-k)
map <Space>n <Plug>(easymotion-n)
map <Space>N <Plug>(easymotion-N)
map <Space>s <Plug>(easymotion-s)


" >> syntastic <<
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_mode_map = { 'mode': 'active',
                            \ 'active_filetypes': ['python',
                            \ 'javascript', 'html', 'sh'],
                            \ 'passive_filetypes': [] }
let g:syntastic_python_checkers = ['pycodestyle']
" 忽略 E501 错误
let g:syntastic_python_pycodestyle_args='--ignore=E501,E731,E402'
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_html_checkers = ['eslint']
" 设置错误符号
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_error_symbol = '💩'
let g:syntastic_style_warning_symbol = '💩'

" 自动跳转到第一个错误处
let g:syntastic_auto_jump = 3
" 文件打开时检测到错误弹出列表窗口
let g:syntastic_auto_loc_list = 1

" youcompleteme
" 从第1个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion = 1
" 让Vim的补全菜单行为与一般IDE一致
set completeopt=longest,menu
let g:ycm_python_binary_path = '/usr/bin/python3'
" 在注释输入中也能补全
let g:ycm_complete_in_comments = 1
" 语法关键字补全
let g:ycm_seed_identifiers_with_syntax = 1
" 关闭加载.ycm_extra_conf.py提示
let g:ycm_confirm_extra_conf=0
" 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_cache_omnifunc = 0
" 跳转到定义处
nnoremap <leader>jd :YcmCompleter GoTo<CR>
" 离开插入模式后自动关闭预览窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" >> 配置 vim-trailing-whitespace <<
" 去掉行尾空格键
map <Leader><leader><space> :FixWhitespace <cr>

" >> 个性化设置 <<
" 字符限制
set colorcolumn=120

" 开启实时搜索功能
set incsearch

" 搜索时大小写不敏感
set ignorecase

" 关闭兼容模式
set nocompatible

" vim 自身命令行模式智能补全
set wildmenu

" 禁用swap文件
set noswapfile

" 禁用备份
set nowritebackup
set nobackup

" 鼠标
set mouse=a

" 禁止光标闪烁
set gcr=a:block-blinkon0
" 不要闪烁
set novisualbell

" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
set guioptions+=c        " 使用字符提示框
set guioptions-=b        " 隐藏底部滚动条

" 配色方案
set background=dark
"colorscheme solarized
colorscheme molokai
"colorscheme phd

" 禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T

" 总是显示状态栏
set laststatus=2

" 显示光标当前位置
set ruler

" 显示绝对行号
set number
" 显示相对行号
set relativenumber

" 高亮显示当前行/列
set cursorline
set cursorcolumn

" 高亮显示搜索结果
set hlsearch

" 设置 gvim 显示字体
set guifont=YaHei\ Consolas\ Hybrid\ 10.5

"
set encoding=utf-8

" 禁止折行
"set nowrap

" 如果搜索模式包含大写字符，不使用 'ignorecase' 选项
set smartcase

" 设置匹配模式，显示匹配的括号
set showmatch

" 命令行显示输入的命令
set showcmd

" 以缩进作为折叠
set foldmethod=indent
set foldlevel=1

" 设置状态栏主题风格
let g:Powerline_colorscheme='solarized256'

" 开启语法高亮功能
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on

" 拼写检查
"set spell
"autocmd FileType tex setlocal spell spelllang=en_us,cjk

" 自适应不同语言的智能缩进
filetype indent on

" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4
" shell 缩进为2个空格
autocmd FileType sh set tabstop=2 | set shiftwidth=2 | set softtabstop=2

" 回溯历史命令
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

set helplang=cn

" 戒调使用光标键映射
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" 新建.py,.sh文件，自动插入文件头
autocmd BufNewFile *.py,*.sh,*.txt exec ":call Title()"
" 定义函数setTitle，自动插入文件头
func! Title()
   if &filetype == 'sh'
       call setline(1,"#!/bin/bash")
       call append(line("."),"set -x")
       call append(line("."),"set -e")
       call append(line(".")+2,"")
       " call append(line(".")+3,"# TODO: ")
       call append(line(".")+4,"")
   elseif &filetype == 'python'
       call setline(1,"#! /usr/bin/env python")
       call append(line("."),"# -*-coding=utf-8-*-")
       call append(line(".")+1,"")
       call append(line(".")+2,"__author__ = \'".$USER."\'")
       call append(line(".")+3,"")
       " call append(line(".")+4,"# TODO: ")
       call append(line(".")+5,"")
   else
       call setline(1,"/******************************************************")
       call append(line("."),"   > File Name: ".expand("%"))
       call append(line(".")+1,"   > Author: ".$USER)
       call append(line(".")+2,"   > Mail: ")
       call append(line(".")+3,"   > Created Time: ".strftime("%Y-%m-%d %H:%M:%S"))
       call append(line(".")+4,"******************************************************/")
       call append(line(".")+5,"")
   endif
endfunc
" 创建文件后自动定位文件末尾
autocmd BufNewFile * normal G
