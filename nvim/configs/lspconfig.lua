local capabilities = require("plugins.configs.lspconfig").capabilities
local lspconfig = require "lspconfig"
local util = lspconfig.util
local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")

local servers = {
  "lua_ls",
  "vuels",
  -- "rust_analyzer",
  "html",
  "cssls",
  "tsserver",
  -- "clangd",
  "tailwindcss",
  "sqlls",
  "jsonls",
  "taplo",
  "yamlls",
  "bashls",
  "gopls",
  "jdtls",
  "docker_compose_language_service",
  "dockerls",
  "groovyls",
  "kotlin_language_server",
  "pyright",
  "sourcekit",
  "rubocop",
  "perlnavigator",
  "terraformls",
}

local lsp_formatting = function(bufnr)
  vim.lsp.buf.format {
    filter = function(client)
      -- apply whatever logic you want (in this example, we'll only use null-ls)
      return client.name == "null-ls"
    end,
    bufnr = bufnr,
  }
end

local function on_language_status(_, result)
  if result.message == nil then
    return
  end
  local command = vim.api.nvim_command
  command "echohl ModeMsg"
  command(string.format('echo "%s"', result.message))
  command "echohl None"
end

local utils = require "core.utils"

-- export on_attach & capabilities for custom lspconfigs

local on_attach = function(client, bufnr)
  utils.load_mappings("lspconfig", { buffer = bufnr })

  client.server_capabilities.documentFormattingProvider = false
  client.server_capabilities.documentRangeFormattingProvider = false

  if client.server_capabilities.signatureHelpProvider then
    require("nvchad.signature").setup(client)
  end

  if not utils.load_config().ui.lsp_semantic_tokens and client.supports_method "textDocument/semanticTokens" then
    client.server_capabilities.semanticTokensProvider = nil
  end

  if client.supports_method "textDocument/formatting" then
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
    vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        lsp_formatting(bufnr)
      end,
    })
  end
end

local configs = {
  tsserver = {
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  },
  clangd = {
    cmd = {
      -- mason_path .. "packages/clangd/clangd_17.0.3/bin/clangd",
      "clangd",
      "--offset-encoding=utf-16",
    },
  },
  sourcekit = {
    filetypes = { "swift", "c", "cpp", "objc", "objcpp" },
  },
  lua_ls = {
    settings = {
      Lua = {
        workspace = {
          checkThirdParty = false,
        },
        completion = {
          callSnippet = "Replace",
        },
      },
    },
  },
  tailwindcss = {
    filetypes = { "javascript", "typescrit", "javascriptreact", "typescriptreact" },
  },
  bashls = {
    default_config = {
      filetypes = { "sh", "zsh", "bash" },
    },
  },
  vuels = {
    init_options = {
      config = {
        css = {},
        emmet = {},
        html = {
          suggest = {},
        },
        javascript = {
          format = {},
        },
        stylusSupremacy = {},
        typescript = {
          format = {},
        },
        vetur = {
          ignoreProjectWarning = true,
          completion = {
            autoImport = false,
            tagCasing = "kebab",
            useScaffoldSnippets = false,
          },
          useWorkspaceDependencies = false,
          validation = {
            script = true,
            style = true,
            template = true,
          },
        },
      },
    },
  },
  -- rust_analyzer = {
  --   settings = {
  --     ["rust-analyzer"] = {
  --       cargo = {
  --         features = "all",
  --       },
  --       checkOnSave = true,
  --       check = {
  --         command = "clippy",
  --         features = "all",
  --       },
  --       procMacro = {
  --         enable = true,
  --       },
  --       diagnostics = {
  --         enable = true,
  --       },
  --     },
  --   },
  -- },
  yamlls = {
    settings = {
      yaml = {
        schemas = {
          ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
        },
      },
    },
  },
  gopls = {
    settings = {
      gopls = {
        gofumpt = true,
      },
    },
  },

  jdtls = {
    filetypes = { "java" },
    cmd = {
      vim.fn.expand(mason_path .. "packages/jdtls/jdtls"),
      "--jvm-arg=-javaagent:" .. vim.fn.expand(mason_path .. "packages/jdtls/lombok.jar"),
    },
    handlers = {
      ["$/progress"] = vim.schedule_wrap(on_language_status),
    },
  },
  cssls = {
    settings = {
      css = {
        validate = true,
        lint = {
          unknownAtRules = "ignore",
        },
      },
      scss = {
        validate = true,
        lint = {
          unknownAtRules = "ignore",
        },
      },
      less = {
        validate = true,
        lint = {
          unknownAtRules = "ignore",
        },
      },
    },
  },
  groovyls = {
    cmd = {
      "java",
      "-jar",
      vim.fn.expand(mason_path .. "packages/groovy-language-server/build/libs/groovy-language-server-all.jar"),
    },
  },
  kotlin_language_server = {
    -- cmd = {
    --   vim.fn.expand(mason_path .. "packages/kotlin-language-server/server/bin/kotlin-language-server"),
    -- },
  },
}

for _, lsp in ipairs(servers) do
  local config = vim.deepcopy(configs[lsp] or {})
  config.on_attach = on_attach
  config.capabilities = capabilities
  config.root_dir = util.root_pattern ".git"

  lspconfig[lsp].setup(config)
end
