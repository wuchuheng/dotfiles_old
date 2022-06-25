--
-- @Description 快捷键配置
-- @Author      wuchuheng<root@wuchuheng.com>
-- @Date        2022-07-22

--[[
--映射模式范式为:
vim.api.nvim_set_keymap('模式', '按键', '映射为', 'options') 
--]]
local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }

vim.g.mapleader = ',' -- 指定leader键位
vim.g.maplocalleader = '-' -- 指定local leader键位

-------------------------------------------------------------------------------
--                          解决neovide不能使用mac OS系统粘贴的问题
-------------------------------------------------------------------------------
vim.g.neovide_input_use_logo = 1
map('', '<D-v>', '+p<CR>', opt)
map('!', '<D-v>', '<C-R>+', opt)
map('t', '<D-v>', '<C-R>+', opt)
map('v', '<D-v>', '<C-R>+', opt)

-------------------------------------------------------------------------------
--                          窗口调整快捷键配置
-------------------------------------------------------------------------------
map('n', '<Left>', ':winc <<CR>', opt) -- 窗口向左放大
map('n', '<Right>', ':winc ><CR>', opt) -- 窗口向右放大
map('n', '<Up>', '<C-w>+', opt) -- 窗口向上放大
map('n', '<Down>', '<C-w>-', opt) -- 窗口向下放大
map('n', '<Right>', ':winc ><CR>', opt) -- 窗口向右放大
map('n', 's=', '<C-w>=', opt) -- 窗口垂直等大

-------------------------------------------------------------------------------
--                          搜索快捷键配置
-------------------------------------------------------------------------------
map('n', '<space>l', ':<C-u>nohlsearch<CR>', opt) -- 窗口垂直等大

-------------------------------------------------------------------------------
--                          终端快捷键配置
-------------------------------------------------------------------------------
map('t', '<Esc>', '<C-\\><C-n>', opt) -- Esc退出terminal
map('n', '<leader>vt', ':vsp | terminal<CR>i', opt)
map('n', '<leader>t', ':sp | terminal<CR>i', opt)

-------------------------------------------------------------------------------
--                          移动文本快捷键配置
-------------------------------------------------------------------------------
map('v', 'J', ":move '>+1<cr>gv-gv", opt) -- 向下移
map('v', 'K', ":move '<-2<cr>gv-gv", opt) -- 向上移

-- 插件快捷键
local pluginKeys = {}
-- nvim-tree
-- 列表快捷键
pluginKeys.nvimTreeList = {
    -- 打开文件或文件夹
    { key = { '<CR>', 'o', '<2-LeftMouse>' }, action = 'edit' },
    -- 分屏打开文件
    { key = 'v', action = 'vsplit' },
    { key = 'h', action = 'split' },
    -- 显示隐藏文件
    { key = 'i', action = 'toggle_custom' }, -- 对应 filters 中的 custom (node_modules)
    { key = '.', action = 'toggle_dotfiles' }, -- Hide (dotfiles)
    -- 文件操作
    { key = '<F5>', action = 'refresh' },
    { key = 'a', action = 'create' },
    { key = 'd', action = 'remove' },
    { key = 'r', action = 'rename' },
    { key = 'x', action = 'cut' },
    { key = 'c', action = 'copy' },
    { key = 'p', action = 'paste' },
    { key = 's', action = 'system_open' },
}
-------------------------------------------------------------------------------
--                          buferLine快捷键配置
-------------------------------------------------------------------------------
map('n', '<C-h>', ':BufferLineCyclePrev<CR>', opt) -- 上一个窗口
map('n', '<C-l>', ':BufferLineCycleNext<CR>', opt) -- 下一个窗口
map('n', '<C-w>c', ':Bdelete!<CR>', opt) -- 关闭窗口
map('n', '<space>bn', ':BufferLineCycleNext<CR>', opt) -- 下一个窗口
map('n', '<space>bp', ':BufferLineCloseLeft<CR>', opt) -- 上一个窗口
map('n', '<space>bc', ':BufferLinePickClose<CR>', opt) -- 关闭窗口
map('n', '<space>1', ':BufferLineGoToBuffer 1 <CR>', opt) -- 窗口1
map('n', '<space>2', ':BufferLineGoToBuffer 2 <CR>', opt) -- 窗口2
map('n', '<space>3', ':BufferLineGoToBuffer 3 <CR>', opt) -- 窗口3
map('n', '<space>4', ':BufferLineGoToBuffer 4 <CR>', opt) -- 窗口4
map('n', '<space>5', ':BufferLineGoToBuffer 5 <CR>', opt) -- 窗口5
map('n', '<space>6', ':BufferLineGoToBuffer 6 <CR>', opt) -- 窗口6
map('n', '<space>7', ':BufferLineGoToBuffer 7 <CR>', opt) -- 窗口7
map('n', '<space>8', ':BufferLineGoToBuffer 8 <CR>', opt) -- 窗口8
map('n', '<space>9', ':BufferLineGoToBuffer 9 <CR>', opt) -- 窗口9

-------------------------------------------------------------------------------
--                          Telescope快捷键配置
-------------------------------------------------------------------------------
-- 查找文件
map('n', '<C-p>', ':Telescope find_files<CR>', opt)
-- 全局搜索
map('n', '<space>gf', ':Telescope live_grep<CR>', opt)
map('n', '<space>bl', ':Telescope buffers<CR>', opt)
pluginKeys.telescopeList = {
    i = {
        -- 上下移动
        ['<C-j>'] = 'move_selection_next',
        ['<C-k>'] = 'move_selection_previous',
        ['<Down>'] = 'move_selection_next',
        ['<Up>'] = 'move_selection_previous',
        -- 历史记录
        ['<C-n>'] = 'cycle_history_next',
        ['<C-p>'] = 'cycle_history_prev',
        -- 关闭窗口
        ['<C-c>'] = 'close',
        -- 预览窗口上下滚动
        ['<C-u>'] = 'preview_scrolling_up',
        ['<C-d>'] = 'preview_scrolling_down',
    },
}

-------------------------------------------------------------------------------
--                          LSP快捷键配置
-------------------------------------------------------------------------------
-- lsp 回调函数快捷键设置
pluginKeys.mapLSP = function(mapbuf)
    -- rename
    --[[
  Lspsaga 替换 rn
  mapbuf("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
--]]
    mapbuf('n', '<leader>rn', '<cmd>Lspsaga rename<CR>', opt)
    -- code action
    --[[
  Lspsaga 替换 ca
  mapbuf("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
--]]
    mapbuf('n', '<leader>ca', '<cmd>Lspsaga code_action<CR>', opt)
    -- go xx
    --[[
  mapbuf('n', 'gd', '<cmd>Lspsaga preview_definition<CR>', opt)
--]]
    mapbuf('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opt)
    --[[
  Lspsaga 替换 gh
  mapbuf("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
--]]
    mapbuf('n', 'gh', '<cmd>Lspsaga hover_doc<cr>', opt)
    --[[
  Lspsaga 替换 gr
  mapbuf("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
  --]]
    mapbuf('n', 'gr', '<cmd>Lspsaga lsp_finder<CR>', opt)
    --[[
  Lspsaga 替换 gp, gj, gk
  mapbuf("n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>", opt)
  mapbuf("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)
  mapbuf("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
--]]
    -- diagnostic
    mapbuf('n', 'gp', '<cmd>Lspsaga show_line_diagnostics<CR>', opt)
    mapbuf('n', 'gj', '<cmd>Lspsaga diagnostic_jump_next<cr>', opt)
    mapbuf('n', 'gk', '<cmd>Lspsaga diagnostic_jump_prev<cr>', opt)
    mapbuf('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opt)
end

-------------------------------------------------------------------------------
--                          自动补全快捷键配置
-------------------------------------------------------------------------------
pluginKeys.cmp = function(cmp)
    return {
        -- 出现补全
        ['<A-.>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        -- 取消
        ['<A-,>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        -- 上一个
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        -- 下一个
        ['<C-j>'] = cmp.mapping.select_next_item(),
        -- 确认
        ['<CR>'] = cmp.mapping.confirm({
            select = true,
            behavior = cmp.ConfirmBehavior.Replace,
        }),
        -- 如果窗口内容太多，可以滚动
        ['<C-u>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    }
end

-------------------------------------------------------------------------------
--                          TS增强快捷键配置
-------------------------------------------------------------------------------
pluginKeys.mapTsLSP = function(mapbuf)
    mapbuf('n', 'gs', ':TSLspOrganize<CR>', opt)
    mapbuf('n', 'gr', ':TSLspRenameFile<CR>', opt)
    mapbuf('n', 'gi', ':TSLspImportAll<CR>', opt)
end

return pluginKeys
