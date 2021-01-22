let g:root_dir='~/dotfiles'

function s:source(rpath)
    execute 'source ' . g:root_dir.a:rpath[1:]
endfunction

let typeScript_fold=1 "activate folding by JS syntax
call plug#begin('~/.vim/plugged')
    call s:source('./commondPlugins.vim')
    " css color 
    Plug 'ap/vim-css-color'
call plug#end()

call s:source('./commondPluginsConfig.vim')
call s:source('./configForWeb/index.vim')
