local NullLsProperties = {}
local Utils = require "custom.configs.null-ls.utils"

local args = {
  misspell = { ignore_path = "-i" },
  prettier = { ignore_path = "--ignore-path" },
  stylua = { config_path = "--config-path" },
}

local config_files = {
  selene = { config_file = "selene.toml", default_path = "$DEV_CONFIG/selene/" },
  prettier = { config_file = ".prettierrc", ignore_file = ".prettierignore", default_path = "$DEV_CONFIG/prettier/" },
  eslint = { config_file = ".eslintrc.json", default_path = "$DEV_CONFIG/eslint/" },
  misspell = { ignore_file = ".misspellignore", default_path = "$DEV_CONFIG/misspell/" },
  stylua = { config_file = ".stylua.toml", default_path = "$DEV_CONFIG/stylua/" },
}

NullLsProperties.file_type = {
  prettier = {
    "html",
    "css",
    "typescript",
    "javascript",
    "javascriptreact",
    "typescriptreact",
    "vue",
    "json",
    "jsonc",
  },
  jq = {
    "json",
    "jsonc",
  },
  refactoring = {
    "lua",
    "go",
    "javascript",
    "typescript",
    "javascriptreact",
    "typescriptreact",
  },
  markdownlint = {
    "markdown",
    "vimwiki",
  },
}

NullLsProperties.format = {
  eslint = "#{m}",
}

NullLsProperties.extra_args = {
  misspell = { args.misspell.ignore_path, Utils.read_ignore_file(config_files.misspell) },
  prettier = { args.prettier.ignore_path, vim.fn.expand(config_files.prettier.ignore_file) },
  stylua = {
    args.stylua.config_path,
    vim.fn.expand(config_files.stylua.default_path .. config_files.stylua.config_file),
  },
}

NullLsProperties.condition = {
  prettier = function(utils)
    return not utils.root_has_file ".pnp.cjs"
  end,
  eslint = function(utils)
    return not utils.root_has_file ".pnp.cjs"
  end,
  prettier_yarn_pnp = function(utils)
    return utils.root_has_file ".pnp.cjs"
  end,
  eslint_yarn_pnp = function(utils)
    return utils.root_has_file ".pnp.cjs"
  end,
  jq = function(utils)
    return not utils.root_has_file ".pnp.cjs"
  end,
}

NullLsProperties.cwd = {
  selene = function()
    return Utils.get_cwd(config_files.selene)
  end,
  prettier = function()
    return Utils.get_cwd(config_files.prettier)
  end,
  stylua = function()
    return Utils.get_cwd(config_files.stylua)
  end,
}

NullLsProperties.filter = {
  eslint = function(diagnostic)
    local ignored_codes = {
      "prettier/prettier",
      "@typescript-eslint/no-unused-vars",
      "react/jsx-no-undef",
    }

    local ignored_messages = {
      "Parsing error",
    }

    for _, code in ipairs(ignored_codes) do
      if diagnostic.code == code then
        return false
      end
    end

    for _, message in ipairs(ignored_messages) do
      if string.find(diagnostic.message, message, 1, true) then
        return false
      end
    end

    return true
  end,
}

NullLsProperties.dynamic_command = {
  prettier = require("null-ls.helpers.command_resolver").from_node_modules(),
  eslint = require("null-ls.helpers.command_resolver").from_node_modules(),
  prettier_yarn_pnp = require("null-ls.helpers.command_resolver").from_yarn_pnp(),
  eslint_yarn_pnp = require("null-ls.helpers.command_resolver").from_yarn_pnp(),
}

return NullLsProperties
