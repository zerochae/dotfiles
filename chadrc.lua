---@type ChadrcConfig
local M = {}

local highlights = require "custom.overrides.highlights"
local custom_ui = require "custom.overrides.ui"
local ascii = require "custom.assets.ascii"

M.ui = {
  theme = "onedark",
  theme_toggle = { "onedark", "one_light" },
  hl_override = highlights.override,
  hl_add = highlights.add,
  transparency = true,
  extended_integrations = { "notify", "navic", "hop", "rainbowdelimiters" },

  tabufline = {
    overriden_modules = custom_ui.tabufline,
  },

  statusline = {
    separator_style = "default",
    overriden_modules = custom_ui.statusline,
  },

  cmp = {
    style = "atom_colored",
    selected_item_bg = "colored",
    border_color = "statusline_bg",
  },

  nvdash = {
    load_on_startup = true,
    header = ascii.logo.neofetch,
    buttons = {
      { "  Find File", "<leader> ff", "Telescope find_files" },
      { "󰈚  Recent Files", "<leader> fo", "Telescope oldfiles" },
      { "  Note", "<leader> rg", "Neorg index" },
      { "  Database", "<leader> db", "bd|DBUI" },
    },
  },
}

M.plugins = "custom.plugins"

M.mappings = require "custom.mappings"

return M
