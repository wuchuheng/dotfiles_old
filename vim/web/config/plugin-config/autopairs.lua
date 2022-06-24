local status, autopairs = pcall(require, 'nvim-autopairs')

if not status then
    vim.notify('没有发现 nvim-autopairs')
    return
end

autopairs.setup()
