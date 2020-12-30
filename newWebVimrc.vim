let g:root_dir='~/dotfiles'

function s:get_full_path(rpath)
    return  g:root_dir.a:rpath[1:]
endfunction

let typeScript_fold=1 "activate folding by JS syntax
call plug#begin('~/.vim/plugged')
    execute 'source '.s:get_full_path('./commondPlugins.vim')
call plug#end()

execute 'source '.s:get_full_path('./commondPluginsConfig.vim')

execute 'source '.s:get_full_path('./configForWeb/index.vim')
