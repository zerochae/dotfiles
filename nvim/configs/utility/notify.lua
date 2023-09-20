local present, notify = pcall(require, "notify")
local lsp_loader = require "custom.overrides.ui.lsp_lodaer"
local plugin_updater = require "custom.overrides.ui.plugin_updater"
-- local cava = require "custom.overrides.ui.cava"

if not present then
  return
end

local banned_messages = {
  "No information available",
  "No code actions available",
  "method textDocument/codeAction is not supported by any of the servers registered for the current buffer",
  "no manual entry for",
  "No matching notification found to replace",
}

vim.notify = function(msg, ...)
  for _, banned in ipairs(banned_messages) do
    if string.match(msg, banned) then
      return
    end
  end
  notify(msg, ...)
end

notify.setup {
  background_colour = "#000000",
  on_open = function(win)
    vim.api.nvim_win_set_config(win, { zindex = 2000 })
  end,
}

local ui_extension = {
  lsp_loader = lsp_loader(notify),
  plugin_updater = plugin_updater(notify),
}

for _, extension in pairs(ui_extension) do
  extension()
end
