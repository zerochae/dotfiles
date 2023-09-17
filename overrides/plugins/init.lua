local M = {}

local Helper = require "custom.overrides.plugins.helper"

M.comment = {
  -- pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "sql",
  },
  indent = {
    enable = true,
  },
  autotag = {
    enable = true,
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  rainbow = {
    enable = true,
    query = "rainbow-parens",
  },
  context_commentstring = {
    enable = true,
    config = {
      javascript = {
        __default = "// %s",
        jsx_element = "{/* %s */}",
        jsx_fragment = "{/* %s */}",
        jsx_attribute = "// %s",
        comment = "// %s",
      },
      typescript = { __default = "// %s", __multiline = "/* %s */" },
    },
  },
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = "o",
      toggle_hl_groups = "i",
      toggle_injected_languages = "t",
      toggle_anonymous_nodes = "a",
      toggle_language_display = "I",
      focus_language = "f",
      unfocus_language = "F",
      update = "R",
      goto_node = "<cr>",
      show_help = "?",
    },
  },
}

M.mason = {
  ensure_installed = {
    "lua-language-server",
    "stylua",
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",
    "clangd",
    "clang-format",
  },
}

M.nvimtree = {
  git = {
    enable = true,
  },
  filters = {
    dotfiles = false,
    git_ignored = false,
  },
  view = Helper.nvim_tree_view(),
  renderer = {
    highlight_git = true,
    icons = {
      web_devicons = {
        folder = {
          enable = true,
          color = true,
        },
      },
      show = {
        git = true,
      },
      padding = "  ",
      glyphs = {
        default = "󰈚",
        symlink = "",
        folder = {
          default = "",
          empty = "",
          empty_open = "",
          open = "",
          symlink = "",
          symlink_open = "",
          arrow_open = "",
          arrow_closed = "",
        },
        git = {
          unstaged = "",
          staged = "",
          unmerged = "",
          renamed = "✎",
          untracked = "",
          deleted = "",
          ignored = "",
        },
      },
    },
  },
}

M.telescope = {
  defaults = {
    file_ignore_patterns = {
      "node_modules",
      "%.png",
      "%.svg",
      "%.mp4",
      "%.jpg",
      "%.jpeg",
      "custom/assets",
      "assets/ascii",
    },
  },
  extensions = {
    live_grep_args = {
      auto_quoting = true,
    },
  },
  extensions_list = { "themes", "terms", "live_grep_args", "noice" },
}

M.devicons = {
  ts = {
    icon = "󰛦",
    name = "Typescript",
    color = "#0088d1",
  },
  js = {
    icon = "",
    name = "Javascript",
    color = "#ffca27",
  },
  cjs = {
    icon = "",
    name = "Javascript",
    color = "#ffca27",
  },
  mjs = {
    icon = "",
    name = "Javascript",
    color = "#ffca27",
  },
  sh = {
    icon = "",
    name = "Sh",
    color = "#ff7043",
  },
  zsh = {
    icon = "",
    name = "Zsh",
    color = "#89e051",
  },
  bash = {
    icon = "",
    name = "Bash",
    color = "#768495",
  },
  fish = {
    icon = "",
    name = "Fish",
    color = "#40a0d5",
  },
  rs = {
    icon = "",
    name = "Rust",
    color = "#FA6F42",
  },
  e2e = {
    icon = "󱥾",
    name = "EndToEndTestFolder",
    color = "#27a69a",
  },
  [".gitignore"] = {
    icon = "",
    name = "Gitignore",
    color = "#f1502f",
  },
  git = {
    icon = "",
    name = "gitFolder",
    color = "#546e7a",
  },
  [".git"] = {
    icon = "",
    name = "DotgitFolder",
    color = "#546e7a",
  },
  [".github"] = {
    icon = "",
    name = "DotgithubFolder",
    color = "#546e7a",
  },
  yarn = {
    icon = "",
    name = "YarnFolder",
    color = "#2c8ebb",
  },
  [".yarn"] = {
    icon = "",
    name = "YarnFolder",
    color = "#2c8ebb",
  },
  [".yarnrc.yml"] = {
    icon = "",
    name = "DotYarnrc",
    color = "#0088d1",
  },
  [".vscode"] = {
    icon = "",
    name = "DotvscodeFolder",
    color = "#42a5f5",
  },
  [".dockerignore"] = {
    icon = "",
    name = "Dockerignore",
    color = "#2496ed",
  },
  [".husky"] = {
    icon = "󰩃",
    name = "DotHuskyFolder",
    color = "#607d8b",
  },
  [".eslintcache"] = {
    icon = "󰱺",
    name = "Eslintcache",
    color = "#4050b5",
  },
  [".eslintrc.json"] = {
    icon = "󰱺",
    name = "Eslintcache",
    color = "#4050b5",
  },
  [".prettierrc"] = {
    icon = "",
    name = "Prettierrc",
    color = "#56b3b4",
  },
  [".prettierignore"] = {
    icon = "",
    name = "Prettierignore",
    color = "#56b3b4",
  },
  ["node_modules"] = {
    icon = "",
    name = "NodeModules",
    color = "#8bc34b",
  },
  ["package.json"] = {
    icon = "",
    name = "NodeModules",
    color = "#8bc34b",
  },
  [".luarc.json"] = {
    icon = "",
    name = "Luarc",
    color = "#4e4eeb",
  },
  ["lazy-lock.json"] = {
    icon = "󰒲",
    name = "Lazylock",
    color = "#82aaff",
  },
  license = {
    icon = "󰿃",
    name = "License",
    color = "#ff5722",
  },
  db = {
    icon = "",
    name = "Db",
    color = "#61afee",
  },
}

M.gitsigns = {
  current_line_blame = true,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = "right_align", -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  },
  current_line_blame_formatter = " <author> - <summary>  [<author_time:%Y-%m-%d>]",
}

return M
