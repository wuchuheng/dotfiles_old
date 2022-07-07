local helper = require('utils.helper')
local _, lsp_installer = helper.loadModule("nvim-lsp-installer")
local Module = {}
local keybindings = require("keybindings")

local function loadLSPConfig()
    local servers = {
        sumneko_lua = require("plugin-configs.lsp.config.lua")
    }
    -- 自动安装 Language Servers
    for name, _ in pairs(servers) do
    local server_is_found, server = lsp_installer.get_server(name)
    if server_is_found then
        if not server:is_installed() then
        print("Installing " .. name)
        server:install()
        end
    end
    end

    lsp_installer.on_server_ready(function(server)
        local config = servers[server.name]
        if config == nil then
            return
        end
        if config.on_setup then
            config.on_setup(server)
        else
            server:setup({})
        end
    end)
end

local function UIConfig()
    vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        -- 在输入模式下也更新提示，设置为 true 也许会影响性能
        update_in_insert = true,
    })
    local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
    for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end
    local status, lspkind = helper.loadModule('lspkind')
    if not status then return end
    lspkind.init({
        -- default: true
        -- with_text = true,
        -- defines how annotations are shown
        -- default: symbol
        -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
        mode = 'symbol_text',
        -- default symbol map
        -- can be either 'default' (requires nerd-fonts font) or
        -- 'codicons' for codicon preset (requires vscode-codicons font)
        --
        -- default: 'default'
        preset = 'codicons',
        -- override preset symbols
        --
        -- default: {}
        symbol_map = {
            Text = "",
            Method = "",
            Function = "",
            Constructor = "",
            Field = "ﰠ",
            Variable = "",
            Class = "ﴯ",
            Interface = "",
            Module = "",
            Property = "ﰠ",
            Unit = "塞",
            Value = "",
            Enum = "",
            Keyword = "",
            Snippet = "",
            Color = "",
            File = "",
            Reference = "",
            Folder = "",
            EnumMember = "",
            Constant = "",
            Struct = "פּ",
            Event = "",
            Operator = "",
            TypeParameter = ""
        },
    })

    local M ={}
    -- 为 cmp.lua 提供参数格式
    M.formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol_text',
            --mode = 'symbol', -- show only symbol annotations

            maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
            -- The function below will be called before any actual modifications from lspkind
            -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
            before = function (entry, vim_item)
                -- Source 显示提示来源
                vim_item.menu = "[" .. string.upper(entry.source.name) .. "]"
                return vim_item
            end
        })
    }

    return M
end


local function loadCMPConfig()
    local status, cmp = helper.loadModule('cmp')
    if not status then return end
    cmp.setup({
        -- 指定 snippet 引擎
        snippet = {
            expand = function(args)
                -- For `vsnip` users.
                vim.fn["vsnip#anonymous"](args.body)
                -- For `luasnip` users.
                -- require('luasnip').lsp_expand(args.body)

                -- For `ultisnips` users.
                -- vim.fn["UltiSnips#Anon"](args.body)

                -- For `snippy` users.
                -- require'snippy'.expand_snippet(args.body)
            end,
        },
        -- 补全源
        sources = cmp.config.sources({
            { name = "nvim_lsp" },
            -- For vsnip users.
            { name = "vsnip" },

            -- For luasnip users.
            -- { name = 'luasnip' },

            --For ultisnips users.
            -- { name = 'ultisnips' },

            -- -- For snippy users.
            -- { name = 'snippy' },
        }, { { name = "buffer" }, { name = "path" } }),

        -- 快捷键设置
        mapping = keybindings.cmp(cmp),
        formatting = UIConfig().formatting
    })

    -- / 查找模式使用 buffer 源
    cmp.setup.cmdline("/", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
            { name = "buffer" },
        },
    })

    -- : 命令行模式中使用 path 和 cmdline 源.
    cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
            { name = "path" },
        }, {
            { name = "cmdline" },
        }),
    })
end

local function cmpEnhance()
    local status, lspsaga = helper.loadModule('lspsaga')
    if not status then return end
    lspsaga.setup { -- defaults ...
        debug = false,
        use_saga_diagnostic_sign = true,
        -- diagnostic sign
        error_sign = "",
        warn_sign = "",
        hint_sign = "",
        infor_sign = "",
        diagnostic_header_icon = "   ",
        -- code action title icon
        code_action_icon = " ",
        code_action_prompt = {
            enable = true,
            sign = true,
            sign_priority = 40,
            virtual_text = true,
        },
        finder_definition_icon = "  ",
        finder_reference_icon = "  ",
        max_preview_lines = 10,
        finder_action_keys = {
            -- open = "o",
            open = "<CR>",
            vsplit = "s",
            split = "i",
            -- quit = "q",
            quit = "<ESC>",
            scroll_down = "<C-f>",
            scroll_up = "<C-b>",
        },
        code_action_keys = {
            -- quit = "q",
            quit = "<ESC>",
            exec = "<CR>",
        },
        rename_action_keys = {
            -- quit = "<C-c>",
            quit = "<ESC>",
            exec = "<CR>",
        },
        definition_preview_icon = "  ",
        border_style = "single",
        rename_prompt_prefix = "➤",
        rename_output_qflist = {
            enable = false,
            auto_open_qflist = false,
        },
        server_filetype_map = {},
        diagnostic_prefix_format = "%d. ",
        diagnostic_message_format = "%m %c",
        highlight_prefix = false,
    }
end

function Module.loadConfig()
    loadLSPConfig()
    loadCMPConfig()
    UIConfig()
    cmpEnhance()
end

return Module
