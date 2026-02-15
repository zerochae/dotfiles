local default = require "plugins.lspconfig.servers.default"

local config = {
  filetypes = { "swift", "c", "cpp", "objc", "objcpp" },
}

default.setup_server("sourcekit", config)
