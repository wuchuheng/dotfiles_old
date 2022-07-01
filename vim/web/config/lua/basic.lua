--
-- @Description 基本配置
-- @Author      wuchuheng<root@wuchuheng.com>
--

-------------------------------------------------------------------------------
--                                  参数 配置
-------------------------------------------------------------------------------
vim.o.background = 'dark' -- 背景
vim.g.encoding = 'UTF-8' -- 默认文件编码utf8
vim.o.fileencoding = 'utf-8' -- 默认文件编码
vim.bo.undofile = true
-- vim.o.t_Co = 256                                 -- 终端显示的颜色数量
vim.o.ignorecase = true -- 查找忽略大小写
vim.o.smartcase = true -- 查找大小写自动识别
vim.o.autoindent = true -- 自动缩进
vim.o.softtabstop = 4 -- tab 4空格
vim.o.shiftwidth = 4
vim.o.hlsearch = true -- 查找结果高亮
vim.wo.number = true -- 设置行号
vim.o.numberwidth = 4
-- vim.o.fileformat = unix                           -- 文件格式
-- vim.o.nobomb = true                               -- 无bom格式
vim.o.wrap = true -- 自动换行显示
vim.o.history = 200 -- 历史记录量
-- vim.o.syntax = on                              -- 启用语法高亮
vim.o.relativenumber = true -- 相对行号
vim.o.mouse = 'a' -- 支持鼠标
vim.o.hidden = true -- 隐藏当前缓冲区禁用提示
vim.o.spell = true -- 启用字典
vim.o.spelllang = 'cjk' -- 默认英文字典
vim.o.backupcopy = 'yes' -- docker挂载文件保存生效
-- vim.o.nowrap = true                            -- 不折行
vim.wo.colorcolumn = '80' -- 80列宽度标尺
vim.o.scrolloff = 8 -- jkhl 移动时光标周围保留8行
vim.o.sidescrolloff = 8
vim.wo.cursorline = true -- 高亮所在行ss
vim.o.incsearch = true -- 边输入边搜索
vim.wo.signcolumn = 'yes'
-- 右侧参考线，超过表示代码太长了，考虑换行
vim.o.shiftround = true
-- >> << 时移动长度
vim.o.shiftwidth = 2
vim.bo.shiftwidth = 2
-- 空格替代tab
vim.o.expandtab = true
vim.bo.expandtab = true
-- 新行对齐当前行
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartindent = true
-- 命令行高为2，提供足够的显示空间
vim.o.cmdheight = 1
-- 当文件被外部程序修改时，自动加载
vim.o.autoread = true
vim.bo.autoread = true
-- 光标在行首尾时<Left><Right>可以跳到下一行
vim.o.whichwrap = '<,>,[,]'
-- 允许隐藏被修改过的buffer
vim.o.hidden = true
-- 禁止创建备份文件
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false
-- smaller updatetime
vim.o.updatetime = 300
-- 设置 timeoutlen 为等待键盘快捷键连击时间500毫秒，可根据需要设置
vim.o.timeoutlen = 500
-- split window 从下边和右边出现
vim.o.splitbelow = true
vim.o.splitright = true
-- 自动补全不自动选中
vim.g.completeopt = 'menu,menuone,noselect,noinsert'
-- 样式
vim.o.termguicolors = true
vim.opt.termguicolors = true
-- 不可见字符的显示，这里只把空格显示为一个点
vim.o.list = true
vim.o.listchars = 'space:·'
-- 补全增强
vim.o.wildmenu = true
-- Dont' pass messages to |ins-completin menu|
vim.o.shortmess = vim.o.shortmess .. 'c'
-- 补全最多显示10行
vim.o.pumheight = 10
-- 永远显示 tabline
vim.o.showtabline = 2
-- 使用增强状态栏插件后不再需要 vim 的模式提示
vim.o.showmode = false
pcall(vim.cmd, [[ set guifont=SauceCodePro\ Nerd\ Font:h19 ]])
-- pcall(vim.cmd, [[ set undofir=~/.local/shared/nvim/undo-dir ]]
vim.g.neovide_remember_window_size = true
vim.g.neovide_remember_window_position = true

pcall(
vim.cmd,
[[
    set undodir=/Users/wuchuheng/.local/share/nvim/undo/
    set undofile
    set backupdir=/Users/wuchuheng/.local/share/nvim/backup/
    set backup
]]
)
