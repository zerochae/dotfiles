local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
local lspconfig = require "lspconfig"
local util = lspconfig.util

local servers = {
  "vuels",
  "rust_analyzer",
  "html",
  "cssls",
  "tsserver",
  "clangd",
  "tailwindcss",
  "sqlls",
  "jsonls",
  "taplo",
  "yamlls",
  "bashls",
}

local configs = {
  vuels = {
    init_options = {
      config = {
        vetur = {
          ignoreProjectWarning = true,
        },
      },
    },
  },
  rust_analyzer = {
    settings = {
      ["rust-analyzer"] = {
        diagnostics = {
          enable = true,
        },
      },
    },
  },
}

for _, lsp in ipairs(servers) do
  local config = vim.deepcopy(configs[lsp] or {})
  config.on_attach = on_attach
  config.capabilities = capabilities
  config.root_dir = util.root_pattern ".git"

  lspconfig[lsp].setup(config)
end
