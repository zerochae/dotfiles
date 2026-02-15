local default = require "plugins.lspconfig.servers.default"

local config = {}

default.setup_server("kotlin_language_server", config)
