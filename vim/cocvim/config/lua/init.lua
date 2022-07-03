--[[
    @Author:   wuchuheng <root@wuchuheng.com>
    @Github:   https://github.com/wuchuheng
    @License:  MIT License
--]]
local helper = require('utils.helper')
local currentPath = Path:getInstance():getCurrentFilePath():getDirName().path
local unloadModules = {
  'utils',
  'init',
}
helper.loadModules(currentPath, unloadModules)

