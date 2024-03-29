local helper = require('utils.helper')
local Module = {}

function Module.searchKeyword()
  vim.cmd([[
    function! GrepOperator(type)
    let saved_unnamed_register = @@
    normal! `<v`>y
    silent execute "lua require('telescope.builtin').grep_string({search = " . shellescape(@@) . "})"

    let @@ = saved_unnamed_register
    endfunction
  ]])
end

Module.searchKeyword()
-- Loading the config for this plugin.
function Module.loadConfig()
  local status, telescope = helper.loadModule('telescope')
  if not status then
    return
  end
  Module.searchKeyword()
  telescope.setup({
    defaults = {
      -- 打开弹窗后进入的初始模式，默认为 insert，也可以是 normal
      initial_mode = "insert",
      -- 窗口内快捷键
      mappings = require("keybindings").telescope(),
      -- 搜索忽略目录
      file_ignore_patterns = {
        'node_modules',                                   -- 忽略node_modules目录
        'coc/extensions',                     -- 忽略nvim插件目录
      }
    },
    pickers = {
      -- 内置 pickers 配置
      find_files = {
        -- theme = "ivy", -- 查找文件换皮肤，支持的参数有： dropdown, cursor, ivy
      }
    },
    extensions = {
      -- 扩展插件配置
    },
  })

  pcall(telescope.load_extension, 'env')
end

return Module
