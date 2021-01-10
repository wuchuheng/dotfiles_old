function s:source(rpath)
    execute 'source  ' . g:root_dir.a:rpath[2:]
endfunction

let g:coc_global_extensions = [ 
            \'coc-json',
            \'coc-git',
            \'coc-marketplace',
            \'coc-pairs',
            \'coc-snippets',
            \'coc-go',
            \]

call s:source('../commond/cocConfig.vim')


autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')
