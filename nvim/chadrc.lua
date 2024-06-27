---@type ChadrcConfig
local M = {}

local highlights = require "custom.overrides.highlights"
local custom_ui = require "custom.overrides.ui"

M.lazy_nvim = {
  ui = {
    -- backdrop = 100,
    border = "single",
  },
}

M.ui = {
  lsp_semantic_tokens = false,
  theme = "onedark",
  theme_toggle = { "onedark", "onedark" },
  hl_override = highlights.override,
  hl_add = highlights.add,
  transparency = true,
  extended_integrations = { "notify", "navic", "hop" },
  tabufline = custom_ui.tabufline,
  statusline = custom_ui.statusline,
  nvdash = custom_ui.dashboard,
  cmp = custom_ui.cmp,
}

M.plugins = "custom.plugins"

M.mappings = require "custom.mappings"

return M
