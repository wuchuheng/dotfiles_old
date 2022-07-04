local Module = {}
local helper = require('utils.helper')
local colorscheme = require('plugin-configs.colorscheme') 
local keybinding = require('keybindings')

-- Loading the config for statue line.
function Module.loadConfig()
  local status, lualine = helper.loadModule('lualine')
  if not status then
    return
  end
  keybinding.statueLine() -- To Loaded keybinding config
  
  lualine.setup({
    options = {
      theme = colorscheme.colorscheme,
      component_separators = {left = '|', right = '|'},
      section_separators = { left = "", right = "" },
    },
    sections = { 
      lualine_a = {
        '%{winnr()}',
        'mode',
      },
    },
    inactive_sections = {
      lualine_a = {
        '%{winnr()}',
        'mode'
      }
    },
    -- TODO: toggleterm 
    --  extensions = { "toggleterm" },
  })
end


Module.loadConfig()

return Module
