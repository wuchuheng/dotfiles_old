local packer = require('packer')
local api = vim.api

packer.startup({
    function(use)
        -- Packer 可以管理自己本身
        use('wbthomason/packer.nvim')
        use('folke/which-key.nvim')
        use {'neoclide/coc.nvim', branch = 'master', run = 'yarn install --frozen-lockfile'}
        use('folke/tokyonight.nvim') -- 主题插件
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



