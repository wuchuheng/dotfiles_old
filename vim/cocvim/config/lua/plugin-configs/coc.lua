local autocmd = require('autocmd')
local keybindings = require('keybindings')
local Module = {}

-- Loading the config for this plugin
function Module.loadConfig()
  local config = function ()
    vim.g.coc_global_extensions = {
      'coc-explorer', -- 目录树
      'coc-pairs', -- 成对符号
      'coc-flutter', -- flutter
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
  config()
  autocmd.coc()
  keybindings.coc()
end

return Module

