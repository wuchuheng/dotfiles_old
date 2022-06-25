local status, wk = pcall(require, 'which-key')

if not status then
    vim.notify('没有找到 wich-key')
    return
end

wk.register({
    ['<leader>'] = {
        h = {
            name = 'hello world',
            l = {
                function()
                    print('hello world!')
                end,
                'hello world',
            },
        },
        -- 文件相关操作
        f = {
            name = 'File',
            f = { '<cmd>:Telescope live_grep<CR>', 'Find File' },
            l = { '<cmd>:Telescope live_grep<CR>', 'live search' },
            m = {},
        },
        -- buffer 相关操作
        b = {
            name = 'Buffer',
            l = { '<cmd>Telescope buffers<CR>', 'list buffers' },
        },
    },
})
