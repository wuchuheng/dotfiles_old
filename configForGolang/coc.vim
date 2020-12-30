function s:get_full_path(rpath)
    return  g:root_dir.a:rpath[2:]
endfunction

let g:coc_global_extensions = [ 
            \'coc-json',
            \'coc-git',
            \'coc-marketplace',
            \'coc-pairs',
            \'coc-snippets',
            \]

execute 'source '.s:get_full_path('../commond/cocConfig.vim')
