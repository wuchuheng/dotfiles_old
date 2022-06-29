local status, colorizer = pcall(require, 'colorizer')

if not status then
    vim.notify('Not found colorizer.')
    return
end

colorizer.setup()
