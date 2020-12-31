function s:get_full_path(rpath)
    return  g:root_dir.'/configForWeb'.a:rpath[1:]
endfunction

execute 'source '.s:get_full_path('./coc.vim')

execute 'source '.s:get_full_path('./snippetForWebConfig.vim')

" init default register
execute 'source '.s:get_full_path('./reactRegister.vim')


