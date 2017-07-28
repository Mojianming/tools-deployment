"""" my vim setting """"
" 定义快捷键的前缀，即 <Leader>
let mapleader=";"

" >> 文件类型侦测 <<
" 开启文件类型侦测
filetype on
" 根据侦测到的不同类型加载对应的插件
filetype plugin on

" >> vim 自身（非插件）快捷键 <<

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

" 插件管理与主题
Plug 'mojianming/molokai'

" 自动补全
Plug 'Valloric/YouCompleteMe'
"Plug 'Shougo/neocomplcache.vim'

" 语法检测
Plug 'scrooloose/syntastic'

" 自动插入和格式化括号
Plug 'jiangmiao/auto-pairs'

" 注释快捷键
Plug 'scrooloose/nerdcommenter'

" 重用代码
"Plug 'garbas/vim-snipmate'
"Plug 'tomtom/tlib_vim'

" 文件浏览器
Plug 'scrooloose/nerdtree'

" 缓冲区管理器
Plug 'fholgado/minibufexpl.vim'

" 代码查看器
"Plug 'vim-scripts/taglist.vim'

" 文件大纲outline
Plug 'majutsushi/tagbar'

" 查看历史操作
Plug 'mbbill/undotree'

" 输入法相关
" Plug 'lilydjwg/fcitx.vim'

" python 语法高亮
"Plug 'hdima/python-syntax'

" 代码对齐
" Plug 'godlygeek/tabular'

" 状态栏美化工具
"Plug 'Lokaltog/vim-powerline'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" 缩进指示线
Plug 'Yggdroot/indentLine'

" autopep8 格式化 python 代码
Plug 'tell-k/vim-autopep8'

" jedi python 支持
" Plug 'davidhalter/jedi-vim'

" git 插件
Plug 'Xuyuanp/nerdtree-git-plugin'

" 快速移动
Plug 'easymotion/vim-easymotion'

" 标志无效空格
" Plug 'bronson/vim-trailing-whitespace'

" 文件查找
Plug 'kien/ctrlp.vim'

" 括号匹配高亮
Plug 'kien/rainbow_parentheses.vim'

" 在工程中全局搜索某个特定的字符
"Plug 'dyng/ctrlsf.vim'
"Plug 'fisadev/vim-ctrlp-cmdpalette'

" markdown
Plug 'plasticboy/vim-markdown'
Plug 'suan/vim-instant-markdown'

" 窗口选择
Plug 't9md/vim-choosewin'

" tasklist
Plug 'fisadev/FixedTaskList.vim'

" Emmet插件
" Plug 'mattn/emmet-vim'

" python 配置
" Plug 'klen/python-mode'

" tab panel
" Plug 'kien/tabman.vim'

" Override configs by directory
" Plug 'arielrossanigo/dir-configs-override.vim'

" Terminal Vim with 256 colors colorscheme "
Plug 'fisadev/fisa-vim-colorscheme'

" 环境相关
" Plug 'tpope/vim-surround'

" Plug 'michaeljsmith/vim-indent-object'
" Plug 'jeetsukumaran/vim-indentwise'

" Plug 'basepi/vim-conque'


" 插件列表结束
call plug#end()
filetype plugin indent on

" >>>> 插件设置 <<<<

" >> Emmet 设置 <<
" let g:user_emmet_expandabbr_key = '<C-e>'

" >> YoucompleteMe 设置 <<
" 从第2个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion = 2
" 让Vim的补全菜单行为与一般IDE一致
set completeopt=longest,menu
" 离开插入模式后自动关闭预览窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
" 回车即选中当前项
inoremap <expr> <CR>   pumvisible() ? "\<C-y>" : "\<CR>"
"上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
" 开启 YCM 基于标签引擎"
let g:ycm_collect_identifiers_from_tags_files = 1
" 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_cache_omnifunc = 0
" 语法关键字补全
let g:ycm_seed_identifiers_with_syntax = 1
" 在注释输入中也能补全
let g:ycm_complete_in_comments = 1
" 在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
" 注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 1
" 跳转到定义处
nnoremap <leader>jd :YcmCompleter GoTo<CR>
"youcompleteme  默认tab  s-tab 和自动补全冲突
"let g:ycm_key_list_select_completion=['<c-n>']
let g:ycm_key_list_select_completion = ['<TAB>','<Down>']
"let g:ycm_key_list_previous_completion=['<c-p>']
let g:ycm_key_list_previous_completion = ['<S-TAB>','<Up>']
" 关闭加载.ycm_extra_conf.py提示
let g:ycm_confirm_extra_conf=0
" 默认配置文件路径
let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm'
"let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/ycm_core.so'
" python解析器路径
" >> python 3
let g:ycm_python_binary_path = '/usr/bin/python3'
" >> python 2
" let g:ycm_python_binary_path = 'python'

" 屏蔽部分文件
let g:ycm_filetype_blacklist = {
    \ 'tagbar' : 1,
    \ 'qf' : 1,
    \ 'notes' : 1,
    \ 'markdown' : 1,
    \ 'unite' : 1,
    \ 'text' : 1,
    \ 'vimwiki' : 1,
    \ 'pandoc' : 1,
    \ 'infolog' : 1,
    \ 'mail' : 1
    \}

" >> ultisnips 配置(宏定义补全) <<
""let g:UltiSnipsExpandTrigger="<tab>"
""let g:UltiSnipsJumpForwardTrigger="<c-b>"
""let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" >> nerdcommenter 配置(注释) <<
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
" let g:NERDDefaultAlign = 'left'


" " >> python-syntax 配置 <<
" "let python_highligth_all = 1

" >> tagbar 配置 <<
" 配置快捷键打开tagbar窗口
nnoremap <silent> <F9> :TagbarToggle<CR>
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

" >> nerdtree 配置<<
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

" >> 缩进指示线 <<
let g:indentLine_char='┆'
let g:indentLine_enabled = 1
let g:indentLine_noConcealCurcor=""

" >> autopep8设置 <<
" let g:autopep8_disable_show_diff = 1
" F8 格式化 python 代码
autocmd FileType python map <buffer> <F8> :call Autopep8()<CR>

" " >> jedi-vim 配置 <<
" "  make jedi-vim use tabs when going to a definition etc
" let g:jedi#use_tabs_not_buffers = 1
" "  automatically starts the completion
" let g:jedi#popup_on_dot = 0
" let g:jedi#popup_select_first = 0
" let g:jedi#show_call_signatures = "1"

" >> Syntastic 语法检测 <<
" Recommended setting
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_check_on_open=1

" let g:syntastic_mode_map = {
        " \ "mode": "active",
        " \ "active_filetypes": ["ruby", "php"],
        " \ "passive_filetypes": ["python"] }

" set error or warning signs
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_enable_highlighting = 0
"let g:syntastic_python_checker="flake8,pyflakes,pep8,pylint"
let g:syntastic_python_checkers=['flake8']
"highlight SyntasticErrorSign guifg=white guibg=black

let g:syntastic_cpp_include_dirs = ['/usr/include/']
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libstdc++'
" whether to show balloons"
let g:syntastic_enable_balloons = 1

" >> undotree setting <<
" F7 打开undtree
nnoremap <silent> <F7> :UndotreeToggle <CR>

"""""""""""""""""""""""""""""""""""""""""""
" >> MiniBufferExplorer 文件缓冲区 <<
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
" 解决FileExplorer窗口变小问题
let g:miniBufExplForceSyntaxEnable = 1
let g:miniBufExplorerMoreThanOne = 2
let g:miniBufExplCycleArround = 1
" 切换
nnoremap <leader>u :MBEbn <cr>
nnoremap <leader>v :MBEbp <cr>
" MiniBufExpl Colors
hi MBENormal               guifg=#808080 guibg=fg
hi MBEChanged              guifg=#CD5907 guibg=fg
hi MBEVisibleNormal        guifg=#5DC2D6 guibg=fg
hi MBEVisibleChanged       guifg=#F1266F guibg=fg
hi MBEVisibleActiveNormal  guifg=#A6DB29 guibg=fg
hi MBEVisibleActiveChanged guifg=#F1266F guibg=fg
""""""""""""""""""""""""""""""""""""""""""

" >> 配置 tabular <<
let g:tabular_loaded = 1

" >> 配置 vim-trailing-whitespace <<
" 去掉行尾空格键
map <Leader><space> :FixWhitespace <cr>

" >> vim-powerline 配置 <<
" let g:Powerline_symbols = 'fancy'
" let g:Powerline_symbols = 'unicode'

" >> vim-airline <<
" 是否启用顶部tabline
let g:airline#extensions#tabline#enabled = 1
" 顶部tabline显示方式
let g:airline#extensions#tabline#left_sep = '|'
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_detect_modified = 1
let g:airline_powerline_fonts = 0
" 只显示文件名
let g:airline#extensions#branch#format = 1
"启用vim-bufferline
let g:airline#extensions#bufferline#enabled = 0
let g:airline#extensions#bufferline#overwrite_variables = 1
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
let g:airline#extensions#tabline#tab_nr_type = 2


" >> vim-airline-themes <<
let g:airline_powerline_fonts = 0
let g:airline#extensions#whitespace#enabled = 0
" let g:airline_theme='dark'
" let g:airline_theme = 'bubblegum'

" >> ctrlp 文件查找 <<
" 打开ctrlp搜索
let g:ctrlp_map = '<F5>'
let g:ctrlp_cmd = 'CtrlP'
" 设置搜索目录
let g:ctrlp_working_path_mode = 'ra'
" 设置忽略目录
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/tmp/*,*.so,*.swp,*.zip    " MacOSX/Linux
" set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
" 通过文件名搜索
let g:ctrlp_by_filename = 0
" let g:ctrlp_root_markers = ['.git','.svn','.bzr','_darcs']
" 退出vim时清除缓存
let g:ctrlp_clear_cache_on_exit = 1

" let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" 使用自定义命令查找文件
let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
" let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'  " Windows

" >> rainbow_parentheses.vim <<
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_loadcmd_toggle = 0
let g:rbpt_max = 16
" always on
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"  >> markdown 配置 <<
" 禁止折叠
let g:vim_markdown_folding_disabled = 1
" 折叠风格
let g:vim_markdown_folding_style_pythonic = 1
" 语法相关
set conceallevel=2
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_json_frontmatter = 1
" 窗口相关
let g:vim_markdown_toc_autofit = 1

" >> vim-install-markdown 配置 <<
" 设置打开md文件自动打开markdown
let g:instant_markdown_autostart = 0
map <F12> :InstantMarkdownPreview <cr>

" 窗口选择配置
nmap <leader>m <Plug>(choosewin)
" 窗口显示窗口号
let g:choosewin_overlay_enable = 1

" >> tasklist <<
map <F10> :TaskList<CR>

" >>> minibufexpl <<<
let g:miniBufExplorerAutoStart = 0


" >> 其他设置 <<

" 开启实时搜索功能
set incsearch

" 搜索时大小写不敏感
set ignorecase

" 关闭兼容模式
set nocompatible

" vim 自身命令行模式智能补全
set wildmenu

" >> 个性化设置 <<

" 禁用swap文件
set noswapfile

" 禁用备份
set nowritebackup
set nobackup

" 鼠标
" set mouse=a

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

" 全屏开/关快捷键
map <silent> <F11> :call ToggleFullscreen()<CR>
" 启动 vim 时自动全屏
"autocmd VimEnter * call ToggleFullscreen()

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

" 禁止折行
"set nowrap

" 如果搜索模式包含大写字符，不使用 'ignorecase' 选项
set smartcase

" 设置匹配模式，显示匹配的括号
set showmatch

" 命令行显示输入的命令
set showcmd

" 以缩进作为折叠
" set foldmethod=indent

" 设置状态栏主题风格
let g:Powerline_colorscheme='solarized256'


" >> 语法 <<
" 开启语法高亮功能
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on

" 拼写检查
"set spell
"autocmd FileType tex setlocal spell spelllang=en_us,cjk


" >> 缩进 <<
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







