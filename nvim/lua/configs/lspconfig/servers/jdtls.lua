local default = require "configs.lspconfig.servers.default"
local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")

local config = {
  filetypes = { "java" },
  cmd = {
    vim.fn.expand(mason_path .. "packages/jdtls/jdtls"),
    "--jvm-arg=-javaagent:" .. vim.fn.expand(mason_path .. "packages/jdtls/lombok.jar"),
  },
  handlers = {
    ["$/progress"] = function() end,
    ["language/status"] = function() end,
  },
  settings = {
    java = {
      project = {
        Lombok = {
          enabled = true,
        },
      },
    },
  },
  on_attach = function(client, bufnr)
    client.server_capabilities.semanticTokensProvider = nil
  end,
}

default.setup_server("jdtls", config)

