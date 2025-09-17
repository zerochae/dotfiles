local default = require "configs.lspconfig.servers.default"

local config = {
  settings = {
    gopls = {
      hints = {
        rangeVariableTypes = true,
        parameterNames = true,
        constantValues = true,
        assignVariableTypes = true,
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        functionTypeParameters = true,
      },
      gofumpt = true,
    },
  },
}

default.setup_server("gopls", config)

