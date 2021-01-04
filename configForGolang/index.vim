function s:source(rpath)
    execute 'source ' . g:root_dir.'/configForGolang'.a:rpath[1:]
endfunction

call s:source('./golang.vim')

call s:source('./coc.vim')
