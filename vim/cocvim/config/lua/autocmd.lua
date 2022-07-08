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
 vim.api.nvim_create_autocmd({ "RecordingEnter" }, {
  pattern = { "*" },
  command = "CocAction('deactivateExtension', 'coc-pairs')",
 })
 vim.api.nvim_create_autocmd({ "RecordingLeave" }, {
  pattern = { "*" },
  command = "CocAction('activeExtension', 'coc-pairs')",
 })
end

function autoCmd.nvimTree()
    -- 自动关闭
    vim.cmd([[
        autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
    ]])
end

function autoCmd.cocFlutter()
    vim.cmd([[
        autocmd BufWritePost *.dart lua vim.fn.win_execute(vim.fn.win_getid(2), '1TermExec cmd="r"')
    ]])
end

return autoCmd


