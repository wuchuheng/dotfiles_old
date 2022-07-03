local helper = require('utils.helper')
local currentPath = Path:getInstance():getCurrentFilePath():getDirName().path
local unloadModules = {
  'init'
}
local modulePrefix = 'plugin-configs'
helper.loadModules(currentPath, unloadModules, modulePrefix)
