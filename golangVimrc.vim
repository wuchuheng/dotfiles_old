let g:root_dir='~/dotfiles'

function s:get_full_path(rpath)
    return  g:root_dir.a:rpath[1:]
endfunction

call plug#begin('~/.vim/plugged')
    execute 'source '.s:get_full_path('./commondPlugins.vim')

    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()


execute 'source '.s:get_full_path('./commondPluginsConfig.vim')

"
" 22 go config 
"
execute 'source '.s:get_full_path('./commond/golangConfig.vim')

