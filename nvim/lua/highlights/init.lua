local M = {
  ---@type Base46HLGroupsList
  override = {},
  ---@type HLTable
  add = {},
}

local function merge(integration, orign_table)
  return vim.tbl_deep_extend("force", integration, orign_table)
end

local ui = require "highlights.ui"
local syntax = require "highlights.syntax"
local plugins = require "highlights.plugins"

M.override = merge(syntax.override, M.override)
M.add = merge(syntax.add, M.add)

M.override = merge(plugins.override, M.override)
M.add = merge(plugins.add, M.add)

M.override = merge(ui.override, M.override)
M.add = merge(ui.add, M.add)

return M
