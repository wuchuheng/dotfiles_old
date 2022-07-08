local helper = require('utils.helper')
local _, lsp_installer = helper.loadModule("nvim-lsp-installer")
local Module = {}

local function loadLSPConfig()
    local servers = {
        sumneko_lua = require("plugin-configs.lsp.config.lua"),
        rust_analyzer = require("plugin-configs.lsp.config.rust")
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

function Module.loadConfig()
    loadLSPConfig()
end
Module.loadConfig()
return Module
