--
-- @Description 快捷键配置
-- @Author      wuchuheng<root@wuchuheng.com>
-- @Date        2022-07-22

--[[
--映射模式范式为:
vim.api.nvim_set_keymap('模式', '按键', '映射为', 'options') 
--]]
local map = vim.api.nvim_set_keymap
local opt = {noremap = true, silent = true }

vim.g.mapleader = ","                                   -- 指定leader键位
vim.g.maplocalleader = "-"                              -- 指定local leader键位

-------------------------------------------------------------------------------
--                          解决neovide不能使用mac OS系统粘贴的问题
-------------------------------------------------------------------------------
vim.g.neovide_input_use_logo = 1
map('', '<D-v>', '+p<CR>',  opt)
map('!', '<D-v>', '<C-R>+', opt)
map('t', '<D-v>', '<C-R>+', opt)
map('v', '<D-v>', '<C-R>+', opt)

-------------------------------------------------------------------------------
--                          窗口调整快捷键配置
-------------------------------------------------------------------------------
map('n', '<Left>', ':winc <<CR>', opt)                          -- 窗口向左放大
map('n', '<Right>', ':winc ><CR>', opt)                         -- 窗口向右放大
map('n', '<Up>', '<C-w>+', opt)                                 -- 窗口向上放大
map('n', '<Down>', '<C-w>-', opt)                               -- 窗口向下放大
map('n', '<Right>', ':winc ><CR>', opt)                         -- 窗口向右放大
map("n", "s=", "<C-w>=", opt)                                   -- 窗口垂直等大


-------------------------------------------------------------------------------
--                          搜索快捷键配置
-------------------------------------------------------------------------------
map("n", "<space>l", ":<C-u>nohlsearch<CR>", opt)               -- 窗口垂直等大


-------------------------------------------------------------------------------
--                          终端快捷键配置
-------------------------------------------------------------------------------
map("t", "<Esc>", "<C-\\><C-n>", opt)                     -- Esc退出terminal
map("t", "<C-c>", "<C-\\><C-n>", opt)                     -- Ctrl+c退出terminal
map("n", "<leader>vt", ":vsp | terminal<CR>i", opt)
map("n", "<leader>t", ":sp | terminal<CR>i", opt)


-------------------------------------------------------------------------------
--                          移动文本快捷键配置
-------------------------------------------------------------------------------
map("v", "J", ":move '>+1<cr>gv-gv", opt)                             -- 向下移
map("v", "K", ":move '<-2<cr>gv-gv", opt)                             -- 向上移

-------------------------------------------------------------------------------
--                          退出快捷键配置
-------------------------------------------------------------------------------
map("n", "q", ":q<cr>", opt)                                        -- 退出 
map("n", "qq", ":q!<cr>", opt)                                      -- 强退
map("n", "Q", ":qa!<cr>", opt)                                      -- 全部强退


-- 插件快捷键
local pluginKeys = {}
-- nvim-tree
-- space + m 键打开关闭tree
map("n", "<space>m", ":NvimTreeToggle<CR>", opt)
-- 列表快捷键
pluginKeys.nvimTreeList = {
  -- 打开文件或文件夹
  { key = {"<CR>", "o", "<2-LeftMouse>"}, action = "edit" },
  -- 分屏打开文件
  { key = "v", action = "vsplit" },
  { key = "h", action = "split" },
  -- 显示隐藏文件
  { key = "i", action = "toggle_custom" }, -- 对应 filters 中的 custom (node_modules)
  { key = ".", action = "toggle_dotfiles" }, -- Hide (dotfiles)
  -- 文件操作
  { key = "<F5>", action = "refresh" },
  { key = "a", action = "create" },
  { key = "d", action = "remove" },
  { key = "r", action = "rename" },
  { key = "x", action = "cut" },
  { key = "c", action = "copy" },
  { key = "p", action = "paste" },
  { key = "s", action = "system_open" },
}


return pluginKeys

