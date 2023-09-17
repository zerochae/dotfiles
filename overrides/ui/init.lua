local M = {}

local ui = require "custom.overrides.ui.core"
local ascii = require "custom.assets.ascii"

M.statusline = function(modules)
  modules[4] = ui.add_space(modules[4], 1)
  modules[5] = ui.statusline_location()
  modules[7] = ui.add_space(modules[7], 1)
  modules[8] = ui.statusline_lsp_status()
end

M.tabufline = function(modules)
  modules[1] = ui.empty_string()
  modules[4] = ui.empty_string()
end

M.nvdash = ascii.logo.neofetch

return M
