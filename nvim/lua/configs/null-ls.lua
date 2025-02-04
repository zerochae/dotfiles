local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local Utils = {}
Utils.get_cwd = function(config)
  local config_file = config.config_file
  local default_path = config.default_path
  local buf_get_name = vim.api.nvim_buf_get_name(0)
  local found_path = vim.fs.dirname(vim.fs.find({ config_file }, { upward = true, path = buf_get_name })[1])

  if not found_path and default_path then
    found_path = vim.fn.expand(default_path)
  end

  return found_path or ""
end

Utils.read_ignore_file = function(config)
  local ignore_file = config.ignore_file
  local default_path = config.default_path
  local ignoreStrings = {}
  local file, err = io.open(vim.fn.expand(default_path .. ignore_file), "r")
  if file then
    for line in file:lines() do
      table.insert(ignoreStrings, line)
    end
    file:close()
    return table.concat(ignoreStrings, ",")
  else
    print("파일을 열 수 없습니다.", err)
    return "empty"
  end
end

-- Utils.show_ignore_list = function(ignore_path)
--   local file, err = io.open(vim.fn.expand(ignore_path), "r")
--   if not file then
--     print("파일을 열 수 없습니다. 오류:", err)
--     return
--   end
--
--   print "Ignore List:"
--
--   for line in file:lines() do
--     print(line)
--   end
--
--   file:close()
-- end
--
-- Utils.add_ignore_word = function(ignore_path, word_to_add)
--   if #word_to_add == 0 then
--     print "단어를 입력해주세요."
--     return
--   end
--   local file, err = io.open(vim.fn.expand(ignore_path), "a")
--   if file then
--     file:write(word_to_add, "\n")
--     file:close()
--     print("Add misspell word:", word_to_add)
--   else
--     print("파일을 열 수 없습니다. 오류:", err)
--   end
-- end
--
-- Utils.remove_ignore_word = function(ignore_path, word_to_remove)
--   if #word_to_remove == 0 then
--     print "단어를 입력해주세요."
--     return
--   end
--
--   local lines = {}
--   local file, err = io.open(vim.fn.expand(ignore_path), "r")
--   if not file then
--     print("파일을 열 수 없습니다. 오류:", err)
--     return
--   end
--
--   for line in file:lines() do
--     if line ~= word_to_remove then
--       table.insert(lines, line)
--     end
--   end
--
--   file:close()
--
--   file, err = io.open(vim.fn.expand(ignore_path), "w")
--   if not file then
--     print("파일을 다시 열 수 없습니다. 오류:", err)
--     return
--   end
--
--   for _, line in ipairs(lines) do
--     file:write(line, "\n")
--   end
--
--   file:close()
--
--   print("Remove misspell word:", word_to_remove)
-- end

Utils.diagnostic_code_filter = function(ignored_codes, diagnostic)
  for _, code in ipairs(ignored_codes) do
    if diagnostic.code == code then
      return false
    end
  end
  return true
end

Utils.diagnostic_message_filter = function(ignored_messages, diagnostic)
  for _, message in ipairs(ignored_messages) do
    if string.find(diagnostic.message, message, 1, true) then
      return false
    end
  end
  return true
end

local args = {
  misspell = { ignore_path = "-i" },
  prettier = { ignore_path = "--ignore-path", config_path = "--config" },
  stylua = { config_path = "--config-path" },
  taplo = { config_path = "--config" },
  rustfmt = { config_path = "--config-path" },
  clang_format = { config_path = "-style=file:" },
  stylelint = { config_path = "--config" },
  sql_formatter = { config_path = "--config" },
  swiftlint = { config_path = "--config" },
}

local config_files = {
  selene = { config_file = "selene.toml", default_path = "$HOME/Dev/config/selene/" },
  prettier = {
    config_file = ".prettierrc",
    ignore_file = ".prettierignore",
    default_path = "$HOME/Dev/config/prettier/",
  },
  eslint = { config_file = ".eslintrc.*", default_path = "$HOME/Dev/config/eslint/" },
  misspell = { ignore_file = ".misspellignore", default_path = "$HOME/Dev/config/misspell/" },
  stylua = { config_file = ".stylua.toml", default_path = "$HOME/Dev/config/stylua/" },
  taplo = { config_file = ".taplo.toml", default_path = "$HOME/.config/taplo/" },
  rustfmt = { config_file = ".rustfmt.toml", default_path = "$HOME/Dev/config/rustfmt/" },
  sql_formatter = { config_file = ".sqlformatter.json", default_path = "$HOME/Dev/config/sqlformatter" },
}

-- Properties.env = {
--   prettier = {
--     env = {
--       PRETTIERD_DEFAULT_CONFIG = vim.fn.expand(config_files.prettier.default_path .. config_files.prettier.config_file),
--     },
--   },
-- }

local Properties = {}
Properties.file_type = {
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
    "scss",
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
  },
}

Properties.format = {
  eslint = "󰱺 #{m}",
}

Properties.extra_args = {
  misspell = {
    args.misspell.ignore_path,
    Utils.read_ignore_file(config_files.misspell),
  },
  prettier = {
    args.prettier.ignore_path,
    vim.fn.expand(config_files.prettier.ignore_file),
    args.prettier.config_path,
    vim.fn.expand(config_files.prettier.config_file),
  },
  stylua = {
    args.stylua.config_path,
    vim.fn.expand(config_files.stylua.default_path .. config_files.stylua.config_file),
  },
  taplo = {
    args.taplo.config_path,
    vim.fn.expand(config_files.taplo.default_path .. config_files.taplo.config_file),
  },
  rustfmt = {
    args.rustfmt.config_path,
    vim.fn.expand(config_files.rustfmt.default_path .. config_files.rustfmt.config_file),
  },
  clang_format = {
    args.clang_format.config_path .. vim.fn.expand "$DEV/config/clangformat/.clang-format",
  },
  stylelint = {
    args.stylelint.config_path,
    vim.fn.expand "$DEV/config/stylelint/.stylelintrc.json",
  },
  sql_formatter = {
    args.sql_formatter.config_path,
    vim.fn.expand "$DEV/config/sqlformatter/.sqlformatter.json",
  },
  swiftlint = {
    args.swiftlint.config_path,
    vim.fn.expand "$DEV/config/swiftlint/.swiftlint.yml",
  },
}

Properties.condition = {
  prettier = function(utils)
    return not utils.root_has_file ".pnp.cjs"
  end,
  eslint = function(utils)
    return not utils.root_has_file ".pnp.cjs"
      and (utils.root_has_file ".eslintrc.json" or utils.root_has_file ".eslintrc.js")
  end,
  prettier_yarn_pnp = function(utils)
    return utils.root_has_file ".pnp.cjs"
  end,
  eslint_yarn_pnp = function(utils)
    return utils.root_has_file ".pnp.cjs"
      and (utils.root_has_file ".eslintrc.json" or utils.root_has_file ".eslintrc.js")
  end,
  jq = function(utils)
    return not utils.root_has_file ".pnp.cjs"
  end,
}

Properties.cwd = {
  selene = function()
    return Utils.get_cwd(config_files.selene)
  end,
  prettier = function()
    return Utils.get_cwd(config_files.prettier)
  end,
  cwd = function()
    return Utils.get_cwd(config_files.eslint)
  end,
  stylua = function()
    return Utils.get_cwd(config_files.stylua)
  end,
}

Properties.filter = {
  eslint = function(diagnostic)
    local ignored_codes = {
      "@typescript-eslint/no-unused-vars",
      "react/jsx-no-undef",
      "vue/no-child-content",
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

Properties.dynamic_command = {
  prettier = require("null-ls.helpers.command_resolver").from_node_modules(),
  eslint = require("null-ls.helpers.command_resolver").from_node_modules(),
  prettier_yarn_pnp = require("null-ls.helpers.command_resolver").from_yarn_pnp(),
  eslint_yarn_pnp = require("null-ls.helpers.command_resolver").from_yarn_pnp(),
}

local function eslint_config_path()
  local root_has_config = vim.fn.filereadable(vim.fn.getcwd() .. "/eslint.config.mjs") == 1

  if root_has_config then
    return {}
  else
    return { "--config", vim.fn.expand "$HOME/.config/yarn/global/eslint.config.mjs" }
  end
end

local condition = Properties.condition
local filter = Properties.filter
local file_type = Properties.file_type
local format = Properties.format
local extra_args = Properties.extra_args
local cwd = Properties.cwd
local dynamic_command = Properties.dynamic_command

local Configs = {}
Configs.prettier_config = {
  filetypes = file_type.prettier,
  condition = condition.prettier,
  cwd = cwd.prettier,
  extra_args = extra_args.prettier,
  dynamic_command = dynamic_command.prettier,
}

Configs.eslint_config = {
  diagnostics_format = format.eslint,
  condition = condition.eslint,
  filter = filter.eslint,
  cwd = cwd.eslint,
  dynamic_command = dynamic_command.eslint,
  extra_args = eslint_config_path(),
}

Configs.prettier_config_yarn_pnp = {
  filetypes = file_type.prettier,
  condition = condition.prettier_yarn_pnp,
  cwd = cwd.prettier,
  extra_args = extra_args.prettier,
  dynamic_command = dynamic_command.prettier_yarn_pnp,
}

Configs.eslint_config_yarn_pnp = {
  diagnostics_format = format.eslint,
  condition = condition.eslint_yarn_pnp,
  dynamic_command = dynamic_command.eslint_yarn_pnp,
  cwd = cwd.eslint,
  filter = filter.eslint,
  extra_args = eslint_config_path(),
}

Configs.selene_config = {
  cwd = cwd.selene,
}

Configs.stylua_config = {
  extra_args = extra_args.stylua,
}

Configs.jq_config = {
  filetypes = file_type.jq,
  condition = condition.jq,
}

Configs.refactoring_config = {
  filetypes = file_type.refactoring,
}

Configs.misspell_config = {
  extra_args = extra_args.misspell,
}

-- Configs.markdownlint_config = {
--   file_type = file_type.markdownlint,
-- }

Configs.taplo_config = {
  -- extra_args = extra_args.taplo,
}

Configs.rustfmt_config = {
  extra_args = extra_args.rustfmt,
}

Configs.clang_format_config = {
  filetypes = { "java", "objc", "objcpp" },
  extra_args = extra_args.clang_format,
}

Configs.stylelint_config = {
  extra_args = extra_args.stylelint,
}

Configs.sql_formatter_config = {
  extra_args = extra_args.sql_formatter,
}

Configs.swiftlint_config = {
  extra_args = extra_args.swiftlint,
}

local builtins = null_ls.builtins
local formatting = builtins.formatting
local diagnostics = builtins.diagnostics
local code_actions = builtins.code_actions
local hover = builtins.hover

local lsp_formatting = function(bufnr)
  vim.lsp.buf.format {
    filter = function(client)
      return client.name == "null-ls"
    end,
    bufnr = bufnr,
  }
end

null_ls.setup {
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_buf_create_user_command(bufnr, "LspFormat", function()
        lsp_formatting(bufnr)
      end, { desc = "Format using LSP" })
    end
  end,
  sources = {
    -- common
    -- diagnostics.misspell.with(Configs.misspell_config),

    -- lua
    formatting.stylua.with(Configs.stylua_config),
    diagnostics.selene.with(Configs.selene_config),

    -- typescript
    formatting.prettier.with(Configs.prettier_config),
    -- diagnostics.eslint.with(Configs.eslint_config),
    formatting.prettier.with(Configs.prettier_config_yarn_pnp),
    -- diagnostics.eslint.with(Configs.eslint_config_yarn_pnp),
    -- formatting.biome.with {
    --   extra_args = { "--config-path", vim.fn.expand "$HOME/Dev/config/biome/biome.json" },
    -- },

    -- css
    diagnostics.stylelint.with(Configs.stylelint_config),

    -- rust
    -- formatting.rustfmt.with(Configs.rustfmt_config),

    -- sh
    formatting.shfmt,
    hover.printenv,
    -- diagnostics.shellcheck,
    -- code_actions.shellcheck,

    -- markdown
    -- diagnostics.markdownlint,
    formatting.markdownlint,

    -- go
    formatting.gofmt,
    -- formatting.gofumpt,
    formatting.goimports,
    formatting.golines,
    -- diagnostics.golangci_lint,
    code_actions.gomodifytags,

    -- yaml
    formatting.yamlfmt.with {
      extra_args = { "-conf", vim.fn.expand "$HOME/Dev/config/yamlfmt/.yamlfmt.yml" },
    },

    --sql
    formatting.sql_formatter.with(Configs.sql_formatter_config),

    -- toml
    -- formatting.taplo.with(Configs.taplo_config),

    -- java
    formatting.clang_format.with(Configs.clang_format_config),
    -- formatting.google_java_format,

    -- docker
    diagnostics.hadolint,

    --kotlin
    diagnostics.ktlint,
    formatting.ktlint,

    -- groovy
    diagnostics.npm_groovy_lint.with {
      filetypes = { "groovy" },
    },
    formatting.npm_groovy_lint.with {
      filetypes = { "groovy" },
    },

    -- python
    -- diagnostics.ruff,
    formatting.black,

    --swift
    -- diagnostics.swiftlint,
    diagnostics.swiftlint.with(Configs.swiftlint_config),
    formatting.swiftlint.with(Configs.swiftlint_config),
    -- formatting.swiftlint,

    -- ruby
    diagnostics.rubocop,
    formatting.rubocop,

    -- teraaform
    diagnostics.tfsec,
    formatting.terraform_fmt,

    -- vimscript
    diagnostics.vint,

    -- xml
    -- formatting.xmlformat,
  },
  debug = true,
}
