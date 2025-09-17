-- Server configuration utilities
local lspconfig = require "lspconfig"
local navic = require "nvim-navic"

local function setup_server(server_name, server_config, use_legacy)
  local config = server_config or {}
  config.capabilities = vim.lsp.protocol.make_client_capabilities()

  local original_on_attach = config.on_attach
  config.on_attach = function(client, bufnr)
    if original_on_attach then
      original_on_attach(client, bufnr)
    end

    -- Only attach navic if the server supports document symbols
    if client.server_capabilities.documentSymbolProvider then
      navic.attach(client, bufnr)
      vim.o.winbar = "   %{%v:lua.require'nvim-navic'.get_location()%}"
    end

    client.server_capabilities.semanticTokensProvider = nil
    if client.server_capabilities.inlayHintProvider and not vim.lsp.inlay_hint.is_enabled() then
      vim.lsp.inlay_hint.enable(true)
    end
  end

  -- Use legacy setup for servers that don't support vim.lsp.config
  if use_legacy then
    lspconfig[server_name].setup(config)
  else
    vim.lsp.config(server_name, config)
    vim.lsp.enable(server_name)
  end
end

local function setup_diagnostic()
  vim.diagnostic.config {
    virtual_text = {
      spacing = 2,
      prefix = function(diagnostic)
        if diagnostic.source == "eslint" then
          return "" -- eslint는 별도 아이콘
        end
        return "" -- 기본 아이콘
      end,
      format = function(diagnostic)
        if diagnostic.source == "eslint" then
          local code = diagnostic.code and string.format(" [%s]", diagnostic.code) or ""
          return diagnostic.message .. code
        end
        return string.format("%s", diagnostic.message or "")
      end,
    },
  }
end

return {
  setup_server = setup_server,
  setup_diagnostic = setup_diagnostic,
}
