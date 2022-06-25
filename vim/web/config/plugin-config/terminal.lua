local status, terminal = pcall(require, 'toggleterm')

if not status then
    vim.notify('Not found toggleterm.')
    return
end

terminal.setup()
