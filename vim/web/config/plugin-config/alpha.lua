local status, alpha = pcall(require, 'alpha')

if not status then
    vim.notify('没有发现 nvim-alpha')
    return
end

local default_header = {
    type = 'text',
    val = {
        [[]],
        [[██╗    ██╗██╗   ██╗██╗███╗   ███╗]],
        [[██║    ██║██║   ██║██║████╗ ████║]],
        [[██║ █╗ ██║██║   ██║██║██╔████╔██║]],
        [[██║███╗██║╚██╗ ██╔╝██║██║╚██╔╝██║]],
        [[╚███╔███╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║]],
        [[╚══╝╚══╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
        [[                                 ]],
        [[      [ version : 0.0.1 ]        ]],
    },
    opts = {
        hl = 'Type',
        position = 'center',

        -- wrap = "overflow";
    },
}
local config = require('alpha.themes.theta').config
config.layout[2] = default_header

alpha.setup(config)
