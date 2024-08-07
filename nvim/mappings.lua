local M = {}

M.spectre = {
  n = {
    -- ["<leader>sp"] = {
    --   function()
    --     require("custom.configs.spectre").toggle()
    --   end,
    --   "open spectre",
    -- },
    ["<leader>sp"] = { "<CMD>Spectre<CR>", "open spectre" },
  },
}

M.persistence = {
  n = {
    ["<leader>qs"] = {
      function()
        require("persistence").load()
      end,
      "load persistence",
    },
    ["<leader>ql"] = {
      function()
        require("persistence").load { last = true }
      end,
      "load last persistence",
    },
    ["<leader>qd"] = {
      function()
        require("persistence").stop()
      end,
      "stop persistence",
    },
  },
}

M.noice = {
  n = {
    ["<leader>dn"] = { "<CMD>NoiceDismiss<CR>", "close all notify", opts = { nowait = true } },
  },
}

M.lazygit = {
  n = {
    ["<leader>gg"] = { "<CMD>LazyGit<CR>", "open lazygit", opts = { nowait = true } },
  },
}

M.diffview = {
  n = {
    ["<C-s>"] = {
      function()
        require("diffview.actions").toggle_files()
      end,
      "toggle diff files",
      opts = { nowait = true },
    },
    ["<leader>do"] = { "<ESC><CMD>DiffviewOpen<CR>", "diff view open", opts = { nowait = true } },
    ["<leader>dc"] = { "<ESC><CMD>DiffviewClose<CR>", "diff view close", opts = { nowait = true } },
    ["<CR>"] = {
      function()
        require("diffview.actions").select_entry()
      end,
      "select diff entry",
      opts = { nowait = true },
    },
  },
}

M.hop = {
  n = {
    ["<leader>jj"] = {
      "<ESC><CMD>HopPattern<CR>",
      "search word use pattern in hop",
      opts = { nowait = true },
    },
  },
}

M.gitsigns = {
  n = {
    ["<leader>gcb"] = {
      "<ESC><CMD>Gitsigns toggle_current_line_blame<CR>",
      "toggle git blame line",
      opts = { nowait = true },
    },
  },
}

M.db_ui = {
  n = {
    ["<leader>db"] = { "<ESC><CMD>bd|DBUI<CR>", "open database", opts = { nowait = true } },
    ["<leader>qe"] = { "<Plug>(DBUI_ExecuteQuery)", "execute Query", opts = { nowait = true } },
  },
}

M.telescope = {
  n = {
    -- find
    ["<leader>ff"] = {
      function()
        require("telescope.builtin").find_files {
          preview_title = "  Preview",
          prompt_title = "  Search Files",
          debounce = "300",
          file_ignore_patterns = {
            "node_modules",
            "%.png",
            "%.svg",
            "%.mp4",
            "%.jpg",
            "%.jpeg",
            "custom/assets",
            "assets/ascii",
            "static/js",
            "%.bundle.js",
            "%.mjs",
            "%.cjs",
            ".git",
            ".DS_Store",
          },
        }
      end,
      "Find files",
    },
    ["<leader>fo"] = {
      function()
        require("telescope.builtin").oldfiles {
          preview_title = "  Preview",
          prompt_title = "  Search Recent",
          debounce = "300",
        }
      end,
      "Find oldfiles",
    },
    ["<leader>fa"] = {
      function()
        require("telescope.builtin").find_files {
          preview_title = "  Preview",
          prompt_title = "  Search All Files",
          follow = true,
          no_ignore = true,
          hidden = true,
          debounce = "1000",
        }
      end,
      "Find all",
    },
    ["<leader>fs"] = {
      function()
        local conf = require("telescope.config").values
        require("telescope.builtin").live_grep {
          preview_title = "  Preview",
          prompt_title = "  Live Grep All Files",
          follow = true,
          no_ignore = true,
          hidden = true,
          debounce = "500",
          vimgrep_arguments = table.insert(conf.vimgrep_arguments, "--fixed-strings"),
          file_ignore_patterns = {
            "node_modules",
            "%.png",
            "%.svg",
            "%.mp4",
            "%.jpg",
            "%.jpeg",
            "custom/assets",
            "assets/ascii",
            "static/js",
            "%.bundle.js",
            "%.mjs",
            "%.cjs",
            ".git",
            ".DS_Store",
          },
        }
      end,
      "Telescope grep string",
    },
    ["<leader>fw"] = {
      function()
        local conf = require("telescope.config").values
        require("telescope.builtin").live_grep {
          preview_title = "  Preview",
          prompt_title = "  Live Grep",
          debounce = "500",
          vimgrep_arguments = table.insert(conf.vimgrep_arguments, "--fixed-strings"),
          file_ignore_patterns = {
            "node_modules",
            "%.png",
            "%.svg",
            "%.mp4",
            "%.jpg",
            "%.jpeg",
            "custom/assets",
            "assets/ascii",
            "static/js",
            "%.bundle.js",
            "%.mjs",
            "%.cjs",
            ".git",
            ".DS_Store",
          },
        }
      end,
      "Live grep",
    },
    -- ["<leader>fb"] = {
    --   function()
    --     require("telescope.builtin").buffers {
    --       preview_title = "  Preview",
    --       prompt_title = "  Search Buffers",
    --     }
    --   end,
    --   "Find buffers",
    -- },
    ["<leader>fh"] = {
      function()
        require("telescope.builtin").help_tags {
          preview_title = "  Preview",
          prompt_title = "  Search Help",
        }
      end,
      "Help page",
    },
    ["<leader>fz"] = {
      function()
        require("telescope.builtin").current_buffer_fuzzy_find {
          preview_title = "  Preview",
          prompt_title = "  Search Fzf",
        }
      end,
      "Find in current buffer",
    },
    ["<leader>ws"] = {
      "<CMD>Telescope workspaces<CR>",
      "open projects",
    },
    ["<leader>gs"] = {
      "<CMD>Telescope git_status<CR>",
      "open git status",
    },
    ["<leader>fb"] = {
      "<CMD>Telescope file_browser<CR>",
      "open file browser",
    },
    ["<leader>fn"] = {
      "<CMD>Telescope neorg find_linkable<CR>",
      "find neorg files",
      {
        noremap = true,
      },
    },
  },
}

M.whip = {
  n = {
    ["<leader>wo"] = { "<CMD>WhipOpen<CR>", "[W]hip [O]pen", opts = { nowait = true } },
    ["<leader>wm"] = { "<CMD>WhipMake<CR>", "[W]hip [M]ake", opts = { nowait = true } },
    ["<leader>wd"] = { "<CMD>WhipDrop<CR>", "[W]hip [D]rop", opts = { nowait = true } },
    ["<leader>wf"] = { "<CMD>WhipFindFile<CR>", "[W]hip [F]ile Search", opts = { nowait = true } },
    ["<leader>wg"] = { "<CMD>WhipFinGrep<CR>", "[W]hip [G]rep Search", opts = { nowait = true } },
  },
}

M.search_replace = {
  v = {
    ["<C-r>"] = {
      "<CMD>SearchReplaceSingleBufferVisualSelection<CR>",
      "Search Replace Visual",
      opts = { nowait = true },
    },
  },
}

M.disabled = {
  n = {
    ["q:"] = { "" },
    ["'"] = { "" },
    ['"'] = { "" },
  },
}

M.lspsaga = {
  n = {
    ["<leader>ca"] = { "<ESC><CMD>Lspsaga code_action<CR>", "LSP code action", opts = { nowait = true } },
    ["<leader>gn"] = { "<ESC><CMD>Lspsaga diagnostic_jump_next<CR>", "LSP code action", opts = { nowait = true } },
    ["<leader>rr"] = { "<CMD>Lspsaga rename<CR>", "LSP rename", opts = { nowait = true } },
    ["F"] = { "<ESC><CMD>Lspsaga finder<CR>", "LSP code Finder", opts = { nowait = true } },
    ["K"] = { "<ESC><CMD>Lspsaga hover_doc<CR>", "hover doc", opts = { nowait = true } },
    ["<leader>lo"] = { "<ESC><CMD>Lspsaga outline<CR>", "hover doc", opts = { nowait = true } },
    ["gd"] = { "<ESC><CMD>Lspsaga goto_definition<CR>", "Lspsaga goto definition", opts = { nowait = true } },
  },
}

M.general = {
  v = {
    ["<leader>fm"] = {
      "",
    },
  },
  n = {
    [":"] = { "<ESC>:", "command", opts = { noremap = true, nowait = true } },
    ["<Esc>"] = { "<CMD>noh<CR>", "Clear highlights", opts = { noremap = true, nowait = true } },
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader><tab>"] = { "<ESC><CMD>tabn<CR>", "move next tab", opts = { nowait = true } },
    -- ["<leader>rr"] = { "<CMD>lua require('nvchad.renamer').open()<CR>", "LSP rename", opts = { nowait = true } },
    -- ["K"] = { "<ESC><CMD>lua vim.lsp.buf.hover()<CR>", "hover doc", opts = { nowait = true } },
    ["<leader>fm"] = {
      function()
        vim.lsp.buf.format { async = true }
      end,
      "LSP formatting",
    },
    ["<leader>tc"] = {
      "<CMD>tabclose<CR>",
      "tap close",
    },
    ["<leader>tabnew"] = {
      "<CMD>tabnew<CR>",
      "tab new",
    },
  },
}

return M
