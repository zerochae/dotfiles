local present, notify = pcall(require, "notify")
local lsp_loader = require "custom.overrides.ui.lsp_lodaer"
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
}

local ui_extension = {
  lsp_loader = lsp_loader(notify),
}

for _, extension in pairs(ui_extension) do
  extension()
end
