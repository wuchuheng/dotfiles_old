local helper = require('utils.helper')
local keybindings = require('keybindings')
local Module = {}
local status, bufferline= helper.loadModule('bufferline')
if not status then return end

local function loadConfig()
    bufferline.setup({
        options = {
            tab_size = 18,
            numbers = 'ordinal',
            close_command = 'Bdelete! %d',
            right_mouse_command = 'Bdelete! %d',
            offsets = {
                {
                    filetype = 'coc-explorer',
                    text = 'File Explorer',
                    highlight = 'Directory',
                    text_align = 'left',
                },
            },
            diagnostics = 'nvim_lsp',
            diagnostics_indicator = function(_, _, diagnostics_dict)
                local s = ' '
                for e, n in pairs(diagnostics_dict) do
                    local sym = e == 'error' and ' ' or (e == 'warning' and ' ' or '')
                    s = s .. n .. sym
                end
                return s
            end,
        },
    })
end

-- Load the config for buffer line plugin.
function Module.loadConfig()
  loadConfig() -- loaded the config of plugin
  keybindings.bufferLine() -- load the config of keybinding
end

return Module

