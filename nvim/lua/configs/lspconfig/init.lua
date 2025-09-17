require("nvchad.configs.lspconfig").defaults()

local default = require "configs.lspconfig.servers.default"

local configured_servers = {
  "eslint",
  "ts_ls",
  "lua_ls",
  "gopls",
  "bashls",
  "clangd",
  "cssls",
  "groovyls",
  "jdtls",
  "kotlin_language_server",
  "sourcekit",
  "tailwindcss",
  "vimls",
  "vuels",
  "yamlls",
}

local default_servers = {
  "sqlls",
  "html",
  "jsonls",
  "taplo",
  "docker_compose_language_service",
  "dockerls",
  "pyright",
  "rubocop",
  "perlnavigator",
  "terraformls",
  "lemminx",
}

-- default.setup_diagnostic()

for _, server in ipairs(configured_servers) do
  local ok, _ = pcall(require, "configs.lspconfig.servers." .. server)
  if not ok then
    vim.notify("Failed to load server config: " .. server, vim.log.levels.WARN)
  end
end

for _, server in ipairs(default_servers) do
  default.setup_server(server)
end
