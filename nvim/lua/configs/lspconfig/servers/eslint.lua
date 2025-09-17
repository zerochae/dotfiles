local default = require "configs.lspconfig.servers.default"

local config = {
  cmd_env = {
    FORCE_COLOR = "0",
  },
  settings = {
    workingDirectory = { mode = "auto" },
  },
  on_attach = function(client, bufnr)
    if client.server_capabilities.codeActionProvider then
      local group = vim.api.nvim_create_augroup("EslintFixOnSave_" .. bufnr, { clear = true })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = group,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.code_action {
            context = { only = { "source.fixAll.eslint" } },
            apply = true,
          }
        end,
      })
    end
  end,
}

-- Use legacy setup for eslint
default.setup_server("eslint", config, true)
