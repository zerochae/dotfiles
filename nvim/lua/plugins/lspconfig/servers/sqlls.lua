local default = require "plugins.lspconfig.servers.default"
local config = {
  filetypes = { "sql", "mysql" },
  on_attach = function(client)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end,
  handlers = {
    ["textDocument/publishDiagnostics"] = function() end,
  },
}

default.setup_server("sqlls", config)
