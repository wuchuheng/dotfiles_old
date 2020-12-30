function s:get_full_path(rpath)
    return  g:root_dir.'/configForGolang'.a:rpath[1:]
endfunction

execute 'source ' . s:get_full_path('./golang.vim')

execute 'source ' . s:get_full_path('./coc.vim')
