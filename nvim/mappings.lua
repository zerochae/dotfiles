local M = {}

M.twilight = {
  n = {
    ["<leader>tw"] = { "<ESC><CMD>Twilight<CR>", "toggle twilight", opts = { nowait = true } },
  },
}

M.sad = {
  v = {
    ["<leader>sa"] = {
      "<ESC><CMD>Sad <CR>",
      "search all replace",
      opts = { nowait = true },
    },
  },
}

M.mini = {
  n = {
    ["<leader>fe"] = {
      "<ESC><CMD>lua MiniFiles.open()<CR>",
      "MiniFiles open",
      opts = { nowait = true },
    },

    ["<C-s>"] = {
      "<ESC><CMD>lua MiniFiles.synchronize()<CR>",
      "MiniFiles synchronize",
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

M.git_conflict = {
  n = {
    ["<leader>gcb"] = {
      "<ESC><CMD>GitConflictChooseBase<CR>",
      "git conflict choose base",
      opts = { nowait = true },
    },
    ["<leader>gca"] = {
      "<ESC><CMD>GitConflictChooseBoth<CR>",
      "git conflict choose both",
      opts = { nowait = true },
    },
    ["<leader>gco"] = {
      "<ESC><CMD>GitConflictChooseOurs<CR>",
      "git conflict choose ours",
      opts = { nowait = true },
    },
    ["<leader>gct"] = {
      "<ESC><CMD>GitConflictChooseTheirs<CR>",
      "git conflict choose theirs",
      opts = { nowait = true },
    },
  },
}

M.neogit = {
  n = {
    ["<leader>gi"] = {
      "<ESC><CMD>Neogit<CR>",
      "open neogit",
      opts = { nowait = true },
    },
  },
}

M.neorg = {
  n = {
    ["<leader>rg"] = {
      "<ESC><CMD>Neorg index<CR>",
      "neorg index",
      opts = { nowait = true },
    },
    ["<leader>rs"] = {
      "<CMD>Telescope neorg find_linkable<CR>",
      "find linkable",
      opts = { silent = true },
    },
    ["<leader>ll"] = {
      "<CMD>Telescope neorg insert_file_link<CR>",
      "insert link",
      opts = { silent = true },
    },
  },
}

M.db_ui = {
  n = {
    ["<leader>db"] = { "<ESC><CMD>DBUI<CR>", "open database", opts = { nowait = true } },
    ["<leader>qe"] = { "<Plug>(DBUI_ExecuteQuery)", "execute Query", opts = { nowait = true } },
  },
}

M.zen_mode = {
  n = {},
}

M.octo = {
  n = {
    ["<leader>gg"] = {
      "<cmd>Octo<CR>",
      "run octo",
    },
  },
}

M.vimwiki = {
  n = {
    ["<leader>wt"] = { "<ESC><CMD>VimwikiTable<CR>", "make table in vimwiki", opts = { nowait = true } },
    ["<leader>wd"] = { "<ESC><CMD>VimwikiMakeDiaryNote<CR>", "make vimwiki today diary", opts = { nowait = true } },
  },
}

M.telescope = {
  n = {
    ["<leader>fs"] = { "<cmd> Telescope grep_string <CR>", "Telescope grep string" },
    ["<leader>fW"] = {
      '<esc><cmd> lua require("telescope").extensions.live_grep_args.live_grep_args { vimgrep_arguments = { "rg", "--hidden", "-L", "--color=never", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case" }}<cr>',
      "Telescope live grep args",
    },
  },
  i = {
    ["<C-k>"] = {
      '<esc><cmd>lua require("telescope-live-grep-args.actions").quote_prompt()<cr>',
      "live_grep_args actions quote prompt",
    },
    ["<C-i>"] = {
      '<esc><cmd>lua require("telescope-live-grep-args.actions").quote_prompt { postfix = " --iglob "<cr>',
      "live_grep_args actions quote prompt postfix --iglob",
    },
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

M.none = {
  n = {
    ["q:"] = { "", "Mapping none", opts = { noremap = true } },
    ["'"] = { "", "Mapping none", opts = { noremap = true } },
    ['"'] = { "", "Mapping none", opts = { noremap = true } },
  },
}

M.general = {
  n = {
    [":"] = { "<ESC>:", "command", opts = { noremap = true, nowait = true } },
    ["<Esc>"] = { "<CMD>noh<CR>", "Clear highlights", opts = { noremap = true, nowait = true } },
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader><tab>"] = { "<ESC><CMD>tabn<CR>", "move next tab", opts = { nowait = true } },
    ["<leader>rr"] = { "<CMD>lua require('nvchad.renamer').open()<CR>", "LSP rename", opts = { nowait = true } },
    ["<leader>ca"] = { "<ESC><CMD>Lspsaga code_action<CR>", "LSP code action", opts = { nowait = true } },
    ["<leader>gn"] = { "<ESC><CMD>Lspsaga diagnostic_jump_next<CR>", "LSP code action", opts = { nowait = true } },
    ["gd"] = { "<ESC><CMD>Lspsaga goto_definition<CR>", "Lspsaga goto definition", opts = { nowait = true } },
    ["<leader>zm"] = {
      "<ESC><CMD>lua require('zen-mode').toggle({window={width=.85}})<CR>",
      "toggle zen-mode",
      opts = { nowait = true },
    },
  },
}

return M
