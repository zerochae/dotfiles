local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
local lspconfig = require "lspconfig"
local util = lspconfig.util
local servers = { "html", "cssls", "tsserver", "clangd", "tailwindcss", "sqlls", "jsonls", "taplo", "yamlls", "bashls" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    root_dir = util.root_pattern ".git",
  }
end

lspconfig.rust_analyzer.setup {
  settings = {
    ["rust-analyzer"] = {
      diagnostics = {
        enable = true,
      },
    },
  },
  on_attach = on_attach,
}
