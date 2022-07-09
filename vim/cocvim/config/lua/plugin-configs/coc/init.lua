local autocmd = require('autocmd')
local keybindings = require('keybindings')
local explorer    = require('plugin-configs.coc.config.explorer')
local Module = {}
local flutter = require('plugin-configs.coc.config.flutter')

local config = function ()
    vim.g.coc_global_extensions = {
        explorer.loadConfig(), -- Explorer
        'coc-pairs', -- 成对符号
        flutter.loadConfig(),
        'coc-tsserver',
        'coc-html',
        'coc-css',
        'coc-lua',
        'coc-json',
        'coc-ecdict',
        'coc-marketplace',
        'coc-vetur', -- vue
    }
    vim.cmd([[
        function! ShowDocumentation()
          if CocAction('hasProvider', 'hover')
            call CocActionAsync('doHover')
          else
            call feedkeys('K', 'in')
          endif
        endfunction
        function! CheckBackspace() abort
          let col = col('.') - 1
          return !col || getline('.')[col - 1]  =~# '\s'
        endfunction
    ]])
    vim.cmd([[
      " Add `:Format` command to format current buffer.
      command! -nargs=0 Format :call CocActionAsync('format')

      " Add `:Fold` command to fold current buffer.
      command! -nargs=? Fold :call     CocAction('fold', <f-args>)

      " Add `:OR` command for organize imports of the current buffer.
      command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

      " Add (Neo)Vim's native statusline support.
      " NOTE: Please see `:h coc-status` for integrations with external plugins that
      " provide custom statusline: lightline.vim, vim-airline.
      set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
    ]])
end

-- Loading the config for this plugin
function Module.loadConfig()
    config()
    autocmd.coc()
    keybindings.coc()
    vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        -- 在输入模式下也更新提示，设置为 true 也许会影响性能
        update_in_insert = true,
    })
    local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
    for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end
end


return Module

