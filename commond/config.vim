
"
" 通用基础参数设置
"
let mapleader = ','                             "指定leader键位
set foldlevelstart=99                           " 打开文件是默认不折叠代码
set ignorecase                                  "查找忽略大小写
set smartcase                                   "查找大小写自动识别
set autoindent                                  "自动缩进
set softtabstop=4 shiftwidth=4 sw=4 et          "tab 4空格
set incsearch                                   "查找高亮
set hlsearch                                    "查找结果高亮
set number                                      "行号
set fileformat=unix                             "文件格式
set encoding=utf-8                              "编码格式
set nobomb                                      "无bom格式
set wrap                                        "自动换行显示 
set history=200                                 "历史记录量
syntax on                                       "启用语法高亮
set relativenumber                              "相对行号
set mouse=a                                     "支持鼠标
set hidden                                      "隐藏当前缓冲区禁用提示
set spell                                       "启用字典
set spelllang=en_us                             "默认英文字典
set backupcopy=yes                              "docker挂载文件保存生效
set nowrap                                      "不折行
set autowrite
"set cc=80                                       "80列宽度标尺
" undo 保存目录
"
execute 'set undodir='.g:root_dir.'/.undo/'                   
" 备份文件保存目录 
execute 'set backupdir='.g:root_dir.'/.backup/'
set undofile                         " :xxx 什么东西
" 缓存目录
execute 'set directory='.g:root_dir.'/.swp/'                  
set t_Co=256
set keywordprg=:Man                             "使用:Man打开man文档
set emoji
let g:neoterm_autoscroll = 1
set virtualedit=all
set tags+=./tags
set autochdir
