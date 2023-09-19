local M = {}

local Helper = require "custom.overrides.plugins.helper"
local devicons = require "custom.overrides.plugins.devicons"

M.colorizer = {
  user_default_options = {
    tailwind = true,
    always_update = true,
  },
}

M.nvterm = {
  terminals = {
    type_opts = {
      float = {
        relative = "editor",
        border = "rounded",
        width = 0.8,
        height = 0.8,
        row = 0.1,
        col = 0.1,
      },
    },
  },
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
    indent_markers = {
      enable = true,
      inline_arrows = true,
      icons = {
        corner = "└",
        edge = "│",
        item = "│",
        bottom = "─",
        none = " ",
      },
    },
    icons = {
      web_devicons = {
        folder = {
          enable = false,
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

M.devicons = devicons

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
