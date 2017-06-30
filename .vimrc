" ###### vundle 插件安装和配置 ######
set nocompatible              " be iMproved, required
filetype on                 " required
filetype plugin indent on    " required


" VIM 优秀插件介绍网站: http://vimawesome.com/
"
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" 文件树
Plugin 'scrooloose/nerdtree'

" Fuzzy file, buffer, mru, tag, etc finder
" Ctrl + p / Esc 打开和关闭
Plugin 'ctrlpvim/ctrlp.vim'

" 语法检查
Plugin 'scrooloose/syntastic'
" tagbar (taglist的替代品, 更适合 C++) 
" 前提需要安装 Ctags
Plugin 'majutsushi/tagbar'
" c/c++ 基于 Ctags 补全
Plugin 'OmniCppComplete'

" 代码注释
Plugin 'scrooloose/nerdcommenter'

" 主题
Plugin 'sickill/vim-monokai'

" 状态栏
Plugin 'bling/vim-airline'

" 非自动成对操作, 比如",',[,{ ... 等等这些修改
" 在需要修改的字符串内执行, 命令: cs"', ds"
Plugin 'tpope/vim-surround'


" All of your Plugins must be added before the following line
call vundle#end()            " required

" ###### vundle 插件详细配置 ######

" [[ nerdtree ]]
" 打开vim自动打开nerdtree (后面两行是支持:当打开vim但没配置文件的,也打开nerdtree)
autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" 当 vim :q 关闭文件时, 如果窗口已经没有文件打开,自动关闭vim(默认是保留nerdtree)
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" 自动切换到第一个文件 (默认是光标是停留在nerdtree目录树)
wincmd w
autocmd VimEnter * wincmd w

map <C-n> :NERDTreeToggle<CR> " Ctrl + n 打开/关闭nerdtree

" [[ ctrlp ]]
" 检索时忽略这些后缀的文件
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': '',
  \ }

" [[ nerdcommenter ]]
" 注释符号后面自动补 1 个空格
let g:NERDSpaceDelims = 1
" 多行注释使用紧凑语法
let g:NERDCompactSexyComs = 1
" 不同语言的自定义格式
let g:NERDCustomDelimiters = { 'c++': { 'left': '/**','right': '*/' }, 'c': { 'left': '/**','right': '*/' } }
let g:NERDCommentEmptyLines = 1
" 清除注释末端空格
let g:NERDTrimTrailingWhitespace = 1

" 注释和反注释 ,cc | ,cb | ,cu 
let g:mapleader = ","

" [[ vim-airline ]]
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" [[ tagbar ]]
" 需要系统已经安装 ctags
nmap <Leader>tb :TagbarToggle<CR>
let g:tagbar_ctags_bin='/usr/bin/ctags'
let g:tagbar_width=30
autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()

" [[ OmniCppComplete ]]
set tags+=/home/hiko/.vim/cpp_tags/cpp_src_2008
set tags+=/home/hiko/dev/leveldb/.ctags_leveldb
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1 
let OmniCpp_ShowPrototypeInAbbr = 1 " 显示函数参数列表 
let OmniCpp_MayCompleteDot = 1   " 输入 .  后自动补全
let OmniCpp_MayCompleteArrow = 1 " 输入 -> 后自动补全 
let OmniCpp_MayCompleteScope = 1 " 输入 :: 后自动补全 
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" 自动关闭补全窗口 
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif 
set completeopt=menuone,menu,longest

" 主题
colorscheme monokai


" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" 
"********************************************************
""                   一般性配置                          *
"********************************************************
""关闭vim一致性原则
set nocompatible
"显示行号
set number
""设置在编辑过程中右下角显示光标的行列信息
set ruler
"在状态栏显示正在输入的命令
set showcmd
""设置历史记录条数
set history=1000
"设置取消备份 禁止临时文件的生成
set nobackup
set noswapfile
""设置匹配模式
set showmatch
"设置C/C++方式自动对齐
" set autoindent
"set cindent
""开启语法高亮功能
"syntax enable
syntax on
"指定配色方案为256色
"set t_Co=256
""设置搜索时忽略大小写
set ignorecase
"配置backspace的工作方式
set backspace=indent,eol,start
""选中高亮
"set hls 

set guifont=Courier_New:h10:cANSI   " 设置字体  

"" 光标移动到buffer的顶部和底部时保持3行距离  
set scrolloff=3
" 总是显示状态行
"set laststatus=1    " 启动显示状态行(1),总是显示状态行(2)  
set foldenable      " 允许折叠  
"启动时不显示帮助乌干达儿童提示
set shortmess=atI 
"设置在vim中可以使用鼠标
set mouse=a
"设置tab宽度
set tabstop=4
"设置自动对齐空格数
set shiftwidth=4
"设置退格键时可以删除4个空格
set smarttab
set softtabstop=4
"将tab键自动转换为空格
set expandtab
"设置编码方式
"set encoding=utf-8
"自动判断编码时 依次尝试以下编码
"set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
"检测文件类型
" filetype on
