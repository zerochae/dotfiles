local default = require "plugins.lspconfig.servers.default"

local config = {
  settings = {
    Lua = {
      hint = {
        enable = true,
      },
      workspace = {
        checkThirdParty = false,
        library = vim.api.nvim_get_runtime_file("lua", true),
      },
      completion = {
        callSnippet = "Replace",
      },
    },
  },
}

default.setup_server("lua_ls", config)
