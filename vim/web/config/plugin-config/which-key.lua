local status, wk = pcall(require, 'which-key')

if not status then
    vim.notify('没有找到 wich-key')
    return
end

wk.register({
    ['<space>'] = {
        ['<space>'] = {
            '<Plug>(choosewin)',
            'choosewin',
        },
        -- git key maping
        p = {
            name = 'Projects',
            o = {
                ':Telescope projects<CR>',
                'Open project',
            },
        },
        h = {
            name = 'hello world',
            l = {
                function()
                    print('hello world!')
                end,
                'hello world',
            },
        },
        t = {
            name = 'Terminal',
            t = {
                ':ToggleTerm<cr>',
                'Toggle terminal',
            },
            a = {
                ':ToggleTermToggleAll<cr>',
                'Toggle all terminal',
            },
            ['1'] = {
                ':ToggleTerm 1<cr>',
                'Toggle terminal 0',
            },
            ['2'] = {
                ':ToggleTerm 2<cr>',
                'Toggle terminal 2',
            },
        },
        -- 文件相关操作
        f = {
            name = 'File',
            f = { '<cmd>:Telescope find_files<CR>', 'Find File' },
            t = { '<cmd>:Telescope live_grep<CR>', 'Find text.' },
            -- toggle目录
            m = {
                '<cmd>NvimTreeToggle<CR>',
                'File menu',
            },
            q = {
                '<cmd>Telescope quickfix<CR>',
                'quickfix',
            },
            o = {
                name = 'Open files',
                r = {
                    ':Telescope oldfiles<CR>',
                    'Open recently files.',
                },
            },
        },
        -- buffer 相关操作
        b = {
            name = 'Buffer',
            l = { '<cmd>Telescope buffers<CR>', 'list buffers' },
        },
        g = {
            name = 'Git key maping.',
            s = {
                ':Telescope git_status<CR>',
                'Git status',
            },
            b = {
                ':Telescope git_branches<CR>',
                'Git branches',
            },
            c = {
                ':Telescope git_commits<CR>',
                'Git commit',
            },
            d = {
                name = 'git diffence view',
                o = {
                    ':DiffviewOpen<cr>',
                    'Open git diffence view',
                },
                c = {
                    ':DiffviewClose<cr>',
                    'Close git diffence view',
                },
                h = {
                    ':DiffviewFileHistory<cr>',
                    'Show the view of git history.',
                },
            },
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
