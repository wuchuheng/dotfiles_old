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
        use{
          'neoclide/coc.nvim',
          branch = 'master',
          run = 'yarn install --frozen-lockfile',
          config = function() require('plugin-configs.coc').loadConfig() end
        }
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
        -- indentline
        use({
          'yggdroot/indentline',
          config = function () require('plugin-configs.indentline').loadConfig() end
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
local cmdGroupName = api.nvim_create_augroup("cmdGroupForPacker", { clear = true })
api.nvim_create_autocmd(
    "BufWritePost",
    {
        pattern = "plugins.lua",
        command = "source <afile> | PackerSync",
        group = cmdGroupName,
    }
)


