function s:source(rpath)
    execute 'source ' . g:root_dir.'/configForWeb'.a:rpath[1:]
endfunction

call s:source('./coc.vim')

call s:source('./snippetForWebConfig.vim')

" init default register
call s:source('./reactRegister.vim')

