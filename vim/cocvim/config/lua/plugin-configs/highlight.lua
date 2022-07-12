local Module = {}
local helper = require('utils.helper')

local function loadBlanklineConfig()
    local statue, blankline = helper.loadModule('indent_blankline')
    if not statue then return end
    blankline.setup({
        -- 空行占位
        space_char_blankline = " ",
        -- -- 用 treesitter 判断上下文
        show_current_context = true,
        show_current_context_start = true,
        context_patterns = {
            "class",
            "function",
            "method",
            "element",
            "^if",
            "^while",
            "^for",
            "^object",
            "^table",
            "block",
            "arguments",
        },
        -- :echo &filetype
        filetype_exclude = {
            "dashboard",
            "packer",
            "terminal",
            "help",
            "log",
            "markdown",
            "TelescopePrompt",
            "lsp-installer",
            "lspinfo",
            "toggleterm",
        },
        -- 竖线样式
        -- char = '¦'
        -- char = '┆'
        -- char = '│'
        -- char = "⎸",
        char = "▏",
    })
end

local function loadTreesitterConfig()
    local status, treesitter = helper.loadModule('nvim-treesitter.configs')
    if not status then return end
    treesitter.setup({
        indent = {
            enable = true
        },
        -- A list of parser names, or "all"
        ensure_installed = { "c", "lua", "rust", 'dart' },

        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,

        -- List of parsers to ignore installing (for "all")
        ignore_install = {},

        highlight = {
            -- `false` will disable the whole extension
            enable = true,

            -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
            -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
            -- the name of the parser)
            -- list of language that will be disabled
            disable = { "c"},

            -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
            -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
            -- Using this option may slow down your editor, and you may see some duplicate highlights.
            -- Instead of true it can also be a list of languages
            additional_vim_regex_highlighting = false,
        },
    })
    -- 开启 Folding 模块
    vim.opt.foldmethod = "expr"
    vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
    -- 默认不要折叠
    -- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
    vim.opt.foldlevel = 99
end

-- load the config for highlight
function Module.loadConfig()
    loadTreesitterConfig()
    loadBlanklineConfig()
end
loadBlanklineConfig()
return Module
