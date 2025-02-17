-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"
local util = lspconfig.util
local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")
local mason_bin_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/bin/")

local servers = {
  "lua_ls",
  "vuels",
  "html",
  "cssls",
  "ts_ls",
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
  "vimls",
  "biome",
  "lemminx",
  -- "rust_analyzer",
  -- "clangd",
  -- "emmet_ls",
  -- "emmet_language_server",
}

local configs = {
  ts_ls = {
    settings = {
      cmd = { vim.fn.expand(mason_bin_path) .. "typescript-language-server", "--stdio" },
    },
    handlers = {
      ["textDocument/definition"] = function(_, result)
        local filtered_result = vim.tbl_filter(function(location)
          local uri = location.uri or location.targetUri
          return not string.match(uri, "%.yarn/") and not string.match(uri, "@types/")
        end, result)

        if vim.tbl_isempty(filtered_result) then
          return
        end

        vim.lsp.util.jump_to_location(filtered_result[1])
      end,
    },
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
          library = vim.api.nvim_get_runtime_file("", true),
        },
        completion = {
          callSnippet = "Replace",
        },
      },
    },
  },
  -- tailwindcss = {
  --   filetypes = { "javascript", "typescrit", "javascriptreact", "typescriptreact" },
  -- },
  bashls = {
    filetypes = { "sh", "zsh", "bash" },
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
      -- ["$/progress"] = vim.schedule_wrap(on_language_status),
      -- ["language/status"] = vim.schedule_wrap(on_language_status),

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
  },
  cssls = {
    init_options = {
      provideFormatter = false,
    },
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
  vimls = {
    init_options = {
      diagnostic = {
        enable = false,
      },
    },
  },
}

local nvlsp = require "nvchad.configs.lspconfig"

for _, lsp in ipairs(servers) do
  local config = vim.deepcopy(configs[lsp] or {})
  -- config.on_attach = nvlsp.on_attach
  config.on_init = nvlsp.on_init
  config.capabilities = nvlsp.capabilities
  config.root_dir = util.root_pattern ".git"

  lspconfig[lsp].setup(config)
end
