local autoCmd = {}

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
  vim.api.nvim_create_autocmd({"RecordingEnter"}, {
    pattern = {"*"},
    command = "CocAction('deactivateExtension', 'coc-pairs')",
  })
 vim.api.nvim_create_autocmd({"RecordingLeave"}, {
   pattern = { "*"},
   command = "CocAction('activeExtension', 'coc-pairs')",
 })
end

return autoCmd


