local module = {}

function module.loadPackage(package)
    local status, p = pcall(require, package)
    if not status then
        vim.notify(package .. ' not found.')
    end
    return { status, p }
end

return module
