local default = require "plugins.lspconfig.servers.default"

local config = {
  filetypes = { "sh", "zsh", "bash" },
}

default.setup_server("bashls", config)
