local default = require "plugins.lspconfig.servers.default"

local config = {
  settings = {},
  init_options = {
    config = {
      css = {},
      emmet = {},
      html = {
        suggest = {},
      },
      javascript = {
        format = {},
      },
      stylusSupremacy = {},
      typescript = {
        format = {},
      },
      vetur = {
        ignoreProjectWarning = true,
        completion = {
          autoImport = false,
          tagCasing = "kebab",
          useScaffoldSnippets = false,
        },
        useWorkspaceDependencies = false,
        validation = {
          script = true,
          style = true,
          template = true,
        },
      },
    },
  },
}

default.setup_server("vuels", config)
