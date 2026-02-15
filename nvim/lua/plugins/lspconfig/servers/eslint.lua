local default = require "plugins.lspconfig.servers.default"

local function find_up(names, start)
  return vim.fs.find(names, { upward = true, path = start })[1]
end

local config = {
  cmd_env = {
    FORCE_COLOR = "0",
  },
  settings = {
    workingDirectory = { mode = "auto" },
    nodePath = (function()
      local pnp = find_up({ ".pnp.cjs" }, vim.fn.getcwd())
      return pnp and ".yarn/sdks" or ""
    end)(),
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
default.setup_server("eslint", config)
