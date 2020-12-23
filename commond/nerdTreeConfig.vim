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

