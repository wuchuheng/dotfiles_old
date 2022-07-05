local keyRegister = require('plugin-configs.which-key').register
local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }
vim.g.mapleader = ',' -- 指定leader键位
vim.g.maplocalleader = '-' -- 指定local leader键位
local keybinding = {}

-------------------------------------------------------------------------------
--                          基本快捷键配置
-------------------------------------------------------------------------------
keyRegister({
  ['<leader>'] = {
    s = {
      name = 'Source',
      c = {
        ':so $MYVIMRC<CR>',
        'Source config'
      }
    }
  }
})

-------------------------------------------------------------------------------
--                          解决neovide不能使用mac OS系统粘贴的问题
-------------------------------------------------------------------------------
vim.g.neovide_input_use_logo = 1
map('', '<D-v>', '+p<CR>', opt)
map('!', '<D-v>', '<C-R>+', opt)
map('t', '<D-v>', '<C-R>+', opt)
map('v', '<D-v>', '<C-R>+', opt)

-------------------------------------------------------------------------------
--                          窗口调整快捷键配置
-------------------------------------------------------------------------------
map('n', '<Left>', ':winc <<CR>', opt) -- 窗口向左放大
map('n', '<Right>', ':winc ><CR>', opt) -- 窗口向右放大
map('n', '<Down>', '<C-w>+', opt) -- 窗口向上放大
map('n', '<Up>', '<C-w>-', opt) -- 窗口向下放大
map('n', '<Right>', ':winc ><CR>', opt) -- 窗口向右放大
map('n', 's=', '<C-w>=', opt) -- 窗口垂直等大

-------------------------------------------------------------------------------
--                          搜索快捷键配置
-------------------------------------------------------------------------------
-- 关闭搜索高亮
keyRegister({
  ['<space>'] = {
    l = {
     ':<C-u>nohlsearch<CR>',
     'nohlsearch'
    }
  }
})

-------------------------------------------------------------------------------
--                          移动文本快捷键配置
-------------------------------------------------------------------------------
map('v', 'J', ":move '>+1<cr>gv-gv", opt) -- 向下移
map('v', 'K', ":move '<-2<cr>gv-gv", opt) -- 向上移

-------------------------------------------------------------------------------
--                          exporer 快捷键配置
-------------------------------------------------------------------------------
keyRegister({
  ['<space>'] = {
    f = {
    name = "files",
      m = {
        ':CocCommand explorer --toggle --sources=file+<CR>',
        'Open explorer'
      }
    }
  }
})


-------------------------------------------------------------------------------
--                          Coc 快捷键配置
-------------------------------------------------------------------------------
function keybinding.coc()
  vim.cmd([[
    " Tab 补全
    inoremap <silent><expr> <TAB>
          \ pumvisible() ? "\<C-n>" :
          \ CheckBackspace() ? "\<TAB>" :
          \ coc#refresh()
    " 刷新补全列表
    inoremap <silent><expr> <c-space> coc#refresh()
    " 回车自动补全
    inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                                \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
  ]])
  vim.cmd([[
    " Use `[g` and `]g` to navigate diagnostics
    " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)
  ]])
  vim.cmd([[
    " Use `[g` and `]g` to navigate diagnostics
    " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)
  ]])
  vim.cmd([[
    " GoTo code navigation.
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)
    " Use K to show documentation in preview window.
    nnoremap <silent>gh :call ShowDocumentation()<CR>
  ]])
  vim.cmd([[
    " Symbol renaming.
    nmap <leader>rn <Plug>(coc-rename)
  ]])
  vim.cmd([[
    " Formatting selected code.
    xmap <leader>f  <Plug>(coc-format-selected)
    nmap <leader>f  <Plug>(coc-format-selected)
  ]])
  -- Applying codeAction to the selected region.
  vim.cmd([[
  " Example: `<leader>aap` for current paragraph
    xmap <leader>a  <Plug>(coc-codeaction-selected)
  ]])
  keyRegister({
    ['<leader>'] = {
      a = {
        name = 'Code action.',
        a = {
        '<Plug>(coc-codeaction-selected)',
        'Applying codeAction to the selected region.'
        },
        c = {
          '<Plug>(coc-codeaction)',
          'Remap keys for applying codeAction to the current buffer'
        },
      },
      q = {
        name = 'Quick fix',
        f = {
          '<Plug>(coc-fix-current)',
          'Apply AutoFix to problem on the current line.'
        }
      }
    },
    c = {
      name = 'Code lens',
      l = {
        '<Plug>(coc-codelens-action)',
        'Run the Code Lens action on the current line.'
      }
    }
  })
  vim.cmd([[
    " Map function and class text objects
    " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
    xmap if <Plug>(coc-funcobj-i)
    omap if <Plug>(coc-funcobj-i)
    xmap af <Plug>(coc-funcobj-a)
    omap af <Plug>(coc-funcobj-a)
    xmap ic <Plug>(coc-classobj-i)
    omap ic <Plug>(coc-classobj-i)
    xmap ac <Plug>(coc-classobj-a)
    omap ac <Plug>(coc-classobj-a)
  ]])
  vim.cmd([[
    " Remap <C-f> and <C-b> for scroll float windows/popups.
    if has('nvim-0.4.0') || has('patch-8.2.0750')
      nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
      nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
      inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
      inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
      vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
      vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
    endif
  ]])
  vim.cmd([[
    " Use CTRL-S for selections ranges.
    " Requires 'textDocument/selectionRange' support of language server.
    nmap <silent> <C-s> <Plug>(coc-range-select)
    xmap <silent> <C-s> <Plug>(coc-range-select)
  ]])
  -- " Mappings for CoCList
  keyRegister({
    ['<space>'] = {
      c = {
        name = 'Mappings for Coclist',
        a = {
          ':<C-u>CocList diagnostics<cr>',
          'Show all diagnostics.'
        },
        d = {
            ':CocDisable<cr>',
            'disable Coc extensions.'
        },
        e = {
          name = 'Coc extensions',
          e = {
            ':<C-u>CocList extensions<cr>',
            'Manage extensions.'
          },
          n = {
            ':CocEnable<cr>',
            'Enable Coc extensions.'
          },
        },
        c = {
          ':<C-u>CocList commands<cr>',
          'Show commands.'
        },
        o = {
          ':<C-u>CocList outline<cr>',
          'Find symbol of current document.'
        },
        s = {
          ':<C-u>CocList -I symbols<cr>',
          'Search workspace symbols.'
        },
        j = {
          ':<C-u>CocNext<CR>',
          'Do default action for next item.'
        },
        k = {
          ':<C-u>CocPrev<CR>',
          'Do default action for previous item.'
        },
        p = {
          ':<C-u>CocListResume<CR>',
          'Resume latest coc list.'
        },
      }
    }
  })
end

-------------------------------------------------------------------------------
--                          Telescope快捷键配置
-------------------------------------------------------------------------------
keybinding.telescope = function ()
  -- 查找文件
  map('n', '<C-p>', ':Telescope find_files<CR>', opt)
  -- 全局搜索
  map('n', '<space>gf', ':Telescope live_grep<CR>', opt)
  map('n', '<space>bl', ':Telescope buffers<CR>', opt)
  keyRegister({
    ['<space>'] = {
      f = {
        name = 'Files',
        t = { ':Telescope live_grep<cr>', 'Find text.'},
        f = { ':Telescope live_files<cr>', 'Find files.'},
        r = { ':Telescope oldfiles<cr>', 'Recently fiiles'}
      },
      q = {
        name = 'Quickfix',
        f = {':Telescope quickfix<cr>', 'Quickfix'}
      },
      b = {
        name = 'Buffer',
        l = { ':Telescope buffers<cr>', 'List buffers' },
      },
      g = {
        name = "Git",
        s = {':Telescope git_status<cr>', 'Git status'},
        b = {':Telescope git_branches<cr>', 'Git branches'},
        c = {':Telescope git_commits<cr>', 'Git commits'}
      },
      m = {
        name = 'Marks',
        k = {':Telescope marks<cr>', 'Find marks'}
      },
      e = {
        nam= "Env",
        n = {':Telescope env<cr>', 'Env list'}

      }
    }
  })
  
  local config = {
    i = {
      -- 上下移动
      ['<C-j>'] = 'move_selection_next',
      ['<C-k>'] = 'move_selection_previous',
      ['<Down>'] = 'move_selection_next',
      ['<Up>'] = 'move_selection_previous',
      -- 历史记录
      ['<C-n>'] = 'cycle_history_next',
      ['<C-p>'] = 'cycle_history_prev',
      -- 关闭窗口
      ['<C-c>'] = 'close',
      -- 预览窗口上下滚动
      ['<C-u>'] = 'preview_scrolling_up',
      ['<C-d>'] = 'preview_scrolling_down',
    },
  }
  return config
end

-------------------------------------------------------------------------------
--                           Statue line 快捷键配置
-------------------------------------------------------------------------------
function keybinding.statueLine()
  local function gotoWinByWinNumber(winNumber)
    local winId = vim.fn.win_getid(winNumber)
    vim.fn.win_gotoid(winId)
  end
  keyRegister({
    ['<space>'] = {
      ['1'] = { function() gotoWinByWinNumber(1) end, "Windows 1"},
      ['2'] = { function() gotoWinByWinNumber(2) end, "Windows 2"},
      ['3'] = { function() gotoWinByWinNumber(3) end, "Windows 3"},
      ['4'] = { function() gotoWinByWinNumber(4) end, "Windows 4"},
      ['5'] = { function() gotoWinByWinNumber(5) end, "Windows 5"},
      ['6'] = { function() gotoWinByWinNumber(6) end, "Windows 6"},
      ['7'] = { function() gotoWinByWinNumber(7) end, "Windows 7"},
      ['8'] = { function() gotoWinByWinNumber(8) end, "Windows 8"},
      ['9'] = { function() gotoWinByWinNumber(9) end, "Windows 9"},
    }
  })
end
-------------------------------------------------------------------------------
--                          buferLine快捷键配置
-------------------------------------------------------------------------------
function keybinding.bufferLine()
  keyRegister({
    ['<leader>'] = {
      ['1'] = {
        ':BufferLineGoToBuffer 1 <CR>',
        'Tab 1'
      },
      ['2'] = {
        ':BufferLineGoToBuffer 2 <CR>',
        'Tab 2'
      },
      ['3'] = {
        ':BufferLineGoToBuffer 3 <CR>',
        'Tab 3'
      },
      ['4'] = {
        ':BufferLineGoToBuffer 4 <CR>',
        'Tab 4'
      },
      ['5'] = {
        ':BufferLineGoToBuffer 5 <CR>',
        'Tab 5'
      },
      ['6'] = {
        ':BufferLineGoToBuffer 6 <CR>',
        'Tab 6'
      },
      ['7'] = {
        ':BufferLineGoToBuffer 7 <CR>',
        'Tab 7'
      },
      ['8'] = {
        ':BufferLineGoToBuffer 8 <CR>',
        'Tab 8'
      },
      ['9'] = {
        ':BufferLineGoToBuffer 9 <CR>',
        'Tab 9'
      },
    }
  })
  map('n', '<C-w>c', ':Bdelete!<CR>', opt) -- 关闭窗口
end
-------------------------------------------------------------------------------
--                          toggleterm快捷键配置
-------------------------------------------------------------------------------
function keybinding.toggleterm()
  map('t', '<Esc>', '<C-\\><C-n>', opt) -- Esc退出terminal
  keyRegister({
    ['<space>'] = {
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
    }
  })
end

return keybinding

