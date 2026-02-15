local default = require "plugins.lspconfig.servers.default"
local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")

local config = {
  cmd = {
    "java",
    "-jar",
    vim.fn.expand(mason_path .. "packages/groovy-language-server/build/libs/groovy-language-server-all.jar"),
  },
}

default.setup_server("groovyls", config)
