local default = require "configs.lspconfig.servers.default"

local config = {
  filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
}

default.setup_server("tailwindcss", config)

