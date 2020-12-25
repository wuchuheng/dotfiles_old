"
" 通用映射键配置
"
"临时关闭高亮快捷键映射
map <silent><space>l :<C-u>nohlsearch<CR>
"打开terminal :xxx 遇到不能打开原来的窗口 
nmap <space>' :new term://zsh<CR><C-w>J:resize10<CR>i
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
nmap <space>wcl <C-w>h:q<CR>
nmap <space>wcr <C-w>l:q<CR>
nmap <space>wcb <C-w>j:q<CR>
nmap <space>wct <C-w>k:q<CR>
nmap <space>wct <C-w>k:q<CR>
"create new window in buttom
nmap <space>wnb :sp<CR><C-w>J:100winc-<CR>:14winc+<CR>
"refresh the current file 
nmap <space>fr :e!<CR>
" create react Component
noremap <space>src :source ~/dotfiles/snippet/createReactComponent.vim<CR>
" create function in js
noremap <space>sjf :source ~/dotfiles/snippet/createJsFunc.vim<CR>
noremap <silent>[b :bp<CR>
noremap <silent>]b :bn<CR>
"tab1
noremap <space>1 1gt
"tab2
map <space>2 2gt
"tab3
map <space>3 3gt
"tab4 
map <space>4 4gt

