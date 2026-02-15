local default = require "plugins.lspconfig.servers.default"

local config = {
  cmd = {
    "clangd",
    "--offset-encoding=utf-16",
  },
}

default.setup_server("clangd", config)
