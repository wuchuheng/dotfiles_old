" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/vim-easy-align'
Plug 'vim-airline/vim-airline-themes'
Plug 'easymotion/vim-easymotion'
Plug 'flazz/vim-colorschemes'
Plug 'majutsushi/tagbar'
Plug 'spf13/PIV'
Plug 'tpope/vim-surround'
Plug 'Shougo/neocomplete.vim'

" Initialize plugin system
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           插件 配置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Nerdtree 配置
    let NERDTreeShowLineNumbers=1                   "Nerdtree插件 使用行号
    let NERDTreeChDirMode=1                         "Nerdtree插件 不改变根目录
    let NERDTreeShowHidden=1
    let NERDTreeShowBookmarks=1
    let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
    let NERDTreeChDirMode=0
    let NERDTreeQuitOnOpen=1
    let NERDTreeMouseMode=2
    let NERDTreeShowHidden=1
    let NERDTreeKeepTreeInNewTab=1
    let g:nerdtree_tabs_open_on_gui_startup=0
    "跳到NERDTree栏
    nnoremap <leader>e :NERDTreeFind<CR>
    "非NERDTree栏
    map <leader>nt :NERDTreeToggle<CR>
    map <C-n> :NERDTreeToggle<CR>
    
"airline 配置
    let g:airline_powerline_fonts=1
    let g:airline_left_sep=''                      "airline插件  S›lightly fancier than '>'
    let g:airline_right_sep=''                     "airline插件  Sl‹ightly fancier than '<'
    let g:airline_letf_alt_sep = ''
    let g:airline_right_alt_sep = ''
    let g:aireline_symbols = {}
    let g:airline_symbols_branch = ''
    let g:airline_symbols_readonly = ''
    let g:airline#extensions#tabline#enabled = 1    "airline插件 启用顶部标签栏

"EasyAlign 配置 
    xmap ga <Plug>(EasyAlign) " Start interactive EasyAlign in visual mode (e.g. vipga)
    nmap ga <Plug>(EasyAlign) " Start interactive EasyAlign for a motion/text object (e.g. gaip)

"airline 主题配置
if isdirectory(expand("~/.vim/plugged/vim-airline-themes"))
    colorscheme  molokai                             "代码配色方案
endif

"状态栏配色
    let g:airline_theme='simple'                     "状态栏主题

"easymoution 映射
    " <Leader>f{char} to move to {char}
    map  <Leader>f <Plug>(easymotion-bd-f)
    nmap <Leader>f <Plug>(easymotion-overwin-f)
    " s{char}{char} to move to {char}{char}
    "nmap s <Plug>(easymotion-overwin-f3)
    " Move to line
    map <Leader>L <Plug>(easymotion-bd-jk)
    nmap <Leader>L <Plug>(easymotion-overwin-line)
    " Move to word
    map  <Leader>w <Plug>(easymotion-bd-w)
    nmap <Leader>w <Plug>(easymotion-overwin-w)

"tagbar 配置
nmap <leader>tt :TagbarToggle<CR>

"neocomplet 自动补全配置
"Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'


"ctrlp 配置
    let g:ctrlp_map = '<c-p>'
    let g:ctrlp_cmd = 'CtrlP'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           参数 配置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ','                             "指定leader键位
let maplocalleader = ','                        "指定local leader键位
set ignorecase                                  "查找忽略大小写
set smartcase                                   "查找大小写自动识别
set autoindent                                  "自动缩进
set softtabstop=4 shiftwidth=4 sw=4 et          "tab 4空格
set incsearch                                   "查找高亮
set hlsearch                                    "查找结果高亮
set number 					"行号
set fileformat=unix                             "文件格式
set encoding=utf-8                              "编码格式
set nobomb                                      "无bom格式
set wrap                                        "自动换行显示 
set history=200                                 "历史记录量
syntax on                                       "启用语法高亮
set norelativenumber                            "相对行号
set mouse=a                                     "支持鼠标
set foldlevelstart=99                           "历史上限
set hidden                                      "隐藏当前缓冲区禁用提示
set spell                                       "启用字典
set spelllang=en_us                             "默认英文字典
set backupcopy=yes                              "docker挂载文件保存生效
hi clear SpellBad                               "关闭错误标示
hi clear MatchParen                             "关闭闭合括号标示




""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           nnoremap 配置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"F12 切换php语法高亮
nnoremap <F12> :set syntax=php<CR>              
"[b buffer上一文件
nnoremap <silent> [b : bprevious<CR>            
"]b buffer下一文件
nnoremap <silent> ]b : bnext<CR>                
"[B buffer头文件
nnoremap <silent> [B : bfirst<CR>               
"]B buffer尾文件
nnoremap <silent> ]B : blast<CR>                
"[a 列表参数上一文件
nnoremap <silent> [a : prev<CR>                 
"]a 列表参数下一文件
nnoremap <silent> ]a : next<cr>                 
"[A 列表参数头文件
nnoremap <silent> [A : first<C-R>               
"]A 列表参数尾文件
nnoremap <silent> ]A : last<C-R>                
"临时关闭高亮快捷键映射
map <silent><space>l :<C-u>nohlsearch<CR>
"&命令修正
nnoremap & :&&<CR>                              
"ctags F5刷新
nnoremap <f5>:!ctags -R<CR>                     
"选择窗口
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-w>a <C-c>:tab split<CR>
nnoremap <Leader>m :make<cr>





""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           xnoremap 配置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"&命令修正
xnoremap & :&&<CR> 
"查找当前选中快捷键映射
xnoremap * :<C-u>call <SID>VSetSearch('/')<CR>/<C-R>=@/<CR><CR> 
"查找当前选中快捷键映射
xnoremap # :<C-u>call <SID>VSetSearch('?')<CR>?<C-R>=@/<CR><CR> 




""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           inoremap 配置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap  ~php <CR>/**<CR>*<CR>* @author    wuchuheng<CR>* @email    root@wuchuheng.com<CR>*<CR>**/<CR>
"插入模式向前移动一个长词
inoremap <C-E> <C-c>Ea                          
"插入模式向前移动一个词
inoremap <C-e> <C-c>ea                          
"插入模式向后移动一个长词
inoremap <C-b> <C-c>ba                          
"插入模式向后移动一个长词
inoremap <C-B> <C-c>Ba                          
"单词转大写
inoremap <C-u> <C-c>vawgUi



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           onoremap 配置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"操作映射
"操作"删除下一个括号内字符
onoremap in( :<c-u>normal! f(vi(<cr>            
"删除上一个括号内字符
onoremap il( :<c-u>normal! F)vi(<cr>            
"删除markdown上一个标题
onoremap ih :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rkvg_"<cr> 
"删除markdown上一个标题和等号
onoremap ah :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rg_vk0"<cr>




""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           autocmd
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"autocmd FileType sh : iabbrev <buffer>if if [  ]<left><left> "sh脚本if判断自动补全中括号 
"autocmd FileType php : call MakeConfPHP()<CR>                "php编译





""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           自定义函数
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""
" @info 查找当前选中
""
function! s:VSetSearch(cmdtype)
    let temp = @s
    norm! gv"sy
    let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
    let @s = temp
endfunction

""
" @info php make 配置
""
function! MakeConfPHP()
   setlocal makeprg=php\ %
endfunction

""
" @info 来源声明
"
"function! Ggi()
"    "php 声明
"    "inoremap  ~php <CR>/**<CR>*<CR>* @author    root<CR>* @email     root@163.com<CR>*<CR>**/<CR>     "php程序头部声明
"endfunction

