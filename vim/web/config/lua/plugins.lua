local packer = require('packer')

packer.startup({
    function(use)
        -- Packer 可以管理自己本身
        use('wbthomason/packer.nvim')
        use('folke/tokyonight.nvim') -- 主题插件
        -- 目录插件
        use({
            'kyazdani42/nvim-tree.lua',
            requires = {
                'kyazdani42/nvim-web-devicons',
            },
            tag = 'nightly', -- optional, updated every week. (see issue #1193)
        })
        -- bufferLine
        use({
            'akinsho/bufferline.nvim',
            requires = { 'kyazdani42/nvim-web-devicons', 'moll/vim-bbye' },
        })
        -- statueLine
        use({
            'nvim-lualine/lualine.nvim',
            requires = { 'kyazdani42/nvim-web-devicons' },
        })
        use('arkav/lualine-lsp-progress')
        -- 搜索插件 需要依赖外部工具,通过:checkhealth telescope 查看相关依赖
        use({
            'nvim-telescope/telescope.nvim',
            requires = {
                'nvim-lua/plenary.nvim',
                'LinArcX/telescope-env.nvim', -- env列表功能
            },
        })
        -- 启动页
        use({
            'goolord/alpha-nvim',
            requires = { 'kyazdani42/nvim-web-devicons' },
        })
        -- 用于启动页的项目
        use('ahmedkhalf/project.nvim')
        -- 语法高亮
        use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })
        -- lsp
        use({ 'williamboman/nvim-lsp-installer', commit = '36b44679f7cc73968dbb3b09246798a19f7c14e0' })
        use({ 'neovim/nvim-lspconfig' })
        use('ray-x/lsp_signature.nvim') -- show function signature when typing.
        -- 补全引擎
        use('hrsh7th/nvim-cmp')
        -- snippet 引擎
        use('hrsh7th/vim-vsnip')
        -- 补全源
        use('hrsh7th/cmp-vsnip')
        use('hrsh7th/cmp-nvim-lsp') -- { name = nvim_lsp }
        use('hrsh7th/cmp-buffer') -- { name = 'buffer' },
        use('hrsh7th/cmp-path') -- { name = 'path' }
        use('hrsh7th/cmp-cmdline') -- { name = 'cmdline' }
        -- 常见编程语言代码段
        use('rafamadriz/friendly-snippets')
        -- 补全UI
        use('onsails/lspkind-nvim')
        -- 代码块关联线
        use('lukas-reineke/indent-blankline.nvim')
        -- 补全提示窗美化
        use('tami5/lspsaga.nvim') -- 新增
        -- 格式化
        use({ 'jose-elias-alvarez/null-ls.nvim', requires = 'nvim-lua/plenary.nvim' })
        -- auto opaqirs
        use('windwp/nvim-autopairs')
        -- json增强
        use('b0o/schemastore.nvim')
        --  TS增强插件
        use({ 'jose-elias-alvarez/nvim-lsp-ts-utils', requires = 'nvim-lua/plenary.nvim' })
        -- 快捷键映射
        use('folke/which-key.nvim')
        -- 坐标定位
        use('easymotion/vim-easymotion')
        -- git difference view
        use('sindrets/diffview.nvim')
        use('lewis6991/gitsigns.nvim')
        -- terminal
        use({
            'akinsho/toggleterm.nvim',
            tag = 'v1.*',
        })
        -- choose  windows
        use('t9md/vim-choosewin')
        -- debugger
        use('ravenxrz/DAPInstall.nvim') -- help us install several debuggers
        use({
            'ravenxrz/nvim-dap',
            -- commit = "f9480362549e2b50a8616fe4530deaabbc4f889b",
        })
        use('theHamsta/nvim-dap-virtual-text')
        use('rcarriga/nvim-dap-ui')
        -- Comment
        use('terrortylor/nvim-comment')
        -- surrond
        use('tpope/vim-surround')
        -- Notification
        use('rcarriga/nvim-notify')
        -- todo
        use({
            'folke/todo-comments.nvim',
            requires = 'nvim-lua/plenary.nvim',
        })
        -- outline
        use('stevearc/aerial.nvim')
        -- colorizer
        use('norcalli/nvim-colorizer.lua')
    end,
    config = {
        display = {
            open_fn = function()
                return require('packer.util').float({ border = 'single' })
            end,
        },
    },
})

-- 每次保存 plugins.lua 自动安装插件
pcall(
    vim.cmd,
    [[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]]
)
