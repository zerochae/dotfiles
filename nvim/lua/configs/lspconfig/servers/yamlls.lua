local default = require "configs.lspconfig.servers.default"

local config = {
  settings = {
    yaml = {
      schemas = {
        ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
      },
    },
  },
}

default.setup_server("yamlls", config)

