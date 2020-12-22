call plug#begin('~/.vim/plugged')
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

    Plug 'ghifarit53/tokyonight-vim'
    " #15 文件搜索
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    " #16 multiple cursors
    Plug 'terryma/vim-multiple-cursors'
    " #17 git 
    Plug 'tpope/vim-fugitive'
    " #18
    Plug 'preservim/tagbar'
    " #18
    Plug 'tpope/vim-surround'

    " #javascript tagbar
    Plug 'hushicai/tagbar-javascript.vim'


    " Plug 'SirVer/ultisnips'
    " Plug 'mlaursen/vim-react-snippets'

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
let g:neoterm_autoscroll = 1
set virtualedit=all

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
" move the line up
nnoremap [e  :<c-u>execute 'move -1-'. v:count1<cr>
" move the line down
nnoremap ]e  :<c-u>execute 'move +'. v:count1<cr>
" tag preview
nnoremap <space>tp <C-w>}
" jump to the tag definition
noremap <space>td <C-w><C-]>
" edit register
nnoremap <leader>m  :<c-u><c-r><c-r>='let @'. v:register .' = '. string(getreg(v:register))<cr><c-f><left>
" 
xnoremap <  <gv
xnoremap >  >gv
" to create new window in buttom 
nmap <space>wtb :sp<CR><C-w>J:100winc-<CR>:14winc+<CR>:Buffers<CR>zsh
" close windows binding
nmap <space>wcl <C-w>l:q<CR>
nmap <space>wcr <C-w>h:q<CR>
nmap <space>wcb <C-w>j:q<CR>
nmap <space>wct <C-w>k:q<CR>
nmap <space>wct <C-w>k:q<CR>
"create new window in buttom
nmap <space>wnb :sp<CR><C-w>J:100winc-<CR>:14winc+<CR>
"refresh the current file 
nmap <space>fr :e!<CR>

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
            \'coc-pairs',
            \'coc-snippets',
            \'coc-tslint',
            \'coc-cssmodules'
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
nmap <silent> <space>ts <Plug>TranslateW
vmap <silent> <space>ts <Plug>TranslateWV
nmap <silent> <space>tr <Plug>TranslateR
vmap <silent> <space>tr <Plug>TranslateRV
" Translate the text in clipboard
nmap <silent> <space>tx <Plug>TranslateX
" Echo translation in the cmdline
nmap <silent> <space>tc <Plug>Translate
vmap <silent> <space>tc <Plug>TranslateV
nmap <silent> <space>te :Translate --target_lang=en <C-r>0<CR>


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
colorscheme tokyonight
let g:tokyonight_transparent_background=1

set tags+=./tags


"
" #15 文件搜索
" 
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }
let $FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --layout reverse --margin=1,4"

function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction
command! ProjectFiles execute 'Files' s:find_git_root()
noremap <C-p> :ProjectFiles<CR>
noremap <space>fb :Buffers<CR>

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)
" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)


" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
" nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>



" 
" #16 multiple cursors
" 
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

"
" #17 git 
" 
nnoremap <space>gs :Git status<CR>
nnoremap <space>gd :Git diff<CR>
nnoremap <space>gl :Glog<CR>

set foldmethod=syntax "syntax highlighting items specify folds
set foldcolumn=1 "defines 1 col at window left, to indicate folding
let javaScript_fold=1 "activate folding by JS syntax
let typeScript_fold=1 "activate folding by JS syntax
set foldlevelstart=99 "start file with all folds opened

let g:multi_cursor_use_default_mapping=0

