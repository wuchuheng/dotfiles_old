nnoremap <space>gs :Git status<CR>
nnoremap <space>gd :Git diff<CR>
nnoremap <space>gl :Glog<CR>

set foldmethod=syntax "syntax highlighting items specify folds
set foldcolumn=1 "defines 1 col at window left, to indicate folding
let javaScript_fold=1 "activate folding by JS syntax
set foldlevelstart=99 "start file with all folds opened

let g:multi_cursor_use_default_mapping=0 
