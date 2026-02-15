local default = require "plugins.lspconfig.servers.default"

local config = {
  init_options = {
    provideFormatter = false,
  },
  settings = {
    css = {
      validate = true,
      lint = {
        unknownAtRules = "ignore",
      },
    },
    scss = {
      validate = true,
      lint = {
        unknownAtRules = "ignore",
      },
    },
    less = {
      validate = true,
      lint = {
        unknownAtRules = "ignore",
      },
    },
  },
}

default.setup_server("cssls", config)
