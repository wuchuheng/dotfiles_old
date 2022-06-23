local packer = require("packer")
packer.startup({
  function(use)
    -- Packer 可以管理自己本身
    use 'wbthomason/packer.nvim' 
    use("folke/tokyonight.nvim")                                    -- 主题插件
    -- 目录插件
    use {
      'kyazdani42/nvim-tree.lua',
      requires = {
        'kyazdani42/nvim-web-devicons'
      },
      tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }
    -- bufferLine
    use({ 
      "akinsho/bufferline.nvim",
      requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" }
    })
  end,
  config = {
    display = {
      open_fn = function()
        return require("packer.util").float({ border = "single" })
      end,
    },
  }
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
