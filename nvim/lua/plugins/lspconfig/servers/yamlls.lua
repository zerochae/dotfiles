local default = require "plugins.lspconfig.servers.default"

local config = {
  settings = {
    yaml = {
      schemas = {
        ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
        ["https://yarnpkg.com/configuration/yarnrc.json"] = ".yarnrc.yml",
      },
    },
  },
}

default.setup_server("yamlls", config)
