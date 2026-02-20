local default = require "plugins.lspconfig.servers.default"
local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")

local config = {
  filetypes = { "java" },
  root_markers = { "pom.xml", "build.gradle", "build.gradle.kts", "settings.gradle", "settings.gradle.kts", ".project" },
  cmd = {
    vim.fn.expand(mason_path .. "packages/jdtls/jdtls"),
    "--jvm-arg=-javaagent:" .. vim.fn.expand(mason_path .. "packages/jdtls/lombok.jar"),
  },
  handlers = {
    ["$/progress"] = function() end,
    ["language/status"] = function() end,
  },
  settings = {
    java = {
      project = {
        Lombok = {
          enabled = true,
        },
      },
    },
  },
  on_attach = function(client)
    client.server_capabilities.semanticTokensProvider = nil
  end,
}

default.setup_server("jdtls", config)

vim.api.nvim_create_user_command("CleanJdtls", function()
  local cache = vim.fn.expand("~/Library/Caches/jdtls")
  vim.fn.delete(cache, "rf")
  vim.notify("jdtls cache cleaned: " .. cache, vim.log.levels.INFO)
end, {})
