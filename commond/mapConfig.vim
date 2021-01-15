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
execute 'noremap <space>src :source ' . g:root_dir . '/snippet/createReactComponent.vim<CR>'
" create function in js
execute 'noremap <space>sjf :source ' . g:root_dir . '/snippet/createJsFunc.vim<CR>'
noremap <silent>[b :bp<CR>
noremap <silent>]b :bn<CR>
"tab1
noremap <space>1 1gt
"tab2
noremap <space>2 2gt
"tab3
noremap <space>3 3gt
"tab4 
noremap <space>4 4gt
"tab5 
noremap <space>5 5gt
"move tab to 1
noremap <space>tm1 :tabmove 0<CR>
"move tab to 2
noremap <space>tm2 :tabmove 2<CR>
"move tab to 3
noremap <space>tm3 :tabmove 3<CR>
"move tab to 4
noremap <space>tm4 :tabmove 4<CR>
"move tab to 5
noremap <space>tm5 :tabmove 5<CR>
noremap \ ,

" makes * and # work on visual mode too.
function! s:VSetSearch(cmdtype)
    let temp = @s
    norm! gv"sy
    let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
    let @s = temp
endfunction

xnoremap * :<C-u>call <SID>VSetSearch('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch('?')<CR>?<C-R>=@/<CR><CR>

" recursively vimgrep for word under cursor or selection if you hit leader-star
if maparg('<leader>*', 'n') == ''
    nmap <leader>* :execute 'noautocmd vimgrep /\V' . substitute(escape(expand("<cword>"), '\'), '\n', '\\n', 'g') . '/ **'<CR>
endif
if maparg('<leader>*', 'v') == ''
    vmap <leader>* :<C-u>call <SID>VSetSearch()<CR>:execute 'noautocmd vimgrep /' . @/ . '/ **'<CR>
endif
" open the file on the  splite windows
nnoremap <C-W><C-F> <C-W>vgf

" noremap <space>s1 
