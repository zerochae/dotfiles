local M = {
  ---@type Base46HLGroupsList
  override = {},
  ---@type HLTable
  add = {},
}

local function merge(integration, orign_table)
  return vim.tbl_extend("force", integration, orign_table)
end

local ui = require "highlights.ui"
local syntax = require "highlights.syntax"
local plugins = require "highlights.plugins"
local integrations = {
  navic = require "highlights.integrations.navic",
  git_graph = require "highlights.integrations.git-graph",
  fugit2 = require "highlights.integrations.fugit2",
  nvimtree = require "highlights.integrations.nvimtree",
  nvim_bqf = require "highlights.integrations.nvim-bqf",
  vm_visual_multi = require "highlights.integrations.vim-visual-multi",
  nui = require "highlights.integrations.nui",
}

M.override = merge(syntax.override, M.override)
M.add = merge(syntax.add, M.add)

M.override = merge(plugins.override, M.override)
M.add = merge(plugins.add, M.add)

M.override = merge(ui.override, M.override)
M.add = merge(ui.add, M.add)

M.override = merge(integrations.navic, M.override)
M.override = merge(integrations.nvimtree, M.override)

M.add = merge(integrations.git_graph, M.add)
M.add = merge(integrations.fugit2, M.add)
M.add = merge(integrations.nvim_bqf, M.add)
M.add = merge(integrations.vm_visual_multi, M.add)
M.add = merge(integrations.nui, M.add)

return M
