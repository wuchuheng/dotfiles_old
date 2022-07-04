local packer = require('packer')
local api = vim.api

packer.startup({
    function(use)
        use('wbthomason/packer.nvim') -- Packer自己本身
        use('folke/which-key.nvim') -- 快捷键插件
        use {'neoclide/coc.nvim', branch = 'master', run = 'yarn install --frozen-lockfile'} -- coc插件
        use('folke/tokyonight.nvim') -- 主题插件
        -- 搜索插件 需要依赖外部工具,通过:checkhealth telescope 查看相关依赖
        use({
            'nvim-telescope/telescope.nvim',
            requires = {
                'nvim-lua/plenary.nvim',
                'LinArcX/telescope-env.nvim', -- env列表功能
            },
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



