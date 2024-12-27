local M = {}

local ui = require "custom.overrides.ui.core"

M.statusline = {
  separator_style = "block",
  overriden_modules = function(modules)
    modules[1] = ui.mode()
    modules[2] = ui.fileInfo()
    modules[3] = ui.git()
    modules[4] = ui.lsp_loader()
    modules[5] = ui.add_space_back(ui.LSP_Diagnostics(), 1)
    modules[6] = ui.empty_string()
    modules[7] = ui.empty_string()
    modules[8] = ui.lsp()
    modules[9] = ui.empty_string()
    modules[10] = ui.line_and_column()
  end,
}

M.tabufline = {
  overriden_modules = function(modules)
    modules[1] = ui.nvim_tree_padding()
    modules[2] = ui.bufferlist(modules[2])
    modules[4] = ui.empty_string()
  end,
}

M.dashboard = {
  load_on_startup = true,
  header = ui.dashboard_header(),
  buttons = {
    { "  Find File", "ff", "Telescope find_files" },
    { "󰈚  Recent Files", "fo", "Telescope oldfiles" },
    -- { "  Note", "rg", "Neorg index" },
    { "  Database", "db", "bd|DBUI" },
    { "  WorkSpace", "ws", "Telescope workspaces" },
  },
}

M.cmp = {
  lspkind_text = false,
  style = "atom_colored",
  selected_item_bg = "colored",
  border_color = "statusline_bg",
}

return M
