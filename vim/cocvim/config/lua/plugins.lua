local packer = require('packer')
local api = vim.api

packer.startup({
    function(use)
        use('wbthomason/packer.nvim') -- Packer
        -- Notification
        use({
          'rcarriga/nvim-notify',
          config = function ()
            require('plugin-configs.notify').loadConfig()
          end
        })
        -- keymapping
        use{
          'folke/which-key.nvim',
          config = function() require('plugin-configs.which-key').loadConfig() end
        }
        --  colorschem
        use{
          'folke/tokyonight.nvim',
          config = function() require('plugin-configs.colorscheme').loadConfig() end
        }
        -- coc
        -- use{
        --   'neoclide/coc.nvim',
        --   branch = 'master',
        --   run = 'yarn install --frozen-lockfile',
        --   config = function() require('plugin-configs.coc').loadConfig() end
        -- }
        -- telescope
        use{
          'nvim-telescope/telescope.nvim',
          requires = {
            'nvim-lua/plenary.nvim',
            'LinArcX/telescope-env.nvim', -- env list
          },
          config = function() require('plugin-configs.telescope').loadConfig() end
        }
        -- statue-line
        use{
          'nvim-lualine/lualine.nvim',
          requires = {
            'kyazdani42/nvim-web-devicons', 'arkav/lualine-lsp-progress'
          },
          config = function() require('plugin-configs.statue-line').loadConfig() end
        }
        -- buffer-line
        use{
          'akinsho/bufferline.nvim',
          requires = { 'kyazdani42/nvim-web-devicons', 'moll/vim-bbye' },
          config = function() require('plugin-configs.buffer-line').loadConfig() end
        }
        -- terminal
        use{
          'akinsho/toggleterm.nvim',
          tag = 'v1.*',
          config = function() require('plugin-configs.toggleterm').loadConfig() end
        }
        -- dashboard
        use({
            'goolord/alpha-nvim',
            requires = { 'kyazdani42/nvim-web-devicons' },
            config = function ()
              require('plugin-configs.dashboard').loadConfig()
            end
        })
        -- Projects
        use({
          'ahmedkhalf/project.nvim',
          config = function () require('plugin-configs.project').loadConfig() end
        })
        -- surrond
        use('tpope/vim-surround')
        -- easymotion
        use({
          'easymotion/vim-easymotion',
          config = function () require('plugin-configs.easymotion').loadConfig() end
        })
        -- Comment
        use({
            'terrortylor/nvim-comment',
            config = function () require('plugin-configs.nvim-comment').loadConfig() end
        })
        -- todo
        use({
            'folke/todo-comments.nvim',
            requires = 'nvim-lua/plenary.nvim',
            config = function()
                require('plugin-configs.todo-comments').loadConfig()
            end
        })
        -- Git
        use({
            'sindrets/diffview.nvim',
            requires = {
                'lewis6991/gitsigns.nvim'
            },
            config = function ()
                require('plugin-configs.git').loadConfig()
            end
        })
        -- syntax highlight
        use({
            'lukas-reineke/indent-blankline.nvim',
            requires = {
                { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
            },
            config = function ()
                require('plugin-configs.highlight').loadConfig()
            end
        })
        -- outline
        use {
            'stevearc/aerial.nvim',
            config = function() require('plugin-configs.outline').loadConfig() end
        }
        -- CSS
        use({
            'norcalli/nvim-colorizer.lua',
            config = function () require('plugin-configs.css').loadConfig() end
        })
        -- translator
        use({
            'voldikss/vim-translator',
            config = function ()
                require('plugin-configs.translator').loadConfig()
            end
        })
        -- enhance
        use({'AndrewRadev/splitjoin.vim'})
        use({
            'terryma/vim-expand-region',
            config = function ()
                require('plugin-configs.uexpand-region').loadConfig()
            end
        })
        -- nvim lua guid
        use({ 'nanotee/nvim-lua-guide' })
        -- nvim-tree
        use({
            "kyazdani42/nvim-tree.lua",
            requires = "kyazdani42/nvim-web-devicons",
            config = function() require('plugin-configs.nvim-tree').loadConfig() end
        })
        -- Autopairs
        use({
            'windwp/nvim-autopairs',
            config = function () require('plugin-configs.nvim-autopairs').loadConfig() end
        })
        -- LSP
        use({
            "williamboman/nvim-lsp-installer",
            commit = "36b44679f7cc73968dbb3b09246798a19f7c14e0",
            requires= {
                'neovim/nvim-lspconfig',
            },
            config = function() require('plugin-configs.lsp.init').loadConfig() end
        })
        -- CMP
        use({
                'hrsh7th/nvim-cmp',
            requires = {
                -- snippet 引擎
                'hrsh7th/vim-vsnip',
                -- 补全源
                'hrsh7th/cmp-vsnip',
                'hrsh7th/cmp-nvim-lsp', -- { name = nvim_lsp },
                'hrsh7th/cmp-buffer', -- { name = 'buffer' },
                'hrsh7th/cmp-path', -- { name = 'path' } ,
                'hrsh7th/cmp-cmdline', -- { name = 'cmdline' },
                'rafamadriz/friendly-snippets', -- 常见编程语言代码段,
                'onsails/lspkind-nvim', -- the symbol icon in CMP list
                'tami5/lspsaga.nvim', -- enhance CMP list
                'simrat39/rust-tools.nvim'
            },
            config = function()
                require('plugin-configs.cmp').loadConfig()
            end
        })

        -- Dubuger
        use({
            'puremourning/vimspector',
            config = function()
                -- require('plugin-configs.debugger.init')
            end
        })
    end
})

-- 每次保存 plugins.lua 自动安装插件
local cmdGroupName = api.nvim_create_augroup("cmdGroupForPacker", { clear = true })
api.nvim_create_autocmd(
    "BufWritePost",
    {
        pattern = "plugins.lua",
        command = "source <afile> | PackerSync",
        group = cmdGroupName,
    }
)


