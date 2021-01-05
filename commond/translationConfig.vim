nmap <silent> <space>ts <Plug>TranslateW
vmap <silent> <space>ts <Plug>TranslateWV
nmap <silent> <space>tr <Plug>TranslateR
vmap <silent> <space>tr <Plug>TranslateRV
" Translate the text in clipboard
nmap <silent> <space>tx <Plug>TranslateX
" Echo translation in the cmdline
nmap <silent> <space>tc <Plug>Translate
vmap <silent> <space>tc <Plug>TranslateV
nmap <silent> <space>te :Translate --target_lang=en <C-r>0<CR>

let g:translator_target_lang='zh'
nmap <silent> <space>tcz :let g:translator_target_lang='zh'<CR>
nmap <silent> <space>tce :let g:translator_target_lang='en'<CR>



