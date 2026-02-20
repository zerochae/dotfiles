local default = require "plugins.lspconfig.servers.default"

local config = {
  init_options = {
    typescript = {
      tsdk = vim.fn.expand "$HOME/.local/share/nvim/mason/packages/typescript-language-server/node_modules/typescript/lib",
    },
  },
}

default.setup_server("vue_ls", config)
