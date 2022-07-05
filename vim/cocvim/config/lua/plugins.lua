local packer = require('packer')
local api = vim.api

packer.startup({
    function(use)
        use('wbthomason/packer.nvim') -- Packer自己本身
        -- 快捷键
        use{
          'folke/which-key.nvim',
          config = function() require('plugin-configs.which-key').loadConfig() end
        }
        -- 主题
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
            'LinArcX/telescope-env.nvim', -- env列表功能
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


