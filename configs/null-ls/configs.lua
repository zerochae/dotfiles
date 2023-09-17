---@class NullLsConfigs
local NullLsConfigs = {}

local Properties = require "custom.configs.null-ls.properties"
local condition = Properties.condition
local filter = Properties.filter
local file_type = Properties.file_type
local format = Properties.format
local extra_args = Properties.extra_args
local cwd = Properties.cwd
local dynamic_command = Properties.dynamic_command

NullLsConfigs.prettier_config = {
  filetypes = file_type.prettier,
  condition = condition.prettier,
  cwd = cwd.prettier,
  extra_args = extra_args.prettier,
}

NullLsConfigs.eslint_config = {
  diagnostics_format = format.eslint,
  condition = condition.eslint,
  filter = filter.eslint,
}

NullLsConfigs.prettier_config_yarn_pnp = {
  filetypes = file_type.prettier,
  condition = condition.prettier_yarn_pnp,
  dynamic_command = dynamic_command.prettier,
  cwd = cwd.prettier,
  extra_args = extra_args.prettier,
}

NullLsConfigs.eslint_config_yarn_pnp = {
  diagnostics_format = format.eslint,
  condition = condition.eslint_yarn_pnp,
  dynamic_command = dynamic_command.eslint,
  filter = filter.eslint,
}

NullLsConfigs.selene_config = {
  cwd = cwd.selene,
}

NullLsConfigs.stylua_config = {
  extra_args = extra_args.stylua,
}

NullLsConfigs.jq_config = {
  filetypes = file_type.jq,
  condition = condition.jq,
}

NullLsConfigs.refactoring_config = {
  filetypes = file_type.refactoring,
}

NullLsConfigs.misspell_config = {
  extra_args = extra_args.misspell,
}

NullLsConfigs.markdownlint_config = {
  file_type = file_type.markdownlint,
}

return NullLsConfigs
