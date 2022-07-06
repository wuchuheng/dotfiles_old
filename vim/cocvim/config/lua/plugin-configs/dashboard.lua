local status, alpha = require('utils.helper').loadModule('alpha')
local keybindings = require('keybindings')
local Module = {}
local autocmd = require('autocmd')

local function loadConfig()
  local default_header = {
      type = 'text',
      val = {
          [[]],
          [[  ██████╗██╗   ██╗██╗███╗   ███╗ ]],
          [[ ██╔════╝██║   ██║██║████╗ ████║ ]],
          [[ ██║     ██║   ██║██║██╔████╔██║ ]],
          [[ ██║     ╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
          [[ ╚██████╗ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
          [[ ╚═════╝  ╚═══╝  ╚═╝╚═╝     ╚═╝  ]],
          [[                                 ]],
          [[       [ version : 0.0.1 ]       ]],
      },
      opts = {
          hl = 'Type',
          position = 'center',

          -- wrap = "overflow";
      },
  }
  local config = require('alpha.themes.theta').config
  local dashboard = require('alpha.themes.dashboard')
  local buttons = {
      type = 'group',
      val = {
          { type = 'text', val = 'Quick links', opts = { hl = 'SpecialComment', position = 'center' } },
          { type = 'padding', val = 1 },
          dashboard.button('e', '  New file', '<cmd>ene<CR>'),
          dashboard.button('p', '  Projects', '<cmd>Telescope projects<CR>'),
          dashboard.button('r', '  Recently files', '<cmd>Telescope oldfiles<CR>'),
          dashboard.button('SPC f f', '  Find file', '<cmd>Telescope projects<CR>'),
          dashboard.button('SPC f g', '  Live grep'),
          dashboard.button('c', '  Configuration', '<cmd>cd ~/.config/nvim/ <CR>'),
          dashboard.button('u', '  Update plugins', '<cmd>PackerSync<CR>'),
          dashboard.button('q', '  Quit', '<cmd>qa<CR>'),
      },
      position = 'center',
  }

  config.layout[2] = default_header
  config.layout[6] = buttons

  alpha.setup(config)
end

-- Load config for dashboard.
function Module.loadConfig()
    if not status then return end
    loadConfig()
    keybindings.dashboard()
end

return Module
