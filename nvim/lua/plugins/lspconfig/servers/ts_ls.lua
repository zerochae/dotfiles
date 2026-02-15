local default = require "plugins.lspconfig.servers.default"
local mason_bin_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/bin/")

local TS_IGNORE = {
  [1005] = true, -- ',' expected
  [1109] = true, -- expression expected
  [1136] = true, -- property assignment expected
  [1002] = true, -- unterminated string literal
  [1003] = true, -- identifier expected
  [1128] = true, -- declaration or statement expected
  [1127] = true, -- invalid character
  -- [6133] = true, -- unused variable
  -- [6138] = true, -- property is defined but never used
  -- [6196] = true, -- declared but never read
  -- [7027] = true, -- unreachable code detected
  -- [7044] = true, -- parameter implicitly has an 'any' type
  -- [6385] = true, -- switch statement does not handle all cases
  -- [2304] = true, -- cannot find name
  -- [2339] = true, -- property does not exist on type
  -- [2345] = true, -- argument of type is not assignable to parameter
  -- [2322] = true, -- type is not assignable to type
  -- [2571] = true, -- object is of type 'unknown'
  -- [18048] = true, -- is declared but never used
}

local config = {
  handlers = {
    ["textDocument/publishDiagnostics"] = function(err, params, ctx, config)
      if params.diagnostics then
        params.diagnostics = vim.tbl_filter(function(diagnostic)
          return not TS_IGNORE[diagnostic.code]
        end, params.diagnostics)
      end
      vim.lsp.handlers["textDocument/publishDiagnostics"](err, params, ctx, config)
    end,
  },
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = vim.fn.expand "$CONFIG/yarn/global/node_modules/@vue/typescript-plugin",
        languages = { "javascript", "typescript", "vue" },
      },
    },
  },
  filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
  completions = {
    completeFunctionCalls = false,
  },
  settings = {
    cmd = { vim.fn.expand(mason_bin_path) .. "typescript-language-server", "--stdio" },
    javascript = {
      inlayHints = {
        includeInlayEnumMemberValueHints = true,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayParameterNameHints = "all",
        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayVariableTypeHints = true,
      },
    },
    typescript = {
      inlayHints = {
        includeInlayEnumMemberValueHints = true,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayParameterNameHints = "all",
        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayVariableTypeHints = true,
      },
    },
  },
}

default.setup_server("ts_ls", config)
