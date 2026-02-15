local default = require "plugins.lspconfig.servers.default"

local config = {
  init_options = {
    diagnostic = {
      enable = false,
    },
  },
}

default.setup_server("vimls", config)
