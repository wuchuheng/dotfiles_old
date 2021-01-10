let g:root_dir='~/dotfiles'

function s:source(rpath)
    execute 'source ' . g:root_dir.a:rpath[1:]
endfunction

call plug#begin('~/.vim/plugged')
    call s:source('./commondPlugins.vim')
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()


call s:source('./commondPluginsConfig.vim')

"
" 22 go config 
"
call s:source('./commond/golangConfig.vim')

