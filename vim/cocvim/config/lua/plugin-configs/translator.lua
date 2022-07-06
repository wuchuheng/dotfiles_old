local Module = {}
local keymapping = require('keybindings')

function Module.loadConfig()
    vim.cmd([[
        function! TranslateSelectText(type)
            let saved_unnamed_register = @@
            normal! `<v`>y
            silent execute " TranslateW " . shellescape(@@)

            let @@ = saved_unnamed_register
        endfunction
    ]])
    keymapping.translator()
end

return Module
