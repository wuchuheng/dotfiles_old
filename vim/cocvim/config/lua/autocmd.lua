local autoCmd = {}
local Debug =  require('utils.debug')

function autoCmd.coc()
 vim.cmd([[
    " Highlight the symbol and its references when holding the cursor.
    autocmd CursorHold * silent call CocActionAsync('highlight')
    augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  augroup end
  ]])

 -- Elimiinate the effects of expansion when recording macros
 vim.api.nvim_create_autocmd({ "RecordingEnter" }, {
  pattern = { "*" },
  command = "CocAction('deactivateExtension', 'coc-pairs')",
 })
 vim.api.nvim_create_autocmd({ "RecordingLeave" }, {
  pattern = { "*" },
  command = "CocAction('activeExtension', 'coc-pairs')",
 })
end

function autoCmd.identLine()
    vim.api.nvim_create_autocmd({ "BufModifiedSet" }, {
        pattern = { "*" },
        callback = function()
            local ignoredFiles = {
                'alpha',
                'coc-explorer'
            }
            for _, value in pairs(ignoredFiles) do ignoredFiles[value] = true end
            if ignoredFiles[vim.bo.filetype] then
                vim.cmd([[ 
                if exists(":IndentLinesDisable") 
                    IndentLinesDisable 
                    endif
                    ]])
                end
            end,
        })
end

return autoCmd


