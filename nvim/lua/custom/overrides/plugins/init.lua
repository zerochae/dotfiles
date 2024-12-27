local M = {}

local Helper = require "custom.overrides.plugins.helper"
local devicons = require "custom.overrides.plugins.devicons"

M.nvim_cmp = {
  experimental = {
    ghost_text = true,
  },
  sources = {
    { name = "copilot" },
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "nvim_lua" },
    { name = "path" },
  },
}

M.blankline = {
  buftype_exclude = { "terminal", "dbui" },
  char = " ",
  -- char = "│",
  context_char = "┃",
  show_trailing_blankline_indent = true,
  show_first_indent_level = true,
  show_current_context = true,
  show_current_context_start = true,
}

M.colorizer = {
  filetypes = {
    "*",
    "!lazy",
    cmp_docs = {
      always_update = true,
    },
  },
  user_default_options = {
    RGB = true,
    RRGGBBAA = true,
    AARRGGBB = true,
    css = true,
    tailwind = true,
    always_update = true,
    names = false,
    mode = "background",
    virtualtext = "■",
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
  highlight = {
    enable = true,
    use_languagetree = true,
    additional_vim_regex_highlighting = false,
  },
  rainbow = {
    enable = true,
    query = "rainbow-parens",
  },
  -- context_commentstring = {
  --   enable = true,
  -- },
  playground = {
    enable = true,
    disable = {},
    updatetime = 25,
    persist_queries = false,
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

vim.treesitter.language.register("bash", "dotenv")

M.mason = {
  ui = {
    border = "single",
  },
  ensure_installed = {
    "lua-language-server",
    "stylua",
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "prettier",
  },
}

M.nvimtree = {
  git = {
    enable = true,
  },
  filters = {
    dotfiles = false,
    git_ignored = false,
    custom = {
      "^.null-ls_",
    },
  },
  view = {
    side = "left",
    width = function()
      local ratio = 0.25
      local cols = vim.opt.columns:get()
      local width = math.floor(cols * ratio)

      local max_width = 35

      if cols < 153 then
        max_width = 30
      end

      return math.max(width, max_width)
    end,
  },
  sort = {
    sorter = "case_sensitive",
  },
  renderer = {
    highlight_opened_files = "none",
    group_empty = true,
    special_files = {},
    -- root_folder_label = false,
    root_folder_label = function(path)
      local label = " " .. vim.fn.fnamemodify(path, ":t")
      local padding = vim.fn.winwidth(0) - #label
      if padding > 0 then
        return label .. string.rep(" ", padding)
      else
        return label
      end
    end,
    highlight_git = true,
    indent_markers = {
      enable = true,
      inline_arrows = false,
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
        file = {
          enable = true,
          color = true,
        },
        folder = {
          enable = true,
          color = true,
        },
      },
      show = {
        git = false,
      },
      padding = " ",
      glyphs = {
        default = "󰈚",
        symlink = "",
        folder = {
          default = "",
          empty = "",
          empty_open = "",
          open = "",
          symlink = "",
          symlink_open = "",
          arrow_open = " ",
          arrow_closed = " ",
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
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
}

Helper.telescope_dynamic_layout_strategies()

M.telescope = {
  defaults = {
    results_title = " Finder",
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    layout_strategy = "dynamic",
    sorting_strategy = "descending",
    height = 0.8,
    width = 0.8,
    layout_config = {
      preview_cutoff = 10,
      vertical = {
        prompt_position = "bottom",
        preview_cutoff = 30,
      },
      horizontal = {
        prompt_position = "bottom",
        preview_width = 0.6,
        preview_cutoff = 110,
      },
    },
    file_sorter = require("telescope.sorters").get_fzy_sorter,
  },
  extensions_list = { "themes", "terms", "workspaces", "lazygit", "spring" },
  extensions = {
    file_browser = {
      dir_icon_hl = "DiagnosticWarn",
    },
  },
}

M.devicons = devicons

M.gitsigns = {
  signs = {
    add = { text = "┃" },
    change = { text = "┃" },
    delete = { text = "┃" },
    topdelete = { text = "┃" },
    changedelete = { text = "┃" },
    untracked = { text = "┃" },
  },
  current_line_blame = true,
  current_line_blame_formatter = " <author>  <author_time:%Y-%m-%d> 󰏪 <summary>",
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = "eol",
    delay = 500,
    ignore_whitespace = true,
  },
}

return M
