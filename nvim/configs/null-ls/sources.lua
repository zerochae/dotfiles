local null_ls = require "null-ls"
local Configs = require "custom.configs.null-ls.configs"
local builtins = null_ls.builtins
local formatting = builtins.formatting
local diagnostics = builtins.diagnostics
local code_actions = builtins.code_actions
local hover = builtins.hover

local NullLsSources = {
  -- commoon
  diagnostics.misspell.with(Configs.misspell_config),

  -- lua
  formatting.stylua.with(Configs.stylua_config),
  diagnostics.selene.with(Configs.selene_config),

  -- typescript
  formatting.prettier.with(Configs.prettier_config),
  diagnostics.eslint.with(Configs.eslint_config),
  formatting.prettier.with(Configs.prettier_config_yarn_pnp),
  diagnostics.eslint.with(Configs.eslint_config_yarn_pnp),
  code_actions.eslint,

  -- rust
  formatting.rustfmt,
  diagnostics.ruff,

  -- sh
  formatting.beautysh,
  hover.printenv,
  diagnostics.shellcheck,
  code_actions.shellcheck,

  -- markdown
  diagnostics.markdownlint.with(Configs.markdownlint_config),
  formatting.markdownlint.with(Configs.markdownlint_config),

  -- go
  formatting.gofumpt,
  formatting.goimports,
  diagnostics.revive,
  code_actions.gomodifytags,
  code_actions.impl,

  -- yaml
  formatting.yamlfmt,

  --sql
  formatting.sql_formatter,

  -- toml
  formatting.taplo,
}

return NullLsSources
