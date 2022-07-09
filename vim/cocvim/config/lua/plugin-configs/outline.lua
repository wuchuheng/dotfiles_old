local Module = {}
local keybindings = require('keybindings')

function Module.loadConfig()
    vim.cmd([[
        let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
        " Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
        let g:vista#renderer#enable_icon = 1

        " The default icons can't be suitable for all the filetypes, you can extend it as you wish.
        let g:vista#renderer#icons = {
        \   "function": "\uf794",
        \   "variable": "\uf71b",
        \  }
        function! NearestMethodOrFunction() abort
            return get(b:, 'vista_nearest_method_or_function', '')
        endfunction
        set statusline+=%{NearestMethodOrFunction()}
        autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
        let g:lightline = {
            \ 'colorscheme': 'wombat',
            \ 'active': {
            \   'left': [ [ 'mode', 'paste' ],
            \             [ 'readonly', 'filename', 'modified', 'method' ] ]
            \ },
            \ 'component_function': {
            \   'method': 'NearestMethodOrFunction'
            \ },
            \ }

    ]])
    keybindings.outline()
end


return Module
