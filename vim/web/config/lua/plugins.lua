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
    -- statueLine 
    use({ 
      "nvim-lualine/lualine.nvim",
      requires = { "kyazdani42/nvim-web-devicons" }
    })
    use("arkav/lualine-lsp-progress")
    -- 搜索插件 需要依赖外部工具,通过:checkhealth telescope 查看相关依赖
    use { 'nvim-telescope/telescope.nvim', requires = { 
      "nvim-lua/plenary.nvim",
      "LinArcX/telescope-env.nvim" -- env列表功能 
    } }
    -- 启动页
    use("glepnir/dashboard-nvim")
    -- 用于启动页的项目
    use("ahmedkhalf/project.nvim")
    -- 语法高亮
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
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
