local getRegisterByPrefix = require("plugin-configs.which-key").getRegisterByPrefix
local package = require("package")
local Debug = require("utils.debug")
local register = require("plugin-configs.which-key").register
local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }
vim.g.mapleader = "," -- 指定leader键位
vim.g.maplocalleader = "-" -- 指定local leader键位
local keybinding = {}
local leaderRegister = getRegisterByPrefix({ prefix = "<leader>" })
local leaderSRegister = getRegisterByPrefix({ prefix = "<leader>s" })
local leaderARegister = getRegisterByPrefix({ prefix = "<leader>a" })
local leaderCRegister = getRegisterByPrefix({ prefix = "<leader>C" })
local leaderQRegister = getRegisterByPrefix({ prefix = "<leader>q" })
local spaceRegister = getRegisterByPrefix({ prefix = "<space>" })
local spaceDRegister = getRegisterByPrefix({ prefix = "<space>d" })
local spaceFRegister = getRegisterByPrefix({ prefix = "<space>f" })
local spaceBRegister = getRegisterByPrefix({ prefix = "<space>b" })
local spacePRegister = getRegisterByPrefix({ prefix = "<space>p" })
local spaceQRegister = getRegisterByPrefix({ prefix = "<space>q" })
local spaceGRegister = getRegisterByPrefix({ prefix = "<space>g" })
local spaceMRegister = getRegisterByPrefix({ prefix = "<space>m" })
local spaceERegister = getRegisterByPrefix({ prefix = "<space>e" })
local spaceTRegister = getRegisterByPrefix({ prefix = "<space>t" })
local spaceCRegister = getRegisterByPrefix({ prefix = "<space>c" })

-------------------------------------------------------------------------------
--                          基本快捷键配置c
-------------------------------------------------------------------------------
leaderSRegister({
 name = "Source",
 c = { ":so $MYVIMRC<CR>", "Source config" },
})
spaceQRegister({
 c = {
  ":cclose<cr>",
  "Close Quickfix",
 },
})

-------------------------------------------------------------------------------
--                          解决neovide不能使用mac OS系统粘贴的问题
-------------------------------------------------------------------------------
vim.g.neovide_input_use_logo = 1
map("", "<D-v>", "+p<CR>", opt)
map("!", "<D-v>", "<C-R>+", opt)
map("t", "<D-v>", "<C-R>+", opt)
map("v", "<D-v>", "<C-R>+", opt)

-------------------------------------------------------------------------------
--                          窗口调整快捷键配置
-------------------------------------------------------------------------------
map("n", "<Left>", ":winc <<CR>", opt) -- 窗口向左放大
map("n", "<Right>", ":winc ><CR>", opt) -- 窗口向右放大
map("n", "<Down>", "<C-w>+", opt) -- 窗口向上放大
map("n", "<Up>", "<C-w>-", opt) -- 窗口向下放大
map("n", "<Right>", ":winc ><CR>", opt) -- 窗口向右放大
map("n", "s=", "<C-w>=", opt) -- 窗口垂直等大

-------------------------------------------------------------------------------
--                          Tab快捷键配置
-------------------------------------------------------------------------------
leaderRegister({
 ["1"] = { ":normal! 1gt<cr>", "tab 1" },
 ["2"] = { ":normal! 2gt<cr>", "tab 2" },
 ["3"] = { ":normal! 3gt<cr>", "tab 3" },
 ["4"] = { ":normal! 4gt<cr>", "tab 4" },
})

-------------------------------------------------------------------------------
--                          搜索快捷键配置
-------------------------------------------------------------------------------
-- 关闭搜索高亮
spaceRegister({
 l = {
  ":<C-u>nohlsearch<CR>",
  "nohlsearch",
 },
})

-------------------------------------------------------------------------------
--                          移动文本快捷键配置
-------------------------------------------------------------------------------
map("v", "J", ":move '>+1<cr>gv-gv", opt) -- 向下移
map("v", "K", ":move '<-2<cr>gv-gv", opt) -- 向上移

-------------------------------------------------------------------------------
--                          exporer 快捷键配置
-------------------------------------------------------------------------------
spaceFRegister({
 name = "Files",
 m = { ":CocCommand explorer --toggle --sources=file+<CR>", "Open explorer" },
})

-------------------------------------------------------------------------------
--                          Coc 快捷键配置
-------------------------------------------------------------------------------
function keybinding.coc()
 vim.cmd([[
  " Tab 补全
  inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ CheckBackspace() ? "\<TAB>" :
        \ coc#refresh()
  " 刷新补全列表
  inoremap <silent><expr> <c-space> coc#refresh()
  " 回车自动补全
  inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
]])
 vim.cmd([[
  " Use `[g` and `]g` to navigate diagnostics
  " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
  nmap <silent> [g <Plug>(coc-diagnostic-prev)
  nmap <silent> ]g <Plug>(coc-diagnostic-next)
]])
 vim.cmd([[
  " Use `[g` and `]g` to navigate diagnostics
  " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
  nmap <silent> [g <Plug>(coc-diagnostic-prev)
  nmap <silent> ]g <Plug>(coc-diagnostic-next)
]])
 vim.cmd([[
  " GoTo code navigation.
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)
  " Use K to show documentation in preview window.
  nnoremap <silent>gh :call ShowDocumentation()<CR>
]])
 vim.cmd([[
  " Symbol renaming.
  nmap <leader>rn <Plug>(coc-rename)
]])
 vim.cmd([[
  " Formatting selected code.
  xmap <leader>f  <Plug>(coc-format-selected)
  nmap <leader>f  <Plug>(coc-format-selected)
]])
 -- Applying codeAction to the selected region.
 vim.cmd([[
" Example: `<leader>aap` for current paragraph
  xmap <leader>a  <Plug>(coc-codeaction-selected)
]])
 leaderARegister({
  name = "CodeAction",
  a = { "<Plug>(coc-codeaction-selected)", "Applying codeAction to the selected region." },
  c = { "<Plug>(coc-codeaction)", "Remap keys for applying codeAction to the current buffer" },
 })
 leaderQRegister({
  name = "QuickFix",
  f = { "<Plug>(coc-fix-current)", "Apply AutoFix to problem on the current line." },
 })
 leaderCRegister({
  name = "Code lens",
  l = { "<Plug>(coc-codelens-action)", "Run the Code Lens action on the current line." },
 })
 vim.cmd([[
  " Map function and class text objects
  " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
  xmap if <Plug>(coc-funcobj-i)
  omap if <Plug>(coc-funcobj-i)
  xmap af <Plug>(coc-funcobj-a)
  omap af <Plug>(coc-funcobj-a)
  xmap ic <Plug>(coc-classobj-i)
  omap ic <Plug>(coc-classobj-i)
  xmap ac <Plug>(coc-classobj-a)
  omap ac <Plug>(coc-classobj-a)
]])
 vim.cmd([[
  " Remap <C-f> and <C-b> for scroll float windows/popups.
  if has('nvim-0.4.0') || has('patch-8.2.0750')
    nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
    inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
    inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
    vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  endif
]])
 vim.cmd([[
  " Use CTRL-S for selections ranges.
  " Requires 'textDocument/selectionRange' support of language server.
  nmap <silent> <C-s> <Plug>(coc-range-select)
  xmap <silent> <C-s> <Plug>(coc-range-select)
]])
 -- " Mappings for CoCList
 spaceCRegister({
  name = "Coclist",
  a = { ":<C-u>CocList diagnostics<cr>", "Show all diagnostics." },
  d = { ":CocDisable<cr>", "disable Coc extensions." },
  e = {
   name = "Coc extensions",
   e = { ":<C-u>CocList extensions<cr>", "Manage extensions." },
   n = { ":CocEnable<cr>", "Enable Coc extensions." },
  },
  l = { ":<C-u>CocList commands<cr>", "Show commands." },
  c = { [[silent exec "!open -a 'Google Chrome'"<cr>]], "Open chrome" },
  o = { ":<C-u>CocList outline<cr>", "Find symbol of current document." },
  s = { ":<C-u>CocList -I symbols<cr>", "Search workspace symbols." },
  j = { ":<C-u>CocNext<CR>", "Do default action for next item." },
  k = { ":<C-u>CocPrev<CR>", "Do default action for previous item." },
  p = { ":<C-u>CocListResume<CR>", "Resume latest coc list." },
 })
end

-------------------------------------------------------------------------------
--                          Telescope快捷键配置
-------------------------------------------------------------------------------
keybinding.telescope = function()
 -- 查找文件
 map("n", "<C-p>", ":Telescope find_files<CR>", opt)
 spaceFRegister({
  name = "Files",
  t = { ":Telescope live_grep<cr>", "Find text." },
  f = { ":Telescope live_files<cr>", "Find files." },
  r = { ":Telescope oldfiles<cr>", "Recently fiiles" },
 })
 spaceBRegister({
  name = "Buffers",
  l = { ":Telescope buffers<cr>", "List buffers" },
 })
 spaceQRegister({
  name = "Quickfix",
  f = { ":Telescope quickfix<cr>", "Quickfix" },
 })
 spaceGRegister({
  s = { ":Telescope git_status<cr>", "Git status" },
  b = { ":Telescope git_branches<cr>", "Git branches" },
  c = { ":Telescope git_commits<cr>", "Git commits" },
 })
 spaceMRegister({
  name = "Marks",
  k = { ":Telescope marks<cr>", "Find marks" },
 })
 spaceERegister({
  nam = "Env",
  n = { ":Telescope env<cr>", "Env list" },
 })

 local config = {
  i = {
   -- 上下移动
   ["<C-j>"] = "move_selection_next",
   ["<C-k>"] = "move_selection_previous",
   ["<Down>"] = "move_selection_next",
   ["<Up>"] = "move_selection_previous",
   -- 历史记录
   ["<C-n>"] = "cycle_history_next",
   ["<C-p>"] = "cycle_history_prev",
   -- 关闭窗口
   ["<C-c>"] = "close",
   -- 预览窗口上下滚动
   ["<C-u>"] = "preview_scrolling_up",
   ["<C-d>"] = "preview_scrolling_down",
  },
 }
 register({
  ["<leader>"] = {
   g = {
    ":<c-u>call GrepOperator(visualmode())<cr>",
    "Search keyword",
   },
  },
 }, { mode = "v" })
 return config
end

-------------------------------------------------------------------------------
--                           Statue line 快捷键配置
-------------------------------------------------------------------------------
function keybinding.statueLine()
 local function gotoWinByWinNumber(winNumber)
  local winId = vim.fn.win_getid(winNumber)
  vim.fn.win_gotoid(winId)
 end
 spaceRegister({
  ["1"] = {
   function()
    gotoWinByWinNumber(1)
   end,
   "Win 1",
  },
  ["2"] = {
   function()
    gotoWinByWinNumber(2)
   end,
   "Win 2",
  },
  ["3"] = {
   function()
    gotoWinByWinNumber(3)
   end,
   "Win 3",
  },
  ["4"] = {
   function()
    gotoWinByWinNumber(4)
   end,
   "Win 4",
  },
  ["5"] = {
   function()
    gotoWinByWinNumber(5)
   end,
   "Win 5",
  },
  ["6"] = {
   function()
    gotoWinByWinNumber(6)
   end,
   "Win 6",
  },
  ["7"] = {
   function()
    gotoWinByWinNumber(7)
   end,
   "Win 7",
  },
  ["8"] = {
   function()
    gotoWinByWinNumber(8)
   end,
   "Win 8",
  },
  ["9"] = {
   function()
    gotoWinByWinNumber(9)
   end,
   "Win 9",
  },
 })
end
-------------------------------------------------------------------------------
--                          buferLine快捷键配置
-------------------------------------------------------------------------------
function keybinding.bufferLine()
 spaceRegister({
  name = "Tabs",
  ["<space>"] = {
   name = "Tabs",
   ["1"] = { ":BufferLineGoToBuffer 1 <CR>", "Tab 1" },
   ["2"] = { ":BufferLineGoToBuffer 2 <CR>", "Tab 2" },
   ["3"] = { ":BufferLineGoToBuffer 3 <CR>", "Tab 3" },
   ["4"] = { ":BufferLineGoToBuffer 4 <CR>", "Tab 4" },
   ["5"] = { ":BufferLineGoToBuffer 5 <CR>", "Tab 5" },
   ["6"] = { ":BufferLineGoToBuffer 6 <CR>", "Tab 6" },
   ["7"] = { ":BufferLineGoToBuffer 7 <CR>", "Tab 7" },
   ["8"] = { ":BufferLineGoToBuffer 8 <CR>", "Tab 8" },
   ["9"] = { ":BufferLineGoToBuffer 9 <CR>", "Tab 9" },
  },
 })
 map("n", "<C-w>c", ":Bdelete!<CR>", opt) -- 关闭窗口
end
-------------------------------------------------------------------------------
--                          toggleterm快捷键配置
-------------------------------------------------------------------------------
function keybinding.toggleterm()
 map("t", "<Esc>", "<C-\\><C-n>", opt) -- Esc退出terminal
 spaceTRegister({
  name = "Terminal",
  t = { ":ToggleTerm<cr>", "Toggle terminal" },
  a = { ":ToggleTermToggleAll<cr>", "Toggle all terminal" },
  ["1"] = { ":ToggleTerm 1<cr>", "Toggle terminal 0" },
  ["2"] = { ":ToggleTerm 2<cr>", "Toggle terminal 2" },
 })
end
-------------------------------------------------------------------------------
--                          Dashboard 快捷键配置
-------------------------------------------------------------------------------
function keybinding.dashboard()
 spaceDRegister({
  a = { ":Alpha<cr>", "Dashboard" },
 })
end

-------------------------------------------------------------------------------
--                          Project 快捷键配置
-------------------------------------------------------------------------------
function keybinding.project()
 spacePRegister({
  name = "Projects",
  p = { ":Telescope projects<cr>", "Open projects" },
 })
end

-------------------------------------------------------------------------------
--                          Easymotion 快捷键配置
-------------------------------------------------------------------------------
function keybinding.easymotion()
 spaceMRegister({
  name = "Motion",
  l = {
   "<Plug>(easymotion-bd-jk)",
   "Move to line",
  },
  L = {
   "<Plug>(easymotion-overwin-line)",
   "Move to over win line",
  },
  w = {
   "<Plug>(easymotion-bd-w)",
   "Move to word",
  },
  W = {
   "<Plug>(easymotion-overwin-w)",
   "Move to over win word",
  },
  m = {
   "<Plug>(easymotion-bd-f)",
   "find {char} to move to {char}",
  },
  M = {
   "<Plug>(easymotion-overwin-f)",
   "find {char} to move to over {char}",
  },
  j = {
   "<Plug>(easymotion-j)",
   "j motions: line motions",
  },
  K = {
   "<Plug>(easymotion-k)",
   "K motions: line motions",
  },
  -- 搜索标记
  k = {
   "<cmd>Telescope marks<cr>",
   "find marks",
  },
 })
end

-------------------------------------------------------------------------------
--                           Todo 快捷键配置
-------------------------------------------------------------------------------
function keybinding.todo()
 spaceTRegister({
  name = "Todo",
  d = {
   ":TodoTelescope<CR>",
   "Todo telescope list.",
  },
 })
end

-------------------------------------------------------------------------------
--                           Git 快捷键配置
-------------------------------------------------------------------------------
function keybinding.git(gitMap, gs, togglePreview)
 gitMap("n", "]c", function()
  if vim.wo.diff then
   return "]c"
  end
  vim.schedule(function()
   gs.next_hunk()
  end)
  return "<Ignore>"
 end, { expr = true })

 gitMap("n", "[c", function()
  if vim.wo.diff then
   return "[c"
  end
  vim.schedule(function()
   gs.prev_hunk()
  end)
  return "<Ignore>"
 end, { expr = true })
 -- Actions
 gitMap({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>")
 gitMap({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>")
 gitMap("n", "<leader>hS", gs.stage_buffer)
 gitMap("n", "<leader>hu", gs.undo_stage_hunk)
 gitMap("n", "<leader>hR", gs.reset_buffer)
 gitMap("n", "<leader>hp", gs.preview_hunk)
 gitMap("n", "<leader>hb", function()
  gs.blame_line({ full = true })
 end)
 gitMap("n", "<leader>tb", gs.toggle_current_line_blame)
 gitMap("n", "<leader>hd", gs.diffthis)
 gitMap("n", "<leader>hD", function()
  gs.diffthis("~")
 end)
 gitMap("n", "<leader>td", gs.toggle_deleted)
 -- Text object
 gitMap({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
 spaceGRegister({
  name = "Git",
  D = {
   function()
    gs.diffthis("~")
   end,
   "Show current diffence view in git.",
  },
  d = {
   name = "git diffence view",
   d = {
    function() togglePreview() end,
    "Toggle git diffence view",
   },
   h = {
    ":DiffviewFileHistory<cr>",
    "Show the view of git history.",
   },
  },
 })
end

return keybinding
