" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'scrooloose/nerdtree'
Plug 'arnaud-lb/vim-php-namespace'
Plug 'shawncplus/phpcomplete.vim'
Plug 'vim-scripts/AuthorInfo'
Plug 'matze/vim-move'
Plug 't9md/vim-choosewin'
Plug 'kien/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'Yggdroot/indentLine'
Plug 'junegunn/vim-easy-align'
Plug 'vim-airline/vim-airline-themes'
Plug 'easymotion/vim-easymotion'
Plug 'majutsushi/tagbar'
Plug 'spf13/PIV'
Plug 'tpope/vim-surround'
Plug 'Shougo/neocomplete.vim'
Plug 'tpope/vim-commentary'
Plug 'scrooloose/syntastic'
Plug 'spf13/vim-autoclose'
Plug 'morhetz/gruvbox'
Plug 'mhinz/vim-grepper'

" Initialize plugin system
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           插件 配置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Nerdtree 配置
    let NERDTreeShowLineNumbers=1                   "Nerdtree插件 使用行号
    let NERDTreeWinPos="right"
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
    nnoremap <space>f :NERDTreeFind<CR>
    nnoremap <leader>e :NERDTreeToggle<CR>
    
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
    let g:airline#extensions#tabline#tab_nr_type = 1 " tab number


"EasyAlign 配置 
" let g:EasyMotion_do_mapping = 0 " Disable default mappings
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
function! s:config_easyfuzzymotion(...) abort
    return extend(copy({
                \   'converters': [incsearch#config#fuzzyword#converter()],
                \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
                \   'keymap': {"\<CR>": '<Over>(easymotion)'},
                \   'is_expr': 0,
                \   'is_stay': 1
                \ }), get(a:, 1, {}))
endfunction
noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())
    
"airline 主题配置

"状态栏配色
    let g:airline_theme='light'                     "状态栏主题

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
let g:tagbar_left = 1       "右侧开启
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
    let g:ctrlp_map = '<c-p>'            "当前目录查找
    let g:ctrlp_cmd = 'CtrlP'
    let g:ctrlp_show_hidden = 1
    nmap <space>b :CtrlPBuffer<CR>
"matze/vim-move 配置
let g:move_key_modifier = 'C'

"choosewin 配置 
nmap  <space><space>  <Plug>(choosewin)

"grepper 配置
nmap <space>s :Grepper<CR>

"AuthorInfo 配置
let g:vimrc_author='wuchuheng'
let g:vimrc_email='wuchuheng@163.com'
let g:vimrc_homepage='http://www.wuchuheng.com'
nmap <F4> :AuthorInfoDetect<cr>

"gruvbox 配置  
colorscheme gruvbox
"let g:airline_theme='gruvbox'
let colorscheme_bg = "dark"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           参数 配置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ','                             "指定leader键位
set bg=dark                                     "背景
let maplocalleader = '-'                        "指定local leader键位
set foldlevelstart=99                           " 打开文件是默认不折叠代码
set t_Co=256                                    "终端显示的颜色数量
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
set relativenumber                            "相对行号
set mouse=a                                     "支持鼠标
set foldlevelstart=99                           "历史上限
set hidden                                      "隐藏当前缓冲区禁用提示
set spell                                       "启用字典
set spelllang=en_us                             "默认英文字典
set backupcopy=yes                              "docker挂载文件保存生效
set nowrap                                      "不折行
set foldmethod=indent
set cc=80                                       "80列宽度标尺
nmap <space>' :term<CR>
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
nmap <Up> <C-w>+
nmap <Down> <C-w>-
nmap <Left> :winc <<CR>
nmap <right> :winc ><CR>
nmap tc :pclose<CR>
nmap ts <c-w>}
nmap <c-t>s <c-w>]
nmap tn :tnext<CR>
nmap tp :tprev<CR>
nmap tl :tlast<CR>
"g<c-]> 说明 https://xu3352.github.io/linux/2018/12/16/practical-vim-skills-chapter-16
set undodir=~/.vim/.undo//
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//
"set nobackup
"set noswapfile
set cin                                           "C语言缩进
set foldmethod=manual                             "手动折叠
set helplang=cn
set autoindent                                    "自动缩进
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
nnoremap <f5> :! ctags -R --languages=php ./<CR>                     
"选择窗口
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-w>a <C-c>:tab split<CR>
nnoremap <Leader>m :make<cr>
"跳转到第n个标签页面
nnoremap <leader>1 :1tabnext<cr>
nnoremap <leader>2 :2tabnext<CR>
nnoremap <leader>3 :3tabnext<CR>
nnoremap <leader>4 :4tabnext<CR>
nnoremap <leader>5 :5tabnext<CR>
nnoremap <leader>6 :6tabnext<CR>
nnoremap <leader>7 :7tabnext<CR>
nnoremap <leader>8 :8tabnext<CR>
nnoremap <leader>9 :9tabnext<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"            sldf njjsadk;lfj                xnoremap 配置
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
"行尾加分号; 
inoremap <C-;> <C-c>A;<C-c>g;i




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
"记住上次打开的位置
if has("autocmd")                                                          
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif


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


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           autocmd
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tags+=tags.vendor
"autocmd BufWritePost *.php silent execute \"!ctags -R --languages=php --fields=+lS ./"
set autoindent                                    "自动缩进
