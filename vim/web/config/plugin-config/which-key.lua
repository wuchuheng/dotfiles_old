local status, wk = pcall(require, 'which-key')

if not status then
    vim.notify('没有找到 wich-key')
    return
end

wk.register({
    ['<space>'] = {
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
            -- toggle目录
            m = {
                '<cmd>NvimTreeToggle<CR>',
                'File menu',
            },
            q = {
                '<cmd>Telescope quickfix<CR>',
                'quickfix',
            },
        },
        -- buffer 相关操作
        b = {
            name = 'Buffer',
            l = { '<cmd>Telescope buffers<CR>', 'list buffers' },
        },
        -- 移动
        m = {
            name = 'Cosors moving',
            l = {
                '<Plug>(easymotion-bd-jk)',
                'Move to line',
            },
            L = {
                '<Plug>(easymotion-overwin-line)',
                'Move to over win line',
            },
            w = {
                '<Plug>(easymotion-bd-w)',
                'Move to word',
            },
            W = {
                '<Plug>(easymotion-overwin-w)',
                'Move to over win word',
            },
            f = {
                '<Plug>(easymotion-bd-f)',
                'find {char} to move to {char}',
            },
            F = {
                '<Plug>(easymotion-overwin-f)',
                'find {char} to move to over {char}',
            },
            j = {
                '<Plug>(easymotion-j)',
                'j motions: line motions',
            },
            K = {
                '<Plug>(easymotion-k)',
                'K motions: line motions',
            },
            -- 搜索标记
            k = {
                '<cmd>Telescope marks<cr>',
                'find marks',
            },
        },
    },
})
