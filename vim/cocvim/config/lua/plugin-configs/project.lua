local helper = require "utils.helper"
local status, project = helper.loadModule('project_nvim')
local keybindings = require('keybindings')
local Module = {}

local function loadConfig()
  -- nvim-tree 支持
  vim.g.nvim_tree_respect_buf_cwd = 1
  project.setup({
    detection_methods = { "pattern" },
    -- 项目识别方式
    patterns = {
      ".git",
      "_darcs",
      ".hg",
      ".bzr",
      ".svn",
      "Makefile",
      "package.json",
      ".sln"
    },
  })

  local telescopeStatus, telescope = helper.loadModule("telescope")
  if not telescopeStatus then
    return
  end
  pcall(telescope.load_extension, "projects")
end

-- Load config for project
function Module.loadConfig()
  if not status then return end
  loadConfig()
  keybindings.project()
end



return Module
