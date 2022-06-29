local status, aerial = pcall(require, 'aerial')

if not status then
    vim.notify('Not  found aerial.')
    return
end
local keybindings = require('keybindings')

aerial.setup({
    on_attach = keybindings.aerial,
})
