local status, treesitter = pcall(require, 'nvim-treesitter.configs')
if not status then 
  vim.notify('没有找到 nvim-treesiter')
  return;
end


treesitter.setup({
  ensure_installed = {
    'json',
    'html',
    'css',
    'vim',
    'lua',
    'javascript',
    'typescript',
    'tsx'
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
  -- 根据语法增量或减量选中
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<CR>",
      node_incremental = "<CR>",                                -- normal模式回车加大选中
      node_decremental = "<BS>",                                -- BACk键回退选中
      scope_incremental = "<TAB>",                              -- TAB 加大选中
    },
  },
  indent = {
    enable = true,
  },
})

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- 默认不要折叠
vim.opt.foldlevel = 99
