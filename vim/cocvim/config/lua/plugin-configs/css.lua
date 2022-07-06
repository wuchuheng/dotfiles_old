local Module = {}
local helper = require('utils.helper')
local status, colorizer = helper.loadModule('colorizer')

function Module.loadConfig()
    if not status then return end
    colorizer.setup({
        '*'; -- Highlight all files, but customize some others.
        css = { rgb_fn = true; }; -- Enable parsing rgb(...) functions in css.
        html = { names = false; } -- Disable parsing "names" like Blue or Gray
    })
end

return Module
