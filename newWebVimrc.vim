call plug#begin('~/.vim/plugged')
let typeScript_fold=1 "activate folding by JS syntax
    " #1 代码高亮
    Plug 'sheerun/vim-polyglot'
    " #2 代码高配置
    " Plug 'sheerun/vimrc'
    " #4 文件管理器
    Plug 'scrooloose/nerdtree'
    " #5 字符定位
    Plug 'easymotion/vim-easymotion'
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
    " #15 文件搜索
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    " #16 multiple cursors
    Plug 'terryma/vim-multiple-cursors'
    " #17 git 
    Plug 'tpope/vim-fugitive'
    " #18 tagbar
    Plug 'preservim/tagbar'
    Plug 'hushicai/tagbar-javascript.vim'
    " #19 srround
    Plug 'tpope/vim-surround'
    " # 20 snippets
    " Plug 'SirVer/ultisnips'
    " Plug 'mlaursen/vim-react-snippets'
    " #21 theme
    Plug 'ghifarit53/tokyonight-vim'

    " 23 [] 映射
    Plug 'tpope/vim-unimpaired'

call plug#end()


function! s:get_full_path(rpath)
    let g:root_dir="~/dotfiles"
    return  g:root_dir.a:rpath[1:]
endfunction

"
" 代码主题配置
"
" colorscheme gruvbox
" set background=dark

"
" 通用基础参数设置
"
execute 'source '.s:get_full_path('./commond/config.vim')

"
" 通用映射键配置
"
execute 'source '.s:get_full_path('./commond/mapConfig.vim')

"
" #4 NerderTree 配置文件管理
"
execute 'source '.s:get_full_path('./commond/nerdTreeConfig.vim')

"
" #5 字符定位
"
execute 'source '.s:get_full_path('./commond/easyMotionConfig.vim')

"
" #7 语法补全
"
execute 'source '.s:get_full_path('./commond/cocForWebConfig.vim')

"
" #9 窗口选择
"
execute 'source '.s:get_full_path('./commond/windowsConfig.vim')

"
" #11 emmet
"
let g:user_emmet_mode='a'    "enable all function in all mode.

"
" #12  翻译
"
execute 'source '.s:get_full_path('./commond/translationConfig.vim')

"
" #13 缩进线
"
execute 'source '.s:get_full_path('./commond/indentLineConfig.vim')

"
" #15 状态栏
" 
execute 'source'.s:get_full_path('./commond/airlineConfig.vim')

"
" #15 文件搜索
" 
execute 'source '.s:get_full_path('./commond/fzfConfig.vim')

" 
" #16 multiple cursors
" 
execute 'source '.s:get_full_path('./commond/multipleCursosConfig.vim')

"
" #17 git 
" 
execute 'source '.s:get_full_path('./commond/gitConfig.vim')

"
" #18 tagbar
"
execute 'source '.s:get_full_path('./commond/tagbarConfig.vim')

"
" # 21 theme config
"
"
execute 'source '.s:get_full_path('./commond/themeConfig.vim')

execute 'source '.s:get_full_path('./commond/snippetForWebConfig.vim')
