local Module = {}

function Module.gotoWinByWinNumber(winNumber)
    local winId = vim.fn.win_getid(winNumber)
    vim.fn.win_gotoid(winId)
end

function Module.closeWinByid(id)
    local winId = vim.fn.win_getid(id)
    vim.fn.win_execute(winId, 'close')
end

function Module.closeCurrentWind()
    local winId = vim.fn.win_getid()
    vim.fn.win_execute(winId, 'close')
end


return Module
