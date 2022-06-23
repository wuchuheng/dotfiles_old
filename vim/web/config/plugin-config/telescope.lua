local status, telescope = pcall(require, "telescope")
if not status then
  vim.notify("没有找到 telescope")
  return
end

telescope.setup({
  defaults = {
    -- 打开弹窗后进入的初始模式，默认为 insert，也可以是 normal
    initial_mode = "insert",
    -- 窗口内快捷键
    mappings = require("keybindings").telescopeList,
    -- 搜索忽略目录
    file_ignore_patterns = {
      'node_modules',                                   -- 忽略node_modules目录
      'data/site/pack/packer/start'                     -- 忽略nvim插件目录
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
