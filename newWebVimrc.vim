call plug#begin('~/.vim/plugged')
     " #1 代码高亮
     Plug 'sheerun/vim-polyglot'
     " #2 代码高配置
     Plug 'sheerun/vimrc'
     " #4 文件管理器
     Plug 'scrooloose/nerdtree'
     " #5 字符定位
     Plug 'easymotion/vim-easymotion'
     " #6 文件搜索
     Plug 'kien/ctrlp.vim'
     " #7 语法补全
     Plug 'neoclide/coc.nvim', {'branch': 'release'}
     " #8 文本搜索
     Plug 'eugen0329/vim-esearch'
     " #9 窗口选择
     Plug 't9md/vim-choosewin'
     " #11 emmet
     Plug 'mattn/emmet-vim'
     " #12  翻译
     Plug 'voldikss/vim-translator'
     " #13 缩进线
     Plug 'Yggdroot/indentLine'
     " #14 注释
     Plug 'tpope/vim-commentary'
     " #15 状态栏
     Plug 'vim-airline/vim-airline'
     Plug 'vim-airline/vim-airline-themes'

     " #16 文件搜索
     Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
     Plug 'junegunn/fzf.vim'
     Plug 'preservim/tagbar'

    
call plug#end()

"
" 代码主题配置
"
" colorscheme gruvbox
" set background=dark

"
" 通用基础参数设置
"
let mapleader = ','                             "指定leader键位
set foldlevelstart=99                           " 打开文件是默认不折叠代码
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
"set cc=80                                       "80列宽度标尺
set undodir=~/dotfiles/.undo/                   " undo 保存目录
set backupdir=~/dotfiles/.backup/               " 备份文件保存目录 
set undofile                                    " :xxx 什么东西
set directory=~/dotfiles/.swp/                  " 缓存目录
set t_Co=256
set keywordprg=:Man                             "使用:Man打开man文档
set emoji

"
" 通用映射键配置
"
"临时关闭高亮快捷键映射
map <silent><space>l :<C-u>nohlsearch<CR>
"打开terminal :xxx 遇到不能打开原来的窗口 
nmap <space>' :new term://zsh<CR><C-w>H<C-w>J:+resize10<CR>i 
" 退出terminal
tnoremap <Esc> <C-\><C-n>
" 窗口加大
nmap <Up> 3<C-w>+
" 窗口加缩小
nmap <Down> 3<C-w>-
" 窗口左缩
nmap <Left> :3winc <<CR>
" 窗口右缩
nmap <right> :3winc ><CR>


"
" #4 NerderTree 配置文件管理
"
let NERDTreeShowLineNumbers=1                   "Nerdtree插件 使用行号
let NERDTreeWinPos="right"
let NERDTreeChDirMode=1                         "Nerdtree插件 不改变根目a
let NERDTreeShowHidden=1
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
let NERDTreeChDirMode=1
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0
nnoremap <space>fo :NERDTreeFind<CR>
nnoremap <space>ft :NERDTreeToggle<CR>

"
" #5 字符定位
"
" 当前窗口定位前缀
map  <space>j <Plug>(easymotion-bd-f)
nmap <space>J <Plug>(easymotion-overwin-f)

"
" #6 文件搜索
"
" 搜索启动
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_show_hidden = 1
" file find
nmap <space>ff <C-p>
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\.git$|vendor\|\.hg$\|\.svn$\|\.yardoc\|node_modules\|public\/images\|public\/system\|data\|log\|tmp$',
            \ 'file': '\.exe$\|\.so$\|\.dat$'
            \ } 
"file buffer search
nmap <space>fb :CtrlPBuffer<CR>

"
" #7 语法补全
"
let g:coc_global_extensions = [ 
            \'coc-json',
            \'coc-git',
            \'coc-tsserver',
            \'coc-html',
            \'coc-css',
            \'coc-cssmodules',
            \'coc-tailwindcss',
            \'coc-vetur',
            \'coc-marketplace',
            \'coc-eslint',
            \'coc-pairs'
            \]

"
" #8 文本搜索
" 

"
" #9 窗口选择
"
nmap  <space><space>  <Plug>(choosewin)

"
" #11 emmet
"
let g:user_emmet_mode='a'    "enable all function in all mode.

"
" #12  翻译
"
" Display translation in a window
nmap <silent> <space>tt <Plug>TranslateW
vmap <silent> <space>tt <Plug>TranslateWV
nmap <silent> <space>tr <Plug>TranslateR
vmap <silent> <space>tr <Plug>TranslateRV
" Translate the text in clipboard
nmap <silent> <space>tx <Plug>TranslateX
" Echo translation in the cmdline
nmap <silent> <space>tc <Plug>Translate
vmap <silent> <space>tc <Plug>TranslateV

"
" #13 缩进线
"
let g:indentLine_char_list = ['|', '¦', '┆', '┊']


"
" #15 状态栏
" 
"
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts=1
let g:airline_left_sep=''                      "airline插件  S›lightly fancier than '>'
let g:airline_right_sep=''                     "airline插件  Sl‹ightly fancier than '<'
let g:airline_letf_alt_sep = ''
let g:airline_right_alt_sep = ''
let g:aireline_symbols = {}
let g:airline_symbols_branch = ''
let g:airline_symbols_readonly = ''
let g:airline#extensions#tabline#enabled = 1    "airline插件 启用顶部标签栏
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
let g:airline_theme='dark'
let g:airline_powerline_fonts = 1

nnoremap <space>tv :! generateTagsForVue

set tags+=./tags

set autochdir

"
" #16 文件搜索
"
nnoremap <space>p/ :Files<CR>
nnoremap <space>pb :Buffers<CR>


nnoremap <space>tt :TagbarToggle<CR>
